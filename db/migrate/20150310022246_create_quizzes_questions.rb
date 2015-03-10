class CreateQuizzesQuestions < ActiveRecord::Migration
  def change
    create_table :quizzes_questions do |t|
      t.references :quiz, index: true
      t.integer :ordinal
      t.text :question
      t.boolean :open_ended
      t.text :answer
      t.integer :answer_option_id
      t.text :answer_template

      t.timestamps null: false
    end
    add_foreign_key :quizzes_questions, :quizzes_quizzes, column: :quiz_id
  end
end
