class window.Field
  constructor: (args = {}) ->
    nRow = args.nRow
    nCol = args.nCol
    nMine = args.nMine

    # TODO 不完全なシャッフル
    mineIndices = [0..(nRow * nCol - 1)].sort(-> Math.random()-.5)[0..(nMine-1)]

    getNeighborIndices = (index) ->
      [r, c] = [index // nCol, index % nCol]
      neighbors = (([i,j] for j in [-1..1] when not(i is 0 and j is 0)) for i in [-1..1]).flatten()
      (nCol * (r + i) + c + j for [i, j] in neighbors when 0 <= r + i < nRow and 0 <= c + j < nCol)

    @grids = [0..(nRow * nCol - 1)].map (index) ->
      number = getNeighborIndices(index).count((i) -> i in mineIndices)
      new Grid(mined: index in mineIndices, number: number)
