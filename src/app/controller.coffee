class Controller
  constructor: (@selector, @model, @models) ->
    @el = $(@selector)
    @models = new Object
    @model.on 'fetch-all', (models) =>
      @models[model.name] = model for model in models
    @model.fetchAll() unless @models.length isnt 0
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

  renderAll: =>
    @el.append '<ul class="school-list">'
    @el.append @listTemplate(model) for model in models
    @el.append '</ul>'

  renderOne: (id) =>
    model = @model[name]
    @el.append @itemTemplate(model)

window.App.Controller = Controller
