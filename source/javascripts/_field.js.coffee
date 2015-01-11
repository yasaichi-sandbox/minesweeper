class window.Field
  constructor: (args = {}) ->
    nRow = args.nRow
    nCol = args.nCol
    nMine = args.nMine

    # TODO 不完全なシャッフル
    mineLocation = [0..(nRow * nCol - 1)].sort(-> Math.random()-.5)[0..(nMine-1)]
    field = ([(nCol * r)..(nCol * (r+1) - 1)] for r in [0..(nRow-1)])

    @grids = []
    for r in [0..(nRow-1)]
      for c in [0..(nCol-1)]
        location = field[r][c]

        # TODO ほんとひどい実装
        number = ((field[r+i]?[c+j] in mineLocation for j in [-1..1]).sum() for i in [-1..1]).sum()
        number -= 1 if location in mineLocation

        grid = new Grid(mined: location in mineLocation, number: number)
        @grids.push(grid)
