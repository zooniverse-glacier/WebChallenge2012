class Model
  constrcutor: (opts) ->
    @id = opts.id

  base_url: 'url_here'

  trigger: (event, args...) ->
    $(document).trigger event, args

  on: (event, callback) ->
    $(document).on event, callback

  fetch: 
    $.getJSON "http://#{@base_url}/#{@url}/#{@id}.json", (data) ->
      @[key] = value for key, value in data
      @trigger 'fetch', @

window.App.Model = Model