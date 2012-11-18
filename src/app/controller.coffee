class Controller
  constructor: (@selector, @model) ->
    @el = $(@selector)
    @models = new Object
    @model.on 'fetch-all', (models) =>
      @models[model.name] = model for model in models
      @startRouting()
    @model.fetchAll()

  startRouting: =>
    $(window).on 'hashchange', @route
    @route()

  stopRouting: =>
    $(window).off 'hashchange'

  route: =>
    hash = location.hash
    if hash is ''
      @index()
    else
      @show hash

  index: =>
    @renderAll()

  show: (name) =>
    @renderOne @models[name]

  renderAll: =>
    @el.append @listTemplate(model) for key, model of @models
    @startList()

  renderOne: (id) =>
    model = @model[name]
    @el.append @itemTemplate(model)
    @start()

window.App.Controller = Controller
