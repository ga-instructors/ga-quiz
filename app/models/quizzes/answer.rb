class Quizzes::Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment, touch: true
  belongs_to :question
  belongs_to :question_option, class_name: 'Quizzes::Question::Option'

  before_save :auto_grade, if: -> { assessment.finished_at? }
  def auto_grade
    if question.open_ended?
      self.grade = 0 if self[:answer].blank?
    elsif question_option.present?
      self.grade = question_option.grade
    end
  end

  after_save :mark_graded, unless: -> { assessment.answers.where(grade: nil).any? }
  def mark_graded
    assessment.touch(:graded_at)
  end

  # Markdown settings for @quiz.answer
  def answer
   if self[:answer].present?
     Redcarpet::Markdown.new(MarkdownPygments, {
       fenced_code_blocks: true,
       tables: true,
       no_intra_emphasis: true,
       escape_html: true
     }).render(CGI::escapeHTML(self[:answer])).html_safe
   else
     "<i>No Answer</i>".html_safe
   end
  end

  # Markdown settings for @quiz.question
  def reviewer_comment
    if self[:reviewer_comment].present?
      Redcarpet::Markdown.new(MarkdownPygments, {
        fenced_code_blocks: true,
        tables: true,
        no_intra_emphasis: true
      }).render(self[:reviewer_comment]).html_safe
    end
  end

end
