class Map 
  
  constructor: (opts) ->
    @el = opts.element
    @schoolZoom = 10

    @defaultZoom = if (opts.lat and opts.lng) then @schoolZoom else 7
    opts.lat  || = 1.37
    opts.lng  || = 32.29

    @styleUrl    = opts.styleUrl || "http://{s}.tile.cloudmade.com/703a104d15d44e2885f6cedeaaec6d30/40699/256/{z}/{x}/{y}.png"
    @center  = new L.LatLng(opts.lat, opts.lng)
    @setupMap()
    
  setupMap: ->
    if $("##{@el}").length > 0
      @map = L.map @el,
        zoom: @defaultZoom
      @map.setView(@center,@defaultZoom);
      @mainTileLayer = L.tileLayer @styleUrl
      @mainTileLayer.addTo(@map)
      @markerIcon = new L.icon
        iconUrl: "images/map-point.png"
        iconSize: new L.Point(14,16)
    else 
      console.log "could not find a map div"

  addSchool: (school) =>
    pos    = new L.LatLng(school.lat, school.lng)
    marker = new L.marker pos,
      icon : @markerIcon

    # marker.bindPopup(@renderPopUp(school))
    marker.addTo(@map)

  centerSchool: (school) =>
    center  = new L.LatLng(school.lat, school.lng)
    @map.setView center, @schoolZoom

  renderPopUp: (school) ->
    template = """
      <div class='schoolMapDetails'>
        <img src='#{school.imageUrl}'> </img>
        <h1>#{school.name}</h1>
        <p>#{school.description}</p>
      </div>
    """

window.App.Map = Map
