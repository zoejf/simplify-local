  // $(function(){


   // Enables string interpolation on string objects ect..
    String.prototype.supplant = function (o) {
      return this.replace(/{([^{}]*)}/g,
          function (a, b) {
              var r = o[b];
              return typeof r === 'string' || typeof r === 'number' ? r : a;
          }
        );
    };
     // render map
    L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zaGxiYWtlcjExIiwiYSI6ImE0ZjEzNjY0OGE5NzM0OWFlZTJiMzhjN2EwMjBjYmNiIn0.-X5q9AKOOsIA-OQPrbOPTw';
                           
    var map = L.mapbox.map('map', 'joshlbaker11.n899ei0m', {
              center: [37.7823712, -122.4068529],
              zoom: 15,
              minZoom: 2,
              zoomControl: false,
              maxBounds: [[-90, -180], [90, 180]]
    });
        // map.dragging.disable();
        map.touchZoom.disable();
        map.doubleClickZoom.disable();
        map.scrollWheelZoom.disable();
        // Disable tap handler, if present.
        if (map.tap) map.tap.disable();
    //set variables
    var geocoder = L.mapbox.geocoder('mapbox.places-v1');
    // function to show markers on map
    var showMarker = function(lng, lat) {
      // console.log("link in showMarker: ", link)
      L.mapbox.featureLayer({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [lng, lat]
        },
        properties: {
        	description: "testing 1212",
        // description: "<a href='" + link + "'>" + name + "</a>" + "<br>" + phone,
          // 'url': 'https://www.google.com',
          'marker-size': 'medium',
          'marker-color': '#0967A9',
          'marker-symbol': 'circle-stroked'
        }
      }).addTo(map);
    };
    // var currentUserId = $(this).attr(<% @user.id %>);

    // <%= @user.id %>
    // data-id="<%= @user.id %>"
    // var user_name = {@user};
    // console.log(user_name);



    $.get("/map.json",function(data){
    	// var uid = user.latitude;
    	console.log(data.latitude);
    	var lat = data.latitude;
    	var lng = data.longitude;
      // data.forEach(function(user){
    	// console.log('user whaaaa');
    //     var lat = parseFloat(businesses.lat);
    //     var lng = parseFloat(businesses.lng);
    //     var name = businesses.name;
    //     var id = businesses.id+'';
    //     var link = 'http://localhost:3000/businesses/{id}'.supplant({id: id})
    //     var phone = businesses.phone;     
        showMarker(lng, lat);
      // });
    });

 // });




