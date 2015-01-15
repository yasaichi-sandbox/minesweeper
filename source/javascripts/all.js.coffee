#= require jquery
#= require_tree .

$ ->
  $(document).on('contextmenu', (e) -> false)

  $menu = $('#minesweeper .menu').submit (e) ->
    e.preventDefault() if e?

    args = {}
    $(@).serializeArray().forEach (o) -> args[o.name] = o.value
    game = new window.Game(args)

    $minesweeper = $('#minesweeper')
    $minesweeper.find('.field').remove()
    $minesweeper.append(game.field)

  $menu.submit()
