class Quizzes::Question < ActiveRecord::Base
  default_scope -> { order(:ordinal) }

  belongs_to :quiz
  has_many :answers

  validates :quiz, presence: true

  after_initialize :ordinal
  def ordinal
    self[:ordinal] ||= quiz ? (quiz.questions.maximum(:ordinal) || 0) + 1 : nil
  end

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
  
  def answer_text
    if open_ended?
      if self[:answer].present?
        self[:answer]
      elsif answer = answers.where(:grade => 1).first
        answer.answer + "*— #{answer.user.name}*"
      end
    elsif answer_option.present? then answer_option.label
    else options.where(grade: 1).pluck(:label).map { |label| '"'+label+'"' }.to_sentence
    end
  end

  def answer
    if answer_text
      Redcarpet::Markdown.new(MarkdownPygments, {
        fenced_code_blocks: true,
        tables: true,
        no_intra_emphasis: true
      }).render(answer_text).html_safe
    else
      "<i>Unknown</i>".html_safe
    end
  end

end
