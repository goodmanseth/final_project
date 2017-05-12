var geocoder;
var map;

function initMap() {
        var address = gon.address;
        //console.log(address)

        // initialize map
        var center = {lat: 0, lng: 0};
        var mapOptions = {
          zoom: 14,
          center: center
        };
        map = new google.maps.Map(document.getElementById('map'), mapOptions);

        // place map above address, with marker set to lat/lon
        var contentString = '<h4>' + gon.name1 + '</h4>' + '<br><p>' + gon.address + '</p>'
        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
        geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == 'OK') {
              map.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                map: map,
                animation: google.maps.Animation.DROP,
                position: results[0].geometry.location
              });
              marker.addListener('click', function() {
                infowindow.open(map, marker);
              });
            } else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
}
