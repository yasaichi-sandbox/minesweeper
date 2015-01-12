class window.Game
  constructor: (args = {}) ->
    args.nRow ?= 5
    args.nCol ?= 5
    args.nMine ?= 5
    field = new window.Field(args)

    isCompleted = ->
      field.grids.every (grid) ->
        (grid.isRevealed() and not grid.isMined()) or (not grid.isRevealed() and grid.isMined())

    isOver = ->
      field.grids.some (grid) -> grid.isRevealed() and grid.isMined()

    @buildFiled = ->
      $grids = field.grids.map (grid) ->
        $('<li/>').addClass('grid').text('?').mousedown (e) ->
          return if isCompleted() or isOver()

          switch e.which
            when 3 # 左クリック
              if grid.setMarked()
                $(@).text('x')
              else if grid.setUnmarked()
                $(@).text('?')
            when 1 # 右クリック
              if not grid.setRevealed()
                return
              else if grid.isMined()
                $(@).text('●～*')
                alert('Game Over!')
              else
                $(@).text(grid.number)
                alert('Completed!') if isCompleted()

      $('<ul/>').addClass('field').append($grids)
