clients = $('.client')
client_search = $('#client_name')
mannager_connection = $("#manager_connection")

$("#client_group").change (e) ->
  client = $("option:selected", this)
  type = client.data('filter')

  if type == 0
    clients.show()
    client_search.val = ''
  else
    clients.hide().filter ->
      $(this).data('group') == type
    .show()
    client_search.val = ''

$("#manager_connection").change (e) ->
  client = $("option:selected", this)
  type = client.data('filter')

  if type == 0
    clients.show()
    client_search.val = ''
  else
    clients.hide().filter ->
      $(this).data('manager') == type
    .show()
    client_search.val = ''

$("#status").change (e) ->
  client = $("option:selected", this)
  type = client.data('filter')

  if type == 0
    clients.show()
    client_search.val = ''
  else
    clients.hide().filter ->
      $(this).data('status') == type
    .show()
    client_search.val = ''

$('#client_name').keyup ->
  filter = $(this).val()
  $('.manager-name').each ->
    if ($(this).text().search(new RegExp(filter, 'i')) < 0)
      $(this).closest('.client').addClass 'hidden'
    else
      $(this).closest('.client').removeClass 'hidden'