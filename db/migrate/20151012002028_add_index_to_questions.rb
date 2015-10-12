class AddIndexToQuestions < ActiveRecord::Migration
  def change
    execute <<-SQL
      DELETE FROM quizzes_answers
      WHERE id IN (SELECT id FROM (
        SELECT ROW_NUMBER() OVER(PARTITION BY question_id, assessment_id) AS count, id FROM quizzes_answers
      ) dups WHERE dups.count > 1);
    SQL
    add_index :quizzes_answers, [:assessment_id, :question_id], :unique => true
  end
end
