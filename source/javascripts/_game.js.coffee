class window.Game
  constructor: (args = {}) ->
    nRow =  Math.floor(args.nRow) || 5
    nCol =  Math.floor(args.nCol) || 5
    nMine = Math.floor(args.nMine) || 1
    field = new window.Field(nRow: nRow, nCol: nCol, nMine: nMine)

    isEnded = false

    isCompleted = ->
      field.grids.every (grid) ->
        (grid.isRevealed() and not grid.isMined()) or (not grid.isRevealed() and grid.isMined())

    isOver = ->
      field.grids.some (grid) -> grid.isRevealed() and grid.isMined()

    @field = new window.FieldDecorator(field).toDom().mousedown (e) =>
      if isEnded or e.which is 3
        return
      else if isCompleted()
        isEnded = true
        alert('Completed!')
      else if isOver()
        isEnded = true
        alert('Game Over!')
