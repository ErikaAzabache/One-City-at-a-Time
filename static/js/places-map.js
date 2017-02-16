function initMap() {

  var myLatLng = {lat: 37.7749, lng: -122.431297}; //SF lat long

  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('results-map'), {
    center: myLatLng,
    scrollwheel: false,
    zoom: 5,
    zoomControl: true,
    panControl: false,
    streetViewControl: false,
    styles: MAPSTYLES,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });



  // Define global infoWindow (instead of inside a loop so you don't end up with several info windows open)

  var infoWindow = new google.maps.InfoWindow({
      width: 150
  });

  // Retrieving the information with AJAX
  $.get('/places-location.json', function (places) {
      
      var bear, marker, html;

      for (var key in places) {
          place = places[key];

          // Define the marker
          marker = new google.maps.Marker({
              position: new google.maps.LatLng(place.Lat, place.Long),
              map: map,
              title: 'Name: ' + place.name,
              icon: ''
          });

          // Define the content of the infoWindow
          html = (
              '<div class="window-content">' +
                  '<img src="/static/img/polarbear.jpg" alt="polarbear" style="width:150px;" class="thumbnail">' +
                  '<p><b>Bear gender: </b>' + bear.gender + '</p>' +
                  '<p><b>Bear birth year: </b>' + bear.birthYear + '</p>' +
                  '<p><b>Year captured: </b>' + bear.capYear + '</p>' +
                  '<p><b>Collared: </b>' + bear.collared + '</p>' +
                  '<p><b>Location: </b>' + marker.position + '</p>' +
              '</div>');

          // Inside the loop we call bindInfoWindow passing it the marker,
          // map, infoWindow and contentString
          bindInfoWindow(marker, map, infoWindow, html);
      }

  });

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

google.maps.event.addDomListener(window, 'load', initMap);
