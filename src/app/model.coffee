class Model
  constructor: (opts) ->
    @id = opts.id || opts.data.id
    @fromJSON opts.data if opts.data?

  @base_url: 'pedapi.herokuapp.com'

  trigger: (event, args...) ->
    @constructor.trigger event, args

  @trigger: (event, args...) ->
    $(document).trigger event, args

  on: (event, callback) ->
    @constructor.trigger event callback

  @on: (event, callback) ->
    $(document).on event, (event, args...) ->
      callback args

  fetch: =>
    $.getJSON "https://#{@constructor.base_url}/#{@constructor.url}/#{@id}.json?callback=?", (data) =>
      @fromJSON(data)
      @trigger 'fetch', @

  fromJSON: (data) =>
    @[key] = value for key, value of data

  @fetchAll: ->
    $.getJSON "https://#{@base_url}/#{@url}.json?callback=?", (data) =>
      models = new Array
      models.push new @({data: datum}) for datum in data
      @trigger 'fetch-all', models

  @fetchById: (id) ->
    $.getJSON "https://#{@base_url}/#{@url}/#{id}.json?callback=?", (data) ->
      model = new @({data: data})
      @trigger 'fetch', model


window.App.Model = Model