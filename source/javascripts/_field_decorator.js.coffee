class window.FieldDecorator extends window.BaseDecorator
  constructor: (field) ->
    super(object: field, tag: 'td')

    grids = GridDecorator.decorateCollection(@object.grids).map (grid, index, self) =>
      grid.toDom().mousedown (e) =>
        return if e.which is 3 or not (grid.object.number is 0) or grid.object.isMined()
        @object.getNeighborIndices(index).forEach (i) =>
          grids[i].mousedown() if self[i].object.isUnmarked()

    rows = ($('<tr/>').addClass('row') for [1..@object.nRow])
    grids.forEach (grid, i) => rows[i // @object.nCol].append(grid)

    @dom.addClass('field').append(rows)
