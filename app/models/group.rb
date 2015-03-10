class Group < ActiveRecord::Base
  has_many :quizzes, class_name: 'Quizzes::Quiz'
  has_many :group_members
  has_many :instructors, -> { where( group_members: { role: 'instructor' } ) }, through: :group_members, source: :user
  has_many :students, -> { where( group_members: { role: 'student' } ) }, through: :group_members, source: :user
end
