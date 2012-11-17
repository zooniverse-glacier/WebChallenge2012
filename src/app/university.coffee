class University extends window.App.Model
  constructor: (models=[]) ->
    super '.universities', window.App.University, models

  url: 'universities'

window.App.University = University