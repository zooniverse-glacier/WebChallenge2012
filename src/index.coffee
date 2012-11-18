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
    events: [
      date: "2012-11-17T17:17:31Z"
      stage: 1
      text: "event no 1"
    ,
      date: "2012-13-17T17:17:31Z"
      stage: 1
      text: "Event no 2" 
    ,
      date: "2012-15-17T17:17:31Z"
      stage: 2
      text: "Event no 3" 
    ,
      date: "2012-20-17T17:17:31Z"
      stage: 3
      text: "Event no 4" 
    ,
      date: "2012-24-17T17:17:31Z"
      stage: 4
      text: "Event no 5" 
    ]

    story: "Fjkjsldfj"
    updated_at: "2012-11-17T16:57:45Z"
    imageUrl : 'images/sampleSchool.jpg'
    projects: [
      "cost": 1000000
      "created_at": "2012-11-17T17:07:45Z"
      "description": "Some project"
      "enabled": true
      "id": 1
      "school_id": 1
      "updated_at": "2012-11-17T17:17:31Z"
    ]

  # map.addSchool sampleSchool
  new window.App.Timeline sampleSchool, '.schoolTimeline',500
