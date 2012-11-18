class PeopleController extends window.App.Controller
  constructor: (@personType) ->
    super ".#{@personType}", window.App.Person
    @run = false

  renderAll: =>
    unless @run
      @run = true
      roles = if @personType is 'board' then ['board_member'] else ['team', 'director', 'intern']
      @el.append @listTemplate(model) for key, model of @models when model.role in roles
      @startList()

  listTemplate: (model) ->
    """
    <div class="person">
      <div class="image" style="width: 225px; height: 160px; background-repeat: no-repeat; background-position: center; background-image: url(#{model.image_url || '//placehold.it/235x160.png'})"></div>
      <div class="popup">
        <span class="name"><h4>#{model.name}</h4></span>
        <span class="email"><a href="#{model.email}">#{model.email}</a></span>
        <span class="bio">#{model.bio}</span>
      </div>
    </div>
    """

  startList: ->
    console.log $('.person')
    $('.person').hover(
        ->
          $(@).find('.popup').show()
      ,
        ->
          $(@).find('.popup').hide()
    )

window.App.PeopleController = PeopleController