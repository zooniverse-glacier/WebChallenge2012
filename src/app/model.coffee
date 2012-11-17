class Model
  constrcutor: (opts) ->
    @id = opts.id

  base_url: 'url_here'

  fetch: 
    $.getJSON "http://#{@base_url}/#{@url}/#{@id}.json", (data) ->
      @[key] = value for key, value in data

window.App.Model = Model