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
          index = $(@).index()
          if index % 3 is 0
            console.log 'first'
            $(@).find('.popup').addClass('first')

          if index % 3 is 1
            console.log 'second'
            $(@).find('.popup').addClass('second')

          if index % 3 is 2
            console.log 'third'
            $(@).find('.popup').addClass('third')
      ,
        ->
          $(@).find('.popup').removeClass('first second third')
    )

window.App.PeopleController = PeopleController