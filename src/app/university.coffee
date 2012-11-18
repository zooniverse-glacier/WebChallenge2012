class University extends window.App.Model
  constructor: (opts) ->
    super opts
    # super '.universities', window.App.University, models

  @url: 'universities'

window.App.University = University