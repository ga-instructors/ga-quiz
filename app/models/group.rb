class Group < ActiveRecord::Base
  has_many :quizzes
  has_many :group_members
end
