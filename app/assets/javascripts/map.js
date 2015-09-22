  // $(function(){

    // $.get("/maps.json",function(data){
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
          }
        );
    };
     // render map
    L.mapbox.accessToken = 'pk.eyJ1Ijoiam9zaGxiYWtlcjExIiwiYSI6ImE0ZjEzNjY0OGE5NzM0OWFlZTJiMzhjN2EwMjBjYmNiIn0.-X5q9AKOOsIA-OQPrbOPTw';
                           
    var map = L.mapbox.map('map', 'joshlbaker11.n899ei0m', {
              //user coords
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

      // $.get('https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&filters=category:food-and-drink&offset=0&limit=50&callback=JSON_CALLBACK', function(biz2Data) {
      //     biz2Data.forEach(function(biz){
      //       // console.log(taco);
      //       // var bLat = taco.lat;
      //       // var bLng = taco.lng;
      //       var data = jsonp.biz
      //       console.log(data)

      $.ajax({
            url: 'https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&filters=category:food-and-drink&offset=0&limit=50',
            dataType: 'jsonp',
            success: function(biz2Data) {
               
            // console.log(taco);
            // var bLat = taco.lat;
            // var bLng = taco.lng;

            var data = biz2Data.deals;
            // var bLat = biz2Data["options"][0]["redemptionLocations"][0]["lat"];
            // var bLng = biz2Data["options"][0]["redemptionLocations"][0]["lng"];
            // var name = biz2Data["tags"][0]["name"];
            
            // var link = biz2Data["merchant"]["websiteUrl"];
            // var phone = biz2Data["options"][0]["redemptionLocations"][0]["phoneNumber"];
            // showMarker(bLat,bLng, link, name, phone);
            // console.log(data.deals["options"][]["redemptionLocations"][0]["lat"]);
             for (i = 0; i < data.length; i++) {
                // console.log(data["options"][i]["redemptionLocations"][i]["lat"]);
                
                console.log(data[i]['options'][0]["redemptionLocations"][0]["lat"]);
                var bLat = data[i]['options'][0]["redemptionLocations"][0]["lat"];
                var bLng = data[i]['options'][0]["redemptionLocations"][0]["lng"];
                var name = data[i]["tags"][0]["name"];
                
                var link = data[i]["merchant"]["websiteUrl"];
                var phone = data[i]["options"][0]["redemptionLocations"][0]["phoneNumber"];
                showMarker(bLat,bLng, link, name, phone);
             };
            
            // console.log(data.["options"][0]["redemptionLocations"][0]["lat"]);
            }
             

            

            // showMarker(bLat,bLng, link, name, phone);
            
          });
        // });


    		
    






    	// console.log(data.latitude);
    	





      // });
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




