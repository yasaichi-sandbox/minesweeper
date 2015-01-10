#= require jquery
#= require_tree .
$ ->
  $(document).on('contextmenu', (e) -> false)
  game = new window.Game()

  for status, i in game.field()
    $li = $('<i/>').addClass('grid').addClass('grid')
    $li.attr({ 'data-grid-location': i })
    $li.text('□')

    $li.mousedown (e) ->
      return if game.isCompleted() or game.isOver()
      location = $(@).data('grid-location')

      switch e.which
        when 3
          game.mark(location)
          $(@).text('?') if game.field()[location] == 'marked'
        when 1
          game.reveal(location)

          if game.isCompleted()
            $(@).text('　')
            alert('Completed!')
          else if game.isOver()
            $(@).text('●～*')
            alert('Game Over!')
          else
            $(@).text('　')

    $('.field').append($li)
