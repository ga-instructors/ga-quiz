class CreateQuizzesQuestionOptions < ActiveRecord::Migration
  def change
    create_table :quizzes_question_options do |t|
      t.references :question, index: true
      t.string :label
      t.float :grade

      t.timestamps null: false
    end
    add_foreign_key :quizzes_question_options, :quizzes_questions, column: :question_id
  end
end
