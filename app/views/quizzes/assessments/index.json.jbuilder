json.array!(@quizzes_assessments) do |quizzes_assessment|
  json.extract! quizzes_assessment, :id, :quiz_id, :user_id, :student_comment, :finished_at
  json.url quizzes_assessment_url(quizzes_assessment, format: :json)
end
