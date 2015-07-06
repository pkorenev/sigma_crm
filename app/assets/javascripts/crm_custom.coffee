$(document).on "click", "tr a[role=delete]", (event)->
  event.preventDefault()
  event.stopImmediatePropagation()
  $link = $(this)
  href = $link.attr("href")
  console.log("href: ", href)
  format = 'json'
  url = "#{href}.#{format}"
  $.ajax({
    type: 'delete'
    url: url
    success: ()->
      $tr = $link.closest('tr')
      #$tr.fadeOut()
      footable = $tr.closest("table").data("footable")
      footable.removeRow($tr)
  })





$(document).on "click", "a[type=delete]", ()->
  event.preventDefault()

  $link = $(this)
  href = $link.attr("href")
  console.log("href: ", href)
  format = 'json'
  url = "#{href}.#{format}"
  $.ajax({
    type: 'delete'
    url: url
  })