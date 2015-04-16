require './lib/markdown_pygments'
require './lib/roman_numerals'

class Quizzes::Quiz < ActiveRecord::Base
  belongs_to :group
  has_many :assessments
  has_many :questions
  has_many :answers, through: :assessments

  after_initialize :ordinal
  validates :group, presence: true

  default_scope -> { order(:ordinal) }
  scope :active, -> { where('(quizzes_quizzes.start_at IS NULL OR NOW() > quizzes_quizzes.start_at) AND (quizzes_quizzes.end_at IS NULL OR NOW() < quizzes_quizzes.end_at)') }

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
