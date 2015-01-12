#= require jquery
#= require_tree .
$ ->
  $(document).on('contextmenu', (e) -> false)
  game = new window.Game()
  $('#minesweeper').append(game.buildFiled())

