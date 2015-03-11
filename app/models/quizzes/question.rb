class Quizzes::Question < ActiveRecord::Base
  belongs_to :quiz

  def question
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:question]).html_safe
  end
end
