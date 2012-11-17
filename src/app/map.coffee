class School extends window.App.Model
  
  constructor: (opts) ->
    super opts
    @el = $(opts.element)
    opts.lat  || = 1.37
    opts.lng  || = 32.29
    @defaultZoom = opts.zoom || 13
    @styleUrl    = opts.styleUrl || "http://{s}.tile.cloudmade.com/703a104d15d44e2885f6cedeaaec6d30/78177/256/{z}/{x}/{y}.png"
    @center  = L.LatLng(opts.lat, opts.lng)

  setupMap: ->
    @map = L.map @el.attr('id')  
      center: [51.505, -0.09],
      zoom: 13
    @map.setView()
    @mainTileLayer = L.tileLayer @styleUrl
    @map.addTo(@map)




window.App.School = School
