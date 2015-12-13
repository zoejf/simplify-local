
   // Enables string interpolation on string objects ect..
    String.prototype.supplant = function (o) {
      return this.replace(/{([^{}]*)}/g,
          function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
      });
    };
    L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zaGxiYWtlcjExIiwiYSI6ImE0ZjEzNjY0OGE5NzM0OWFlZTJiMzhjN2EwMjBjYmNiIn0.-X5q9AKOOsIA-OQPrbOPTw';


    function getLocation() {
      if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
            console.log(navigator.geolocation.getCurrentPosition);
      }  else { 
            console.log("Geolocation is not supported by this browser.");
        }
    };
                      
    getLocation();

    function showPosition(position) {
      var currentLng;
      var currentLat;

      currentLat = position.coords.latitude;
      currentLng = position.coords.longitude;
      console.log(currentLng);

      map = L.mapbox.map('map', 'joshlbaker11.n899ei0m', {
        center: [currentLat, currentLng],
        zoom: 13,
        minZoom: 2,
        zoomControl: false,
        maxBounds: [[-90, -180], [90, 180]]
      });
      map.touchZoom.disable();
      map.doubleClickZoom.disable();
      map.scrollWheelZoom.disable();

      var geocoder = L.mapbox.geocoder('mapbox.places-v1'); 
  };
  