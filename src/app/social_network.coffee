class SocialNetworks
  @facebookHref: ->
    title = 'Snapshot Serengeti'
    summary = 'I just classified this image on Snapshot Serengeti!'
    image = $("<a href='#{@location.standard[0]}'></a>").get(0).href
    """
    https://www.facebook.com/sharer/sharer.php
    ?s=100
    &p[url]=#{@talkHref()}
    &p[title]=#{encodeURIComponent title}
    &p[summary]=#{encodeURIComponent summary}
    &p[images][0]=#{image}
    """

  @twitterHref: ->
    message = "Classifying animals in the Serengeti! #{@talkHref()} #zooniverse"
    "http://twitter.com/home?status=#{encodeURIComponent message}"

  @pinterestHref: ->
    "http://pinterest.com/pin/create/button/?url=#{@talkHref()}"

window.App.SocialNetworks = SocialNetworks