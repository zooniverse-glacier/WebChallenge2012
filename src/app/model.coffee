class Model
  constructor: (opts) ->
    @id = opts.id || opts.data.id
    @fromJSON opts.data if opts.data?

  @base_url: 'pedapi.herokuapp.com'

  trigger: (event, args...) ->
    @constructor.trigger event args

  @trigger: (event, args...) ->
    $(document).trigger event, args

  on: (event, callback) ->
    @constructor.trigger event callback

  @on: (event, callback) ->
    $(document).on event, callback

  fetch: =>
    $.getJSON "https://#{@constructor.base_url}/#{@constructor.url}/#{@id}.json", (data) ->
      @fromJSON(data)
    @trigger 'fetch', @

  fromJSON: (data) =>
    @[key] = value for key, value in data

  @fetchAll: ->
    $.getJSON "https://#{@base_url}/#{@url}.json", (data) ->
      models = new Array
      models.push new @(datum) for datum in data
      @trigger 'fetch-all', models

  @fetchById: ->
    $.getJSON "https://#{@base_url}/#{@url}.json", (data) ->
      model = new @(data)
      @trigger 'fetch', model


window.App.Model = Model