template = (school) -> """
"""

class SchoolController extends window.App.Controller
  constructor: () ->
    super '.schools', window.App.School

  listTemplate: (model) ->
    """
      <section class="school normal">
        <div class="image">
          <figure>
            <div class="progress one-third"></div>
            <img src="#{model.imageUrl || '//placehold.it/100.png'}" />
          </figure>
        </div>

        <div class="content">
          <header>
            <div class="name">#{model.name}</div class="name">
            <div class="location">Kampala, Uganda</div>
          </header>
          <p>#{model.story}</p>
          <p><a href="#/#{model.id}">View site</a></p>
        </div>
      </section>
    """

  itemTemplate: (model) ->
    """
      <section class="school">
        <div class="image">
          <figure>
            <div class="progress one-third"></div>
            <img src="#{model.imageUrl || '//placehold.it/100.png'}">
          </figure>
        </div>

        <div class="content">
          <header>
            <div class="name">#{model.name}</div class="name">
            <div class="location">Kampala, Uganda</div>
          </header>
          <p>#{model.story}</p>
          <p><a href="#/#{model.id}">View site</a></p>
        </div>
      </section>

      <div id="timeline"></div>
    """

  startList: =>
    map = new window.App.Map(element: 'map')
    
  start: =>
    timeline = new window.App.Timeline("#timeline", @model, 1040)


window.App.SchoolController = SchoolController
