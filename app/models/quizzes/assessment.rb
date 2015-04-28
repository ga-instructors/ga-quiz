class Quizzes::Assessment < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user

  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers

  # Initiates Auto Grading Answers
  after_save if: :finished_at? do
    answers.each(&:save)
  end

  scope :finished, -> { where.not(finished_at: nil) }
  scope :unfinished, -> { where(finished_at: nil) }
  scope :completed,  -> { where('finished_at IS NOT NULL') }
  scope :incomplete, -> { where('finished_at IS NULL') }

  validates :quiz_id, uniqueness: { scope: :user_id, message: 'has already been started' }
  validate do
    if quiz.start_at? && Time.now < quiz.start_at
      errors.add(:quiz, 'is not available yet')
    elsif quiz.end_at? && Time.now > quiz.end_at
      errors.add(:quiz, 'is no longer available')
    end
  end
  validates :user, presence: true

  def questions
    quiz.questions.map do |question|
      [question, answers.find_or_create_by(question_id: question.id)]
    end
  end

  def finish
    touch(:finished_at)
  end

  #def readonly?
  #  true if graded_at?
  #end

end
