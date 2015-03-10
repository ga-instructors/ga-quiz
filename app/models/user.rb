class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, class_name: 'GroupMember'
  has_many :sessions
  has_many :answers, class_name: 'Quizzes::Answer'
end
