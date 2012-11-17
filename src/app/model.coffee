class Model
  constrcutor: (opts) ->
    @id = opts.id

  base_url: 'pedapi.herokuapp.com'

  trigger: (event, args...) ->
    $(document).trigger event, args

  on: (event, callback) ->
    $(document).on event, callback

  fetch: =>
    $.getJSON "http://#{@base_url}/#{@url}/#{@id}.json", (data) ->
      @fromJSON(data)
      @trigger 'fetch', @

  fromJSON: (data) =>
    @[key] = value for key, value in data

window.App.Model = Model