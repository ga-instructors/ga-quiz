class AddGradedAtToQuizzesAssessments < ActiveRecord::Migration
  def change
    add_column :quizzes_assessments, :graded_at, :timestamp
  end
end
