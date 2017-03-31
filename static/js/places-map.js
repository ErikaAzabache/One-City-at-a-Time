var map;

function feedMap(){
  var formInputs = {
      "sort_type": "sort-default",
      "city_search": $("#hidden-span").html()
  };

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
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: MAPSTYLES
  });
}
  
  function showMap(resList) { 
    if (!resList){
      $('#results-map').html("No map to show");
    } else {
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
        width: 100
        });
         
        var sav_icon = {
            url: '/static/js/icons/sav.png',
            scaledSize: new google.maps.Size(40, 40), // 256 × 256
            origin: new google.maps.Point(0, 0), 
            anchor: new google.maps.Point(0, 20) 
        };

        var hbh_icon = {
            url: '/static/js/icons/hbh.png',
            scaledSize: new google.maps.Size(40, 40), // 256 × 256
            origin: new google.maps.Point(0, 0), 
            anchor: new google.maps.Point(0, 40) 
        };


        for (i=0; i < resList.length; i++) {    
          var place = resList[i];

          var actionIcon;
          if (jQuery.inArray("sav", resList[i].place_actions) > -1){
            actionIcon = sav_icon;
          } else if (jQuery.inArray("hbh", resList[i].place_actions) > -1){
            actionIcon = hbh_icon;
          } else {
            actionIcon = '';
          }
          // Define the marker
          marker = new google.maps.Marker({
              position: new google.maps.LatLng(parseFloat(place.latitud), parseFloat(place.longitud)),
              map: map,
              title: 'Name: ' + place.name,
              icon: actionIcon
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
