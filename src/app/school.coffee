class School extends window.App.Model
  constructor: (opts) ->
    super opts

  @url: 'schools'

  fromJSON: (data) =>
    @[key] = value for key, value of data when key isnt 'projects'

window.App.School = School
