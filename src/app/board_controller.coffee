class PeopleController extends window.App.Controller
  constructor: (@personType) ->
    super ".#{@personType}", window.App.Person

  renderAll: =>
    @el.append @listTemplate(model) for key, model of @models when model.role isnt @personType
    @startList()

  listTemplate: (model) ->
    """
      <section class="board normal">
        <img src="#{model.image} || '//placehold.it/235x160.png'}" width="235" height="160" />
        <div class="popup">
          <span class="name">#{model.name}</span>
          <span class="email">#{model.email}</span>
          <span class="bio">#{model.bio}</span>
        </div>
      </section>
    """


window.App.Board = Board