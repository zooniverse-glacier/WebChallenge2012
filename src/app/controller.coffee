class Controller
  constructor: (@selector, @model) ->
    @el = $(@selector)
    @models = new Array
    @model.on 'fetch-all', (models) =>
      @models = models
      @renderAll()
    @model.on 'fetch', (model) =>
      @models[model.id] = model
      @renderOne model.id

  starRouting: =>
    window.on 'hashchange', @route

  route: =>
    hash = parseInt location.hash
    @el.empty()
    if hash is ''
      @index()
    else
      @show hash

  index: =>
    @model.fetchAll()

  show: (id) =>
    if typeof @models[id] is 'undefined'
      @model.fetchById id
    else
      @renderOne id

window.App.Controller = Controller
