$(document).ready ->
  $('#login').click ->
    email = $('#username').val()
    password = $('#login_password').val()
    # Checking for blank fields.
    if email == '' or password == ''
      $('input[type="text"],input[type="password"]').css 'border', '2px solid red'
      $('input[type="text"],input[type="password"]').css 'box-shadow', '0 0 3px red'
      alert 'Please fill all fields'
    return
  return