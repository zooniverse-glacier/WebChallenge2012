google.load('feeds', 1)

class WordpressFeed extends window.App.Events
  @base_url: "https://pangeaeducation.wordpress.com/category/"
  @feeds: {}

  @fetch: (number=10, feed="blog") =>
    @feeds[feed] = new google.feeds.Feed "#{@base_url}#{feed}/feed/"
    @feeds[feed].setNumEntries number
    @feeds[feed].load (results) =>
      if not results.error 
        feedEntries = new Array
        feedEntries.push new @(entry) for entry in results.feed.entries
        @trigger "feed-loaded:#{feed}", feedEntries

  constructor: (entry) ->
    @title = entry.title
    @url = entry.link
    @description = entry.contentSnippet
    @content = entry.content
    @date = new Date entry.publishedDate
    @linkText = "Learn More"

    unless entry.mediaGroups[0].contents[1]?.url.split('?')[0]
      @image = 'images/carousel.jpg'
    else
      @image = entry.mediaGroups[0].contents[1]?.url.split('?')[0] + "?w=1000" || "http://placehold.it/1000x400"

window.App.WordpressFeed = WordpressFeed