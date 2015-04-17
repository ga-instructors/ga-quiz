class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, class_name: 'GroupMember', dependent: :destroy
  has_many :groups, through: :memberships
  has_many :sessions
  has_many :answers, class_name: 'Quizzes::Answer'
  has_many :assessments, class_name: 'Quizzes::Assessment'

  has_many :quizzes, through: :groups

  validates :name, presence: true
  validates :email, presence: true, email: true

  def incomplete_quizzes
    quizzes.joins("LEFT OUTER JOIN quizzes_assessments ON quizzes_assessments.quiz_id = quizzes_quizzes.id AND quizzes_assessments.user_id = '#{id}'").where('quizzes_assessments.finished_at IS NULL')
  end

  def to_s
    name
  end

end
