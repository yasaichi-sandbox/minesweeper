class window.Game
  constructor: (args = {}) ->
    nRow =  Math.floor(args.nRow) || 5
    nCol =  Math.floor(args.nCol) || 5
    nMine = Math.floor(args.nMine) || 1
    field = new window.Field(nRow: nRow, nCol: nCol, nMine: nMine)

    isCompleted = ->
      field.grids.every (grid) ->
        (grid.isRevealed() and not grid.isMined()) or (not grid.isRevealed() and grid.isMined())

    isOver = ->
      field.grids.some (grid) -> grid.isRevealed() and grid.isMined()

    @buildFiled = ->
      $grids = field.grids.map (grid) ->
        $('<td/>').addClass('grid').text('?').mousedown (e) ->
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

      $rows = ($('<tr/>').addClass('row') for [1..nRow])
      $grids.forEach ($grid, i) -> $rows[i // nCol].append($grid)
      $('<table/>').addClass('field').append($rows)
