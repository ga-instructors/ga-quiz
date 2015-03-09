json.array!(@quizzes_quizzes) do |quizzes_quiz|
  json.extract! quizzes_quiz, :id, :group_id, :name, :start_at, :end_at, :introduction
  json.url quizzes_quiz_url(quizzes_quiz, format: :json)
end
