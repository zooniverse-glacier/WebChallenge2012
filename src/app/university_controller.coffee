class UniversityController extends window.App.Controller
  constructor: ->
    super '.universities', window.App.University

  renderAll: =>
    compiled = (@listTemplate(model) for key, model of @models)
    @el.html compiled.join(" ")
    header = 
      """
      <section class="normal">
        <h1><strong>PedU</strong></h1>
      </section>
      """

    @el.prepend header
    @startList @models

  listTemplate: (model) ->
    model.area_of_service = model.area_of_service || 'Not available'
    
    """
      <section class="school normal">
        <div class="image">
          <figure>
            <img src="#{model.image_url || '//placehold.it/128.png'}" />
          </figure>
        </div>

        <div class="content">
          <header>
            <div class="name">#{model.name}</div class="name">
          </header>
          <h4>Definition of Service</h4>
          <p>#{model.definition_of_service}</p>

          <h4>Area of Service</h4>
          <p>#{model.area_of_service}</p>
        </div>
      </section>
    """

  itemTemplate: (model) ->

window.App.UniversityController = UniversityController
