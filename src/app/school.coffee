class School extends window.App.Model
  constructor: (opts) ->
    super opts
    @projects = new Array

  @url: 'schools'

  fromJSON: (data) =>
    @[key] = value for key, value of data when key isnt 'projects'
    # @projects.push new window.App.Project(project) for project in data['projects']

window.App.School = School
