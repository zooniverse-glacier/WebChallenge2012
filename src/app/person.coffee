class Person extends Model
  constructor: (opts) ->
    super opts

  @url: 'people'

window.App.Person = Person