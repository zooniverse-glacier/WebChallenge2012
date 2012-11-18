class PowerfulController
  constructor: ->
    @el = $('.powerful')
    window.App.WordpressFeed.on 'feed-loaded:powerful', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed.fetch 10, 'powerful'

  template: (feedItem) =>
    @count += 1
    """
      <div class="two columns">
        <div class="narrow column">
          <figure>
            <img src="#{feedItem.image}" />
          </figure>
        </div>
      <div class="wide column">
      """

        
window.App.PowerfulController = PowerfulController