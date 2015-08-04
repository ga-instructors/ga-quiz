jQuery ->
  if (form = $('form.new_quizzes_question, form.edit_quizzes_question')).length

    # Open Ended / Multiple Choice Tabs
    form.on 'change', '#quizzes_question_open_ended_true', (event) ->
      $('.multiple-choice').hide()
      $('.open-ended').show()
    form.on 'change', '#quizzes_question_open_ended_false', (event) ->
      $('.open-ended').hide()
      $('.multiple-choice').show()
    $('#quizzes_question_open_ended_true:checked, #quizzes_question_open_ended_false:checked').trigger('change')

    form.on 'change', 'input#quizzes_question_answer_template', (event) ->
      if this.checked
        $('textarea#quizzes_question_answer_template').hide()
      else
        $('textarea#quizzes_question_answer_template').show()

    new_option_template = window.new_option_template = $('.option.new-record').clone()
    # quizzes_question[options_attributes][5]

    # Adding and Deleting Options
    $('.option input.option_label').on 'keydown', (event) ->

      # this.last_value prevents the option from being deleted too early
      if event.keyCode == 8 && this.value == ''
        deleted_row = $(this).closest('.row')
        previous_row = deleted_row.prevUntil('.field', '.row:visible')
        if previous_row.length > 1
          previous_row.find('input.option_label').focus()
          deleted_row.find('.destroy').val(true)
          deleted_row.slideUp(250)
          event.preventDefault()
        else

          console.log('BLAH')

