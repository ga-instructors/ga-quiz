require './lib/markdown_pygments'

class Quizzes::Quiz < ActiveRecord::Base
  belongs_to :group

  after_initialize :ordinal
  validates :group, presence: true

  def ordinal
    self[:ordinal] ||= group ? (group.quizzes.maximum(:ordinal) || 0) + 1 : nil
  end

  def introduction
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:introduction]).html_safe
  end

end
