json.array!(@quizzes_answers) do |quizzes_answer|
  json.extract! quizzes_answer, :id, :grade, :reviewer_comment
  json.url quizzes_answer_url(quizzes_answer, format: :json)
end
