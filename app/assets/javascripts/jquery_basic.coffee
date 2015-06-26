$(document). on "click", "a[type=delete].user-logout-button", (event)->
  event.preventDefault()
  $.ajax
    type: "delete"
    url: $(this).attr('href')
    complete: (response)->
      console.log "logout_response", response
      window.location.reload()