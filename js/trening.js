function initMap() {

    var directionsService = new google.maps.DirectionsService;
    var service = new google.maps.DistanceMatrixService;

    var inputStart = document.getElementById('start-input');
    var searchBoxStart = new google.maps.places.SearchBox(inputStart);

    var inputEnd = document.getElementById('end-input');
    var searchBoxEnd = new google.maps.places.SearchBox(inputEnd);



    document.getElementById('submitButton').addEventListener('click', function() {
        var vzdialenost = 0;

        directionsService.route({
            origin: inputStart.value,
            destination: inputEnd.value,
            travelMode: 'WALKING'
        },function(response, status) {
            if (status === 'OK') {
                vzdialenost = response.routes[0].legs[0].distance.value;
                console.log(vzdialenost);
                var theForm = document.getElementById('formular');

                var vzdialenostInput = document.createElement('input');
                vzdialenostInput.value = vzdialenost;
                vzdialenostInput.setAttribute("name","vzdialenost");
                vzdialenostInput.setAttribute("hidden","true");
                console.log(vzdialenostInput);
                theForm.appendChild(vzdialenostInput);
                theForm.submit();

            }else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    });

    var onChangeHandler = function() {
        if ((document.getElementById('start-input').value != '') && (document.getElementById('end-input').value != '')){
            //var latt = inputStart.value.geometry.location.lat();
            //var lngg = inputStart.value.geometry.location.lng();

            var mapOptions = {
                center: inputStart.value,
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var directionsDisplay = new google.maps.DirectionsRenderer;
            map = new google.maps.Map(document.getElementById("map"), mapOptions);
            directionsDisplay.setMap(map);

            calculateAndDisplayRoute(directionsService, directionsDisplay);
        }


    };

    document.getElementById('start-input').addEventListener('change', onChangeHandler);
    document.getElementById('end-input').addEventListener('change', onChangeHandler);

    function calculateAndDisplayRoute(directionsService, directionsDisplay) {

        directionsService.route({
            origin: inputStart.value,
            destination: inputEnd.value,
            travelMode:'DRIVING',
        }, function(response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
                document.getElementById('output').innerHTML += response.routes[0].legs[0].distance.value/1000 +"km";
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });


    }

}
