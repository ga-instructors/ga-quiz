jQuery ->
  form = $('form.edit_quizzes_assessment')
  submitForm = -> form.submit()
  form.find('input[type=radio]').on 'change', submitForm
  open_ended_answer_timer = null
  form.find('textarea').on 'keypress', ->
    clearTimeout(open_ended_answer_timer)
    open_ended_answer_timer = setTimeout(submitForm, 1000)
