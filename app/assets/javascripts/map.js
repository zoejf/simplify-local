  // $(function(){

    $.get("/map.json",function(data){
    		var lat = data.latitude;
    		var lng = data.longitude;
    		// biz();
    	    // showMarker(lng, lat);


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
              //user coords
              center: [lat, lng],
              zoom: 16,
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
    var showMarker = function(lat, lng, link, name, phone) {
      // console.log("link in showMarker: ", link)
      L.mapbox.featureLayer({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [lng, lat]
        },
        properties: {
        description: "<a href='" + link + "'>" + name + "</a>" + "<br>" + phone,
          // 'url': 'https://www.google.com',
          'marker-size': 'medium',
          'marker-color': '#0967A9',
          'marker-symbol': 'circle-stroked'
        }
      }).addTo(map);
    };


    	$.get("/businesses.json", function(bizData) {
    			bizData.forEach(function(taco){
    				// console.log(taco);
    				var bLat = taco.lat;
    				var bLng = taco.lng;
    				var name = taco.name;
    				var id = taco.id+'';
    				var link = 'http://localhost:3000/businesses/{id}'.supplant({id: id})
    				var phone = taco.phone;  
    				showMarker(bLat,bLng, link, name, phone);
    				// console.log(bLat);
    			})
    		});


    		
    






    	// console.log(data.latitude);
    	





      });
    // });

 // });

  	// console.log(Business.all);
    // a.forEach(function(businesses){
  	// console.log('user whaaaa');
  	// console.log(businesses)
      // var name = businesses.name;
      // var id = businesses.id+'';
      // var link = 'http://localhost:3000/businesses/{id}'.supplant({id: id})
      // var phone = businesses.phone;  




