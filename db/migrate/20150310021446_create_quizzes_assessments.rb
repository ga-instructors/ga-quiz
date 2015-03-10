class CreateQuizzesAssessments < ActiveRecord::Migration
  def change
    create_table :quizzes_assessments do |t|
      t.references :quiz, index: true
      t.references :user, index: true
      t.text :student_comment
      t.datetime :finished_at

      t.timestamps null: false
    end
    add_foreign_key :quizzes_assessments, :quizzes_quizzes, column: :quiz_id
    add_foreign_key :quizzes_assessments, :users
  end
end
