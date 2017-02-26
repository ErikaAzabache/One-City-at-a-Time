var map;

function getUserActions(){

  $.get('/user_actions.json',
          showMap);
}

function initMap(latitud, longitud) {

  var myLatLng = {lat: latitud, lng: longitud};

  // Create a map object and specify the DOM element for display.
  map = new google.maps.Map(document.getElementById('user-map'), {
    center: myLatLng,
    scrollwheel: false,
    zoom: 2,
    zoomControl: true,
    panControl: false,
    streetViewControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
}
  
function showMap(userActions) { 

      // center of the earth
      var center_lat = 34.5133;
      var center_long = -94.1629; 

      initMap(center_lat, center_long); 
      
      var i, place, marker, html;
      var infoWindow = new google.maps.InfoWindow({
      width: 150
      });
       
      var sav_icon = {
          url: '/static/js/icons/sav.png',
          scaledSize: new google.maps.Size(40, 40), // 256 × 256
          origin: new google.maps.Point(0, 0), 
          anchor: new google.maps.Point(0, 0) 
      };

      var hbh_icon = {
          url: '/static/js/icons/hbh.png',
          scaledSize: new google.maps.Size(40, 40), // 256 × 256
          origin: new google.maps.Point(0, 0), 
          anchor: new google.maps.Point(0, 0) 
      };

      for (i=0; i < userActions.length; i++) {    
        var one_action = userActions[i];
        console.log("Action code: " + one_action.action_code)

        var actionIcon;
        if (one_action.action_code == 'sav'){
          actionIcon = sav_icon;
          console.log("I'm a save");
        } else if (one_action.action_code == 'hbh'){
          actionIcon = hbh_icon;
          console.log("I'm a hbh");
        } else {
          actionIcon = '';
        }
        // Define the marker
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(parseFloat(one_action.place_latitud), parseFloat(one_action.place_longitud)),
            map: map,
            title: 'Name: ' + one_action.place_name,
            icon: actionIcon
        });

        // Define the content of the infoWindow
        html = (
            '<div class="window-content">' +
                '<p><b>Place: </b>' + one_action.place_name + '</p>' +
                '<p><b>Address: </b>' + one_action.place_address + '</p>' +
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

// google.maps.event.addDomListener(window, 'load', gettUserActions);

