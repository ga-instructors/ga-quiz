class AddAnswerFormatToQuestion < ActiveRecord::Migration
  def change
    add_column :quizzes_questions, :answer_format, :string
  end
end
