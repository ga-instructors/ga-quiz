jQuery ->
  if $('form.new_group, form.edit_group').length
    $start_at_checkbox = $('input#group_start_at[type=checkbox]')
    $start_at_checkbox.on 'change', (event) ->
      $('select[id^="group_start_at"]').attr('disabled', this.checked ? 'disabled' : '')
    $end_at_checkbox = $('input#group_end_at[type=checkbox]')
    $end_at_checkbox.on 'change', (event) ->
      $('select[id^="group_end_at"]').attr('disabled', this.checked ? 'disabled' : '')
