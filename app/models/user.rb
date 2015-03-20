class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, class_name: 'GroupMember', dependent: :destroy
  has_many :groups, through: :memberships
  has_many :sessions
  has_many :answers, class_name: 'Quizzes::Answer'
  has_many :assessments, class_name: 'Quizzes::Assessment'

  has_many :quizzes, through: :groups

  validate :name, presence: true
  validate :email, presence: true

  def to_s
    name
  end

end
