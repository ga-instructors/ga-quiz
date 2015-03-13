class Quizzes::Assessment < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user

  has_many :answers
  accepts_nested_attributes_for :answers

  default_scope -> { joins(:quiz).order('quizzes_quizzes.ordinal') }
  scope :finished, -> { where('quizzes_assessments.finished_at IS NOT NULL') }

  validates :quiz_id, uniqueness: { scope: :user_id, message: 'has already been started' }
  validate do
    if Time.now < quiz.start_at
      errors.add(:quiz, 'is not available yet')
    elsif Time.now > quiz.end_at
      errors.add(:quiz, 'is no longer available')
    end
  end
  validates :user, presence: true

  scope :completed,  -> { where('finished_at IS NOT NULL') }
  scope :incomplete, -> { where('finished_at IS NULL') }

  def questions
    quiz.questions.map do |question|
      [question, answers.find_or_create_by(question_id: question.id)]
    end
  end

  def finish
    touch(:finished_at)
  end

end
