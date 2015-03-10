class Quizzes::Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  belongs_to :question
end
