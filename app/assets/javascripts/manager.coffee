managers = $('.manager')

$("#manager-category").change (e) ->
  manager = $("option:selected", this)
  type = manager.data('filter')

  if type == 0
    managers.show()
  else
    managers.hide().filter ->
      $(this).data('cat') == type
    .show()

$('#search-manager').keyup ->
  filter = $(this).val()
  $('.manager').each ->
    if ($(this).text().search(new RegExp(filter, 'i')) < 0)
      $(this).addClass 'hidden'
    else
      $(this).removeClass 'hidden'