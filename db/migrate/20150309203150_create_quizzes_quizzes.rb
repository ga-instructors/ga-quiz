class CreateQuizzesQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes_quizzes do |t|
      t.integer :group_id
      t.integer :ordinal
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.text :introduction

      t.timestamps null: false
    end
  end
end
