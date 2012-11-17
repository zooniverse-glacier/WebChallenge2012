class CarouselController
  constructor: ->
    @el = '.carousel'
    @item = 0
    @el.addClass @item
    @forward = true
    window.App.WordpressFeed.on 'feed-loaded', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed 4, 'blog'

  template: (feedItem) =>
    """
      <div class="carousel-item">
        <img src="#{feedItem.image}" width="1040" height="350" alt="#{feedItem.description}" />
        <h2 class="carousel-title">#{feedItem.title}</h2>
        <p class="carousel-description">#{feedItem.description}</p>
        <a href="#{feedItem.url} class="carousel-link">#{feedItem.linkText}</a>
      </div>
    """

  render: =>
    @el.append template(item) for item in @feed
    @el.append '<div class="carousel-controls">'
    @el.append """<input type="radio" name="carousel" value="#{no}">""" for no in [0..3]
    @el.append '</div>'
    @el.find('input[name="carousel"]').on 'click', @goToItem
    setInterval @goToNext, 1000

  goToItem: (e) =>
    @el.removeClass @item
    @item = e.currentTarget.value
    @el.addClass @item

  goToNext: =>
    @el.removeClass @item
    if @forward
      if @item < 3
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
    @el.addClass @item

window.App.CarouselController = CarouselController