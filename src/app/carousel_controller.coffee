class CarouselController
  constructor: ->
    @el = $('.carousel')
    @item = 0
    @el.addClass @item
    @forward = true
    @count = -1
    @countArray = ['first', 'second', 'third', 'fourth']
    window.App.WordpressFeed.on 'feed-loaded', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed.fetch 4, 'blog'

  template: (feedItem) =>
    @count += 1
    """
      <div class="carousel-item #{@countArray[@count]}">
        <img src="#{feedItem.image}" width="1024" height="400" alt="#{feedItem.description}" />
        <div class="carousel-details">
          <h2 class="carousel-title">#{feedItem.title}</h2>
          <p class="carousel-description">#{feedItem.description}</p>
          <a href="#{feedItem.url} class="carousel-link">#{feedItem.linkText}</a>
        </div>
      </div>
    """

  controls: =>
    radios = new String
    radios = radios + """<input type="radio" name="carousel" value="#{num}">""" for num in [0..3]
    '<div class="carousel-controls">' + radios + "</div>"

  render: =>
    @el.append @template(item) for item in @feed
    @el.append @controls()
    @el.find("input[value=\"#{@item}\"]").prop('checked', true)
    @el.find('input[name="carousel"]').on 'click', @goToItem
    @timerId = setInterval @goToNext, 10000

  goToItem: (e) =>
    clearInterval @timerId
    @el.removeClass @countArray[@item]
    @item = e.currentTarget.value
    @el.addClass @countArray[@item]

  goToNext: =>
    @el.removeClass @countArray[@item]
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
    @el.find("input[value=\"#{@item}\"]").prop('checked', true)
    @el.addClass @countArray[@item]

window.App.CarouselController = CarouselController