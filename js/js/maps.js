var baseMap;
var geocoder;
var baseMapMarkers = [];

$(function(){
    geocoder = new google.maps.Geocoder();
    baseMap = new google.maps.Map(document.getElementById('map'), {
        zoom: 8,
        center: {lat: 0, lng: 0}
    });

    setMap("school_addr");
});

function setMap(option) {

    clearMarkers();

    $.get( "getAddress.php?option="+option, function(data) {
        console.log("server call succeed");

        var data = JSON.parse(data);
        console.log(data);

        var bounds = new google.maps.LatLngBounds();

        data.forEach(function (element) {

            var url_addr = encodeURIComponent(element);
            $.getJSON('geocode.php?addr='+url_addr, function(data) {
                var results = data.results,
                    status = data.status;

                if (status == google.maps.GeocoderStatus.OK) {
                    console.log("OK");
                    var marker = new google.maps.Marker({
                        title: element,
                        map: baseMap,
                        position: results[0].geometry.location
                    });
                    baseMapMarkers.push(marker);
                    bounds.extend(marker.position);
                    baseMap.fitBounds(bounds);
                }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        });

    }).fail(function() {
        console.log("server call failed - Unable to load map");
    });
}

function changeOption() {
    var select = document.getElementById("sel1");
    if(select.selectedIndex == 0) setMap("addr");
    else if(select.selectedIndex == 1) setMap("school_addr");
}

function clearMarkers() {
    baseMapMarkers.forEach(function (element) {
        element.setMap(null);
    });
    baseMapMarkers = [];
}
