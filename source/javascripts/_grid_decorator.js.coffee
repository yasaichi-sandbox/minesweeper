class window.GridDecorator extends window.BaseDecorator
  constructor: (grid) ->
    super(object: grid, tag: 'td')

    leftClick = =>
      unless @object.setRevealed()
        return
      else if @object.isMined()
        @dom.text('●～*')
      else
        @dom.text(@object.number)

    rightClick = =>
     if @object.setMarked()
        @dom.text('x')
     else if @object.setUnmarked()
        @dom.text('?')

    @dom.addClass('grid').text('?').mousedown (e) ->
      if e.which is 3
        rightClick()
      else  # TODO 左クリック以外も検出してしまう
        leftClick()
