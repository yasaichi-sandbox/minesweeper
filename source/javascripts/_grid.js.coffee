class window.Grid
  constructor: (args = {}) ->
    @mined  = if args.mined is true then true else false
    @number = args.number if args.number?
    @status = 'unmarked'

  isMarked:   -> @status is 'marked'
  isMined:    -> @mined  is true
  isRevealed: -> @status is 'revealed'
  isUnmarked: -> @status is 'unmarked'

  setMarked:   -> if @isUnmarked() then @status = 'marked';   true else false
  setRevealed: -> if @isUnmarked() then @status = 'revealed'; true else false
