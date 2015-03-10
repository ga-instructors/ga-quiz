class CreateQuizzesAnswers < ActiveRecord::Migration
  def change
    create_table :quizzes_answers do |t|
      t.references :user, index: true
      t.references :assessment, index: true
      t.references :question, index: true
      t.integer :question_option_id
      t.text :answer
      t.float :grade
      t.text :reviewer_comment

      t.timestamps null: false
    end
    add_foreign_key :quizzes_answers, :users
    add_foreign_key :quizzes_answers, :quizzes_assessments, column: :assessment_id
    add_foreign_key :quizzes_answers, :quizzes_questions, column: :question_id
  end
end
