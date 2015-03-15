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

    new_option_template = window.new_option_template = $('.option.new-record').clone()
    # quizzes_question[options_attributes][5]

    # Adding and Deleting Options
    $('.option input.option_label').on 'keydown', (event) ->

      if event.keyCode == 13
        event.preventDefault()
        this_row = $(this).closest('.row')
        last_row = this_row.parent().find('.row:visible').last()

      # this.last_value prevents the option from being deleted too early
      if event.keyCode == 8 && this.value == ''
        deleted_row = $(this).closest('.row').hide()
        console.log previous_row = deleted_row.prev()
        previous_row.find('input.option_label').focus()



