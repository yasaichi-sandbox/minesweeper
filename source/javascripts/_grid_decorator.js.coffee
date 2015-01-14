class window.GridDecorator extends window.BaseDecorator
  constructor: (grid) ->
    super(object: grid, tag: 'td')

    leftClick = =>
      unless @object.setRevealed()
        return
      else if @object.isMined()
        @dom.addClass('is-revealed is-mined').append('<i class="fa fa-certificate"/>')
      else
        @dom.addClass('is-revealed')
        @dom.addClass("is-number-#{@object.number}").text(@object.number) unless @object.number is 0

    rightClick = =>
     if @object.setMarked()
        @dom.addClass('is-marked').append('<i class="fa fa-flag"/>')
     else if @object.setUnmarked()
        @dom.removeClass('is-marked').empty()

    @dom.addClass('grid').mousedown (e) ->
      if e.which is 3
        rightClick()
      else  # TODO 左クリック以外も検出してしまう
        leftClick()
