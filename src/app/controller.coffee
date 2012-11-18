class Controller
  constructor: (@selector, @model) ->
    @el = $(@selector)
    @models = new Object
    @model.on 'fetch-all', (models) =>
      @models[model.slug] = model for model in models
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
      @renderAll()
    else
      slug = hash.substr(2, hash.length - 2)
      @renderOne @models[slug]

  renderAll: =>
    compiled = (@listTemplate(model) for key, model of @models)
    @el.html compiled.join(" ")
    header = 
      """
      <section class="normal">
        <h1><strong>Our Schools</strong></h1>
      </section>
      """

    @el.prepend header
    @startList @models

  renderOne: (model) =>
    @el.html @itemTemplate(model)
    header = 
      """
      <section class="normal">
        <h1><strong>#{model.name}</strong></h1>
      </section>
      """
    @el.prepend header
    @start model

  startList: =>

  start: =>

window.App.Controller = Controller
