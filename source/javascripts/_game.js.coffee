class window.Game
  constructor: (args = {}) ->
    args.nRow ?= 5
    args.nCol ?= 5
    args.nMine ?= 5

    _nGrid = args.nRow * args.nCol
    _field = new window.Field(args)

    @field = -> (grid.status for grid in _field.grids)

    @mark = (location) ->
      grid = _field.grids[location]
      return if not grid? or @isCompleted() or @isOver()

      grid.status = 'marked'

    @reveal= (location) ->
      grid = _field.grids[location]
      return if not grid? or @isCompleted() or @isOver()

      grid.status = 'revealed'

    @isCompleted = ->
      _field.grids.every((gird) ->
        (gird.isRevealed() and not gird.isMined()) or (not gird.isRevealed() and gird.isMined())
      )

    @isOver = ->
      _field.grids.some((gird) -> gird.isRevealed() and gird.isMined())

