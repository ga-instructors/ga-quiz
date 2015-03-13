class Quizzes::Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  belongs_to :question
  belongs_to :question_option, class_name: 'Quizzes::Question::Option'

  # Markdown settings for @quiz.answer
  def answer
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true,
      escape_html: true,
    }).render(self[:answer]).html_safe if self[:answer]
  end

  # Markdown settings for @quiz.question
  def reviewer_comment
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:reviewer_comment]).html_safe if self[:reviewer_comment]
  end

end
