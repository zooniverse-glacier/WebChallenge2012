window.App = {}

$ ->
  if location.pathname is '/schools.html'
    schoolController = new App.SchoolController()
    universityController = new App.UniversityController()
  else if location.pathname is '/' or location.pathname is '/index.html'
    imageCarousel = new App.CarouselController()
  else if location.pathname is '/about.html'
    boardContoller = new App.PeopleController 'board'
    teamController = new App.PeopleController 'team'

  for el in $('.countdown')
    new App.Countdown {el, target: new Date 2013, 0, 15}
