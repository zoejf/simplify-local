  $(function(){

    // $.get("/results.json",function(data){
    // 		var lat = 37.7577;
    // 		var lng = -122.4376;
    // 		// biz();
    	    // showMarker(lng, lat);

   // Enables string interpolation on string objects ect..
    String.prototype.supplant = function (o) {
      return this.replace(/{([^{}]*)}/g,
          function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
      });
    };
    L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zaGxiYWtlcjExIiwiYSI6ImE0ZjEzNjY0OGE5NzM0OWFlZTJiMzhjN2EwMjBjYmNiIn0.-X5q9AKOOsIA-OQPrbOPTw';
                           
    var map = L.mapbox.map('map', 'joshlbaker11.n899ei0m', {
      center: [37.7577, -122.4376],
      zoom: 13,
      minZoom: 2,
      zoomControl: false,
      maxBounds: [[-90, -180], [90, 180]]
    });
    // map.dragging.disable();
    map.touchZoom.disable();
    map.doubleClickZoom.disable();
    map.scrollWheelZoom.disable();

    var geocoder = L.mapbox.geocoder('mapbox.places-v1');

    var showMarker = function(lat, lng, link, name, phone) {
      L.mapbox.featureLayer({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [lng, lat]
        },
        properties: {
        description: "<a href='" + link + "'>" + name + "</a>" + "<br>" + phone,
          'marker-size': 'medium',
          'marker-color': '#0967A9',
          'marker-symbol': 'circle-stroked'
        }
      }).addTo(map);
    };
    $.getJSON("/results.json", function(data){
        console.log("test");
        data.forEach(function(taco){
          var lat = taco["deals"]["options"][0]["redemptionLocations"][0]["lat"]
          var lng = taco["deals"]["options"][0]["redemptionLocations"][0]["lng"]
          var name = taco["deals"]["merchant"]["name"]
          var link = taco["deals"]["merchant"]["websiteUrl"]
          console.log(taco);
          // var phone = taco["options"][0]["redemptionLocations"][0]["phoneNumber"];
          showMarker(lat, lng, name, link);
        })
    });
});
