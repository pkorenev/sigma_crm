#$ ()->
#  $.fn.dataTableExt.sErrMode = true

$(document).on "ready", ()->
  $managers_table = $('#managers-table')


  $managers_table.on "click", "[role=row]", ()->
    #alert("hello")
    $row = $(this)
    $button = $row.find(".show-button")
    window.location.href = $button.attr('href')
    #$button.trigger('click')


  $managers_table.on "click", ".delete-button", (event)->
    event.preventDefault()
    event.stopImmediatePropagation()
    confirmed = confirm("delete?")

    if confirmed
      $.ajax
        url: $(this).attr("href") + '.json'
        type: "delete"
        success: ()->
          #alert("deleted successfully!")
          $(this).closest("tr").fadeOut()


