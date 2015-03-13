class Quizzes::Question < ActiveRecord::Base
  belongs_to :quiz
  default_scope -> { order(:ordinal) }

  validates :quiz, presence: true

  # Markdown settings for @quiz.question
  def question
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:question]).html_safe
  end

  # --/ Multiple Choice \--
  
  class Quizzes::Question::Option < ActiveRecord::Base
    belongs_to :question
  end

  has_many :options
  belongs_to :answer_option, class_name: 'Quizzes::Question::Option'

  accepts_nested_attributes_for :options, allow_destroy: true,
    reject_if: proc { |attributes| attributes['label'].blank? }

  # --\ Multiple Choice /--

end
