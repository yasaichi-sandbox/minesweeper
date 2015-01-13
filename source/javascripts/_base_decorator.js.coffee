# object <-> dom
class window.BaseDecorator
  constructor: (args = {}) ->
    @object = args.object
    @dom = $("<#{args.tag}/>")

  @decorateCollection: (collection) -> collection.map (o) => new @(o)

  toDom: -> $.extend(true, {}, @dom)
