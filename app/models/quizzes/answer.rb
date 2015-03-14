class Quizzes::Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  belongs_to :question
  belongs_to :question_option, class_name: 'Quizzes::Question::Option'

  # Markdown settings for @quiz.answer
  def answer
   if self[:answer].present?
      Redcarpet::Markdown.new(MarkdownPygments, {
        fenced_code_blocks: true,
        tables: true,
        no_intra_emphasis: true,
        escape_html: true,
      }).render(self[:answer]).html_safe
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
    elsif answer.present? || question_option.present?
      if grade == 1
        ["Fantastic!", "Good work!", "Great job!", "Well done!", "Correct"].sample
      elsif grade <= 75 && grade >= 25
        ["Not quite."].sample
      else
        "Incorrect"
      end
    else
      "<i>Reviewer did not leave a comment</i>".html_safe
    end
  end

end
