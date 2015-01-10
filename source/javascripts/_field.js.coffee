class window.Field
  constructor: (args = {}) ->
    indices = [0..(args.nRow * args.nCol - 1)]
    locations = [0..(args.nMine - 1)] # 地雷の場所を固定
    @grids = (new Grid(mined: i in locations) for i in indices)
