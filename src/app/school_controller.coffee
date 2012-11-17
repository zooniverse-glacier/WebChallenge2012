template = (school) -> """
"""

class SchoolController extends window.App.Controller
  constructor: (models=[]) ->
    super '.schools', window.App.School, models

  listTemplate: (model) ->

  itemTemplate: (model) -> """
    <section class="school">
      <div class="image">
        <figure>
          <div class="progress one-third"></div>
          <img src="#{model.image || '//placehold.it/100.png'}" />
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

window.App.SchoolController = SchoolController
