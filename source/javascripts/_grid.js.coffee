Function::property = (prop, desc) ->
    Object.defineProperty @prototype, prop, desc

class window.Grid
  constructor: (args) ->
    _mined = if args.mined is true then true else false

    @isMined = -> _mined
    @_status = 'unmarked'

  @property 'status',
    get: -> @_status
    set: (status) ->
      return if @_status is 'revealed'
      @_status = status if status in ['marked', 'revealed', 'unmarked']

  isRevealed: -> @_status is 'revealed'
  isMarked: -> @_status is 'marked'
