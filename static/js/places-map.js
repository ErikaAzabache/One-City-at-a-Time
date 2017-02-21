var map;

function feedMap(){
  // evt.preventDefault();
  console.log("FEEEEEEEED MAAAAAAAP");

  var formInputs = {
      "sort_type": "sort-default",
      "city_search": $("#hidden-span").html()
  };

  console.log("city map: "+ $("#hidden-span").html());

  $.get('/search.json',
          formInputs,
          showMap);
}

function initMap(latitud, longitud) {

  var myLatLng = {lat: latitud, lng: longitud};

  // Create a map object and specify the DOM element for display.
  map = new google.maps.Map(document.getElementById('results-map'), {
    center: myLatLng,
    scrollwheel: false,
    zoom: 12,
    zoomControl: true,
    panControl: false,
    streetViewControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
}
  
  function showMap(resList) { 
    if (!resList){
      console.log(!(resList));
      $('#results-map').html("No map to show");
    } else {
        // var cityLat = parseFloat(resList[0].city_lat);
        // var cityLong = parseFloat(resList[0].city_long);
        // initMap(cityLat, cityLong);
        var sum_lat = 0;
        var sum_long = 0;

        for (i=0; i < resList.length; i++) {    
          sum_lat = sum_lat + parseFloat(resList[i].latitud);
          sum_long = sum_long + parseFloat(resList[i].longitud);
        }

        var center_lat = sum_lat/(resList.length);
        var center_long = sum_long/(resList.length); 

        initMap(center_lat, center_long); 
        
        var i, place, marker, html;
        var infoWindow = new google.maps.InfoWindow({
        width: 150
        });

        for (i=0; i < resList.length; i++) {    
          place = resList[i];
          // Define the marker
          marker = new google.maps.Marker({
              position: new google.maps.LatLng(parseFloat(place.latitud), parseFloat(place.longitud)),
              map: map,
              title: 'Name: ' + place.name,
              icon: ''
          });

          // Define the content of the infoWindow
          html = (
              '<div class="window-content">' +
                  '<p><b>Place: </b>' + place.name + '</p>' +
                  '<p><b>Address: </b>' + place.address + '</p>' +
              '</div>');

          // Inside the loop we call bindInfoWindow passing it the marker,
          // map, infoWindow and contentString
          bindInfoWindow(marker, map, infoWindow, html);
        }

        function bindInfoWindow(marker, map, infoWindow, html) {
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.close();
                infoWindow.setContent(html);
                infoWindow.open(map, marker);
            });
        }
    }
}

// google.maps.event.addDomListener(window, 'load', initMap);
$("#search-button").on('click', feedMap);
$("#search-button-alt").on('click', feedMap);
