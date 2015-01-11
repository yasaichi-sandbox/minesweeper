Function::property = (prop, desc) ->
    Object.defineProperty @prototype, prop, desc

class window.Grid
  constructor: (args) ->
    _mined = if args.mined is true then true else false
    @isMined = -> _mined

    @_number = if args.number? then args.number else 0
    @_status = 'unmarked'

  @property 'number',
    get: -> @_number

  @property 'status',
    get: -> @_status
    set: (status) ->
      return if @_status is 'revealed'
      @_status = status if status in ['marked', 'revealed', 'unmarked']

  isRevealed: -> @_status is 'revealed'
  isMarked: -> @_status is 'marked'
