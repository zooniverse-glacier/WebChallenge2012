class Events
  trigger: (event, args...) ->
    @constructor.trigger event, args

  @trigger: (event, args...) ->
    $(document).trigger event, args

  on: (event, callback) ->
    @constructor.trigger event callback

  @on: (event, callback) ->
    $(document).on event, (event, args...) ->
      callback args

window.App.Events = Events
