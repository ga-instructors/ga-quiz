class Quizzes::Quiz < ActiveRecord::Base
  belongs_to :group

  def description
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    })
  end

end
