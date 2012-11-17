class CarouselController
  constructor: ->
    @el = '.carousel'
    window.App.WordpressFeed.on 'feed-loaded', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed 4, 'events'

  render: =>
    

window.App.CarouselController = CarouselController