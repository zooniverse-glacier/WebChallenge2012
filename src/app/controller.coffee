class Controller
  constructor: (@selector, @model) ->
    @el = $(@selector)
    @models = new Object
    @model.on 'fetch-all', (models) =>
      @models[model.name] = model for model in models
    @model.fetchAll()
    @startRouting()

  startRouting: =>
    window.on 'hashchange', @route
    @route()

  stopRouting: =>
    window.off 'hashchange'

  route: =>
    @hash = location.hash
    @el.empty()
    if @hash is ''
      @index()
    else
      @show hash

  index: =>
    @renderAll()

  show: (name) =>
    @renderOne @models[name]

window.App.Controller = Controller
