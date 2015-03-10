class Group < ActiveRecord::Base
  has_many :quizzes, class_name: 'Quizzes::Quiz'
  has_many :group_members
end
