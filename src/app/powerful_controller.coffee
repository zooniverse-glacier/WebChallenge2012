class PowerfulController
  constructor: ->
    @el = $('#powerful')
    window.App.WordpressFeed.on 'feed-loaded:powerful', (feed) =>
      @feed = feed
      @render()
    window.App.WordpressFeed.fetch 10, 'powerful'
    console.log 'feed'

  template: (feedItem) =>
    """
      <div class="two columns">
        <div class="narrow column">
          <figure>
            <img src="#{feedItem.image}" />
          </figure>
        </div>
        
      <div class="wide column">
        <h4>#{feedItem.title}</h4>
        <p>#{feedItem.description} <a href="#{feedItem.url}">#{feedItem.linkText}</a></p>
      </div>
      """

  render: =>
    @el.append @template(item) for item in @feed

        
window.App.PowerfulController = PowerfulController