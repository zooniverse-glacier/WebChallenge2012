// Generated by CoffeeScript 1.3.3
(function() {
  var Map,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Map = (function() {

    function Map(opts) {
      this.centerSchool = __bind(this.centerSchool, this);

      this.addSchool = __bind(this.addSchool, this);
      this.el = opts.element;
      this.schoolZoom = 10;
      this.defaultZoom = opts.lat && opts.lng ? this.schoolZoom : 7;
      opts.lat || (opts.lat = 1.37);
      opts.lng || (opts.lng = 32.29);
      this.styleUrl = opts.styleUrl || "http://{s}.tile.cloudmade.com/703a104d15d44e2885f6cedeaaec6d30/40699/256/{z}/{x}/{y}.png";
      this.center = new L.LatLng(opts.lat, opts.lng);
      this.setupMap();
    }

    Map.prototype.setupMap = function() {
      if ($("#" + this.el).length > 0) {
        this.map = L.map(this.el, {
          zoom: this.defaultZoom
        });
        this.map.setView(this.center, this.defaultZoom);
        this.mainTileLayer = L.tileLayer(this.styleUrl);
        this.mainTileLayer.addTo(this.map);
        return this.markerIcon = new L.icon({
          iconUrl: "images/map-point.png",
          iconSize: new L.Point(14, 16)
        });
      } else {
        return console.log("could not find a map div");
      }
    };

    Map.prototype.addSchool = function(school) {
      var marker, pos;
      pos = new L.LatLng(school.lat, school.lng);
      marker = new L.marker(pos, {
        icon: this.markerIcon
      });
      return marker.addTo(this.map);
    };

    Map.prototype.centerSchool = function(school) {
      var center;
      center = new L.LatLng(school.lat, school.lng);
      return this.map.setView(center, this.schoolZoom);
    };

    Map.prototype.renderPopUp = function(school) {
      var template;
      return template = "<div class='schoolMapDetails'>\n  <img src='" + school.imageUrl + "'> </img>\n  <h1>" + school.name + "</h1>\n  <p>" + school.description + "</p>\n</div>";
    };

    return Map;

  })();

  window.App.Map = Map;

}).call(this);