
   // Enables string interpolation on string objects ect..
    String.prototype.supplant = function (o) {
      return this.replace(/{([^{}]*)}/g,
          function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
      });
    };
    L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zaGxiYWtlcjExIiwiYSI6ImE0ZjEzNjY0OGE5NzM0OWFlZTJiMzhjN2EwMjBjYmNiIn0.-X5q9AKOOsIA-OQPrbOPTw';

    getLocation();
    var map;

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
            console.log(navigator.geolocation.getCurrentPosition);
        } else { 
            console.log("Geolocation is not supported by this browser.");
        }
    }

    function showPosition(position) {
          var currentLng;
          var currentLat;

        currentLat = position.coords.latitude;
        currentLng = position.coords.longitude;
        // coordinates[0] = position.coords.latitude;
        // coordinates.push(position.coords.latitude);
        // coordinates[1] = position.coords.longitude;
        // coordinates.push(position.coords.longitude);
        console.log(currentLng);
      map = L.mapbox.map('map', 'joshlbaker11.n899ei0m', {
      center: [currentLat, currentLng],
      zoom: 13,
      minZoom: 2,
      zoomControl: false,
      maxBounds: [[-90, -180], [90, 180]]
    });
    }
    
    // showPosition();
    // console.log(currentLng);

    // var 

    

    // map.dragging.disable();
    map.touchZoom.disable();
    map.doubleClickZoom.disable();
    map.scrollWheelZoom.disable();

    var geocoder = L.mapbox.geocoder('mapbox.places-v1');

  