class Quizzes::Assessment < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user

  has_many :answers
  accepts_nested_attributes_for :answers

  validates :quiz_id, uniqueness: { scope: :user_id, message: 'has already been started' }

  # Don't let students make changes to a finished assessment
  validate do
    errors.add(:base, 'Cannot update a completed assessment') unless finished_at.nil? || new_record?
  end

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
