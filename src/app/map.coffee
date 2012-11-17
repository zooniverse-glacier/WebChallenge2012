class Map 
  
  constructor: (opts) ->
    @el = opts.element
    opts.lat  || = 1.37
    opts.lng  || = 32.29
    @defaultZoom = opts.zoom || 7
    @styleUrl    = opts.styleUrl || "http://{s}.tile.cloudmade.com/703a104d15d44e2885f6cedeaaec6d30/78177/256/{z}/{x}/{y}.png"
    @center  = new L.LatLng(opts.lat, opts.lng)
    @setupMap()
    
  setupMap: ->
    if $("##{@el}").length >0
      @map = L.map @el,
        zoom: 13
      @map.setView(@center,@defaultZoom);
      @mainTileLayer = L.tileLayer @styleUrl
      @mainTileLayer.addTo(@map)
      @markerIcon = new L.icon
        iconUrl: "images/map-point.png"
        iconSize: new L.Point(14,16)
    else 
      console.log "could not find a map div"

  addSchool:(school)=>
    console.log(school.location)
    pos    = new L.LatLng(school.location[0], school.location[1])
    marker = new L.marker pos,
      icon : @markerIcon

    marker.bindPopup(@renderPopUp(school))
    marker.addTo(@map)

  renderPopUp:(school)->
    template = """
      <div class='schoolMapDetails'>
        <img src='#{school.imageUrl}'> </img>
        <h1>#{school.name}</h1>
        <p>#{school.description}</p>
      </div>
    """

window.App.Map = Map
