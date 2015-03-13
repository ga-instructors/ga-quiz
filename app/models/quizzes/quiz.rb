require './lib/markdown_pygments'
require './lib/roman_numerals'

class Quizzes::Quiz < ActiveRecord::Base
  belongs_to :group
  has_many :assessments
  has_many :questions

  after_initialize :ordinal
  validates :group, presence: true

  default_scope -> { order(:ordinal) }

  def ordinal
    self[:ordinal] ||= group ? (group.quizzes.maximum(:ordinal) || 0) + 1 : nil
  end

  def to_s
    "#{RomanNumeral.from_integer(ordinal)}: #{name}"
  end

  def introduction
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:introduction]).html_safe
  end

end
