class Project
  constructor: (opts) ->
    @[key] = value for key, value in opts

window.App.Project = Project
