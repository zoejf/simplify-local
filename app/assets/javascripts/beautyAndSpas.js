  var showBeautyAndSpas = function(lat, lng, link, name, previewImage, phone, productTitle, productPrice) {
      L.mapbox.featureLayer({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [lng, lat]
        },
        // console.log(link)
        properties: {
        description:  "<div id='biz'><a href='" + link + "' id='bizName'>" + name + "</a>" + "<br><strong> Featured Product Price: " + productPrice + "</strong>" + "<br>" + "<img src='" + previewImage + "' id='bizImage'>" + "<br>" + productTitle +"</div>",
          'marker-size': 'medium',
          'marker-color': '#FF3399',
          'marker-symbol': 'circle-stroked'
        }
      }).addTo(map);
      console.log(link)
    };

      $.ajax({
            url: 'https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&filters=category:beauty-and-spas&offset=0&limit=50',
            dataType: 'jsonp',
            success: function(biz2Data) {
            var data = biz2Data.deals;
             for (i = 0; i < data.length; i++) {
                // console.log(data["options"][i]["redemptionLocations"][i]["lat"]);
                
                
                var bLat = data[i]['options'][0]["redemptionLocations"][0]["lat"];
                var bLng = data[i]['options'][0]["redemptionLocations"][0]["lng"];
                
                var name = data[i]["merchant"]["name"];
                var link = data[i]["dealUrl"];
                var phone = data[i]["options"][0]["redemptionLocations"][0]["phoneNumber"];
                var previewImage = data[i]["mediumImageUrl"];
                var productTitle = data[i]["title"];
                var productPrice = data[i]["options"][0]["price"]["formattedAmount"];
                // var category = 

                showBeautyAndSpas(bLat,bLng, link, name, previewImage, phone, productTitle, productPrice);
             };
            }
          });


             
