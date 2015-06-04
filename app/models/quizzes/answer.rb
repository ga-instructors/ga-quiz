class Quizzes::Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment, touch: true
  belongs_to :question
  belongs_to :question_option, class_name: 'Quizzes::Question::Option'

  before_create :use_template, :user
  after_save :mark_graded, unless: -> { assessment.answers.where(grade: nil).any? }

  def auto_grade
    if question.open_ended?
      self.grade = 0 if self[:answer].blank? || self[:answer] == question.answer_template
    elsif question_option.present?
      self.grade = question_option.grade
    end
  end

  def mark_graded
    assessment.touch(:graded_at)
  end

  def use_template
    unless self[:answer].present?
      self[:answer] = question.answer_template
    end
  end

  # Markdown settings for @quiz.answer
  def answer
    answer = self[:answer]
    renderer = MarkdownPygments
    answer = "```#{question.answer_format}\n#{answer}\n```" if question.answer_format
    renderer = Redcarpet::Render::HTML.new if question.answer_format == :text
    if answer.present?
      Redcarpet::Markdown.new(renderer, {
        fenced_code_blocks: true,
        tables: true,
        no_intra_emphasis: true,
        escape_html: true
      }).render(answer).html_safe
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

  def user
    unless super
      self.user = assessment.user
    end
  end

end
