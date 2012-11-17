window.App = {}

$ ->
  map = new window.App.Map 
    element : 'map'

  App.School.fetchAll()
  App.MarkFudge.fudge()


