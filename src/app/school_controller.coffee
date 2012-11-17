class SchoolController extends window.App.Controller
  constructor: (models=[]) ->
    super '.schools', window.App.School, models

  listTemplate: (model) ->

  itemTemplate: (model) ->

window.App.SchoolController = SchoolController