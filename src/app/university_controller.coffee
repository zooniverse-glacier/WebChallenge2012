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
            <div class="location">Kampala, Uganda</div>
          </header>
          <p>#{model.definition_of_service}</p>
        </div>
      </section>
    """

  itemTemplate: (model) ->

window.App.UniversityController = UniversityController
