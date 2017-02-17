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
  // var cityLat = resList[0].city_lat;
  // var cityLong = resList[0].city_long;

  var myLatLng = {lat: latitud, lng: longitud};

  // Create a map object and specify the DOM element for display.
  map = new google.maps.Map(document.getElementById('results-map'), {
    center: myLatLng,
    scrollwheel: false,
    zoom: 14,
    zoomControl: true,
    panControl: false,
    streetViewControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  // Define global infoWindow (instead of inside a loop so you don't end up with several info windows open)

  // var infoWindow = new google.maps.InfoWindow({
  //     width: 150
  // });

}
  
  function showMap(resList) { 
    var cityLat = parseFloat(resList[0].city_lat);
    var cityLong = parseFloat(resList[0].city_long);
    initMap(cityLat, cityLong) 

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
              '<p><b>Location: </b>' + marker.position + '</p>' +
          '</div>');

      // Inside the loop we call bindInfoWindow passing it the marker,
      // map, infoWindow and contentString
      bindInfoWindow(marker, map, infoWindow, html);
  }


  // feedMap();
  // This function is outside the for loop.
  // When a marker is clicked it closes any currently open infowindows
  // Sets the content for the new marker with the content passed through
  // then it open the infoWindow with the new content on the marker that's clicked
  function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function () {
          infoWindow.close();
          infoWindow.setContent(html);
          infoWindow.open(map, marker);
      });
  }
}

// google.maps.event.addDomListener(window, 'load', initMap);
$("#search-button").on('click', feedMap);
$("#search-button-alt").on('click', feedMap);
