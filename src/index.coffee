window.App = {}

$ ->
  map = new window.App.Map 
    element : 'map'

  schools = new Object

  App.School.on 'fetch-all', (models) ->
    map.addSchool model for model in models
  App.MarkFudge.fudge() 

  if location.pathname is '/schools'
    school_controller = new App.SchoolController()
  else if location.pathname is '/universities'
    university_controller = new App.UniversityController()

  sampleSchool = 
    location: [1.37,32.29]
    enabled: true
    id: 1
    name: "Test School"
    position: 0
    stage: 1
    story: "Fjkjsldfj"
    updated_at: "2012-11-17T16:57:45Z"
    imageUrl : 'images/sampleSchool.jpg'
    description: "blah blah blah"
    projects: [
      "cost": 1000000
      "created_at": "2012-11-17T17:07:45Z"
      "description": "Some project"
      "enabled": true
      "id": 1
      "school_id": 1
      "updated_at": "2012-11-17T17:17:31Z"
    ]

  map.addSchool sampleSchool