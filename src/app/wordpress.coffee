class Wordpress extends window.App.Model
  
  constructor: (opts) ->
    super opts
    @el = opts.element
    opts.lat  || = 1.37
    opts.lng  || = 32.29
    @defaultZoom = opts.zoom || 13
    @styleUrl    = opts.styleUrl || "http://{s}.tile.cloudmade.com/703a104d15d44e2885f6cedeaaec6d30/78177/256/{z}/{x}/{y}.png"
    @center  = new L.LatLng(opts.lat, opts.lng)
    @setupMap()
    
  setupMap: ->
    @map = L.map @el,
      zoom: 13
    @map.setView(@center,@defaultZoom);
    @mainTileLayer = L.tileLayer @styleUrl
    @mainTileLayer.addTo(@map)

  


window.App.Wordpress = Wordpress
