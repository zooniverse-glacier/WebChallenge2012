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
    @el.append @listTemplate(model) for key, model of @models
    @el.append '</ul>'

  renderOne: (id) =>
    model = @model[name]
    @el.append @itemTemplate(model)

window.App.Controller = Controller
