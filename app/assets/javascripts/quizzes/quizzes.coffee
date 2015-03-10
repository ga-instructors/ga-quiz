jQuery ->
  if $('form.new_quizzes_quiz, form.edit_quizzes_quiz').length
    $start_at_checkbox = $('input#quizzes_quiz_start_at[type=checkbox]')
    $start_at_checkbox.on 'change', (event) ->
      $('select[id^="quizzes_quiz_start_at"]').attr('disabled', this.checked ? 'disabled' : '')
    $end_at_checkbox = $('input#quizzes_quiz_end_at[type=checkbox]')
    $end_at_checkbox.on 'change', (event) ->
      $('select[id^="quizzes_quiz_end_at"]').attr('disabled', this.checked ? 'disabled' : '')

