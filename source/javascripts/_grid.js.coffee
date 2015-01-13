class window.Grid
  constructor: (args = {}) ->
    @mined  = args.mined is true
    @number = args.number || 0
    @status = 'unmarked'

  isMarked:   -> @status is 'marked'
  isMined:    -> @mined  is true
  isRevealed: -> @status is 'revealed'
  isUnmarked: -> @status is 'unmarked'

  setMarked:   -> if @isUnmarked() then @status = 'marked';   true else false
  setRevealed: -> if @isUnmarked() then @status = 'revealed'; true else false
  setUnmarked: -> if @isMarked()   then @status = 'unmarked'; true else false
