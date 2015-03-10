json.array!(@quizzes_questions) do |quizzes_question|
  json.extract! quizzes_question, :id, :quiz_id, :ordinal, :question, :open_ended, :answer, :answer_option_id, :answer_template
  json.url quizzes_question_url(quizzes_question, format: :json)
end
