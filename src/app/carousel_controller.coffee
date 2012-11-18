class CarouselController
  constructor: ->
    @el = $('.carousel')
    @item = 0
    @el.addClass @item
    @forward = true
    @count = -1
    @countArray = ['first', 'second', 'third', 'fourth']
    window.App.WordpressFeed.on 'feed-loaded:events', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed.fetch 4, 'events'

  template: (feedItem) =>
    @count += 1
    """
      <div class="carousel-item #{@countArray[@count]}">
        <img src="#{feedItem.image}" alt="#{feedItem.description}" />
        <div class="carousel-details">
          <h2 class="carousel-title">#{feedItem.title}</h2>
          <p class="carousel-description">#{feedItem.description}</p>
          <a href="#{feedItem.url}" class="carousel-link">#{feedItem.linkText}</a>
        </div>
      </div>
    """

  controls: =>
    """
      <div class="carousel-controls">
        <img class="front" src="/images/front-piece.png" />
        <img class="back" src="/images/back-piece.png" />
        <div id="first" data-id="0" class="circle"></div>
        <div id="second" data-id="1" class="circle"></div>
        <div id="third" data-id="2" class="circle"></div>
        <div id="fourth" data-id="3" class="circle"></div>
      </div>
    """

  render: =>
    @el.append @template(item) for item in @feed
    @el.append @controls()
    @el.find('.circle').on 'click', @goToItem
    @timerId = setInterval @goToNext, 10000

  goToItem: (e) =>
    clearInterval @timerId
    @el.removeClass @countArray[@item]
    @item = $(e.currentTarget).attr ('data-id')
    @el.addClass @countArray[@item]

  goToNext: =>
    @el.removeClass @countArray[@item]
    if @forward
      if @item < 1
        @item += 1
      else
        @forward = false
        @item -= 1
     else
       if @item > 0
         @item -= 1
       else
         @forward = true
         @item += 1
    @el.addClass @countArray[@item]

window.App.CarouselController = CarouselController