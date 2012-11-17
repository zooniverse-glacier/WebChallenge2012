window.App = {}

$ ->
  map = new window.App.Map 
    element : 'map'


  App.School.fetchAll()
  App.MarkFudge.fudge() 

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