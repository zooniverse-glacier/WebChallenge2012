class Person extends window.App.Model
  constructor: (opts) ->
    super opts

  @url: 'people'

window.App.Person = Person