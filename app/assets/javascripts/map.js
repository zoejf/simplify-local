
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
      center: [37.775, -122.44],
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
                var name = data[i]["merchant"]["name"];
                
                var link = data[i]["merchant"]["websiteUrl"];
                var phone = data[i]["options"][0]["redemptionLocations"][0]["phoneNumber"];
                showMarker(bLat,bLng, link, name, phone);
             };
            }
          });
             
