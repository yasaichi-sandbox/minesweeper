#= require jquery
#= require_tree .
$ ->
  $(document).on('contextmenu', (e) -> false)

  $('#menu').submit (e) ->
    e.preventDefault()

    $minesweeper = $('#minesweeper')
    $minesweeper.find('.field').remove()

    args = {}
    $(@).serializeArray().forEach (o) -> args[o.name] = o.value

    game = new window.Game(args)
    $minesweeper.append(game.field)
