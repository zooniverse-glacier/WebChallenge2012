
class ProgressMeter extends window.App

  base_image: 'url'
  stage_urls: [
    'url_1'
    'url_2'
    'url_3'
  ]

  constructor: (opts) ->
    @el = $(opts.el)
    @stage = opts.stage || 0

  setupMeter: =>
    @el.append('img').attr('src',@base_image)

    for img_src in @stage_urls
      @el.append('img').attr('src', img_src).hide()

    if @stage is 1
      @el.children().get(@stage).show()

    if @stage is 2
      @el.children().get(@stage).show()

    if @stage is 3
      @el.children().get(@stage).show()


window.App.ProgressMeter = ProgressMeter