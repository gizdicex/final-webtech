function initMap() {

    var directionsservice = new google.maps.DirectionsService();

    var inputstart = document.getElementById('start-input');
    var searchboxstart = new google.maps.places.SearchBox(inputstart);

    var inputend = document.getElementById('end-input');
    var searchboxend = new google.maps.places.SearchBox(inputend);


    document.getElementById('submitButton').addEventListener('click', function () {
        var vzdialenost = 0;

        directionsservice.route({
            origin: inputstart.value,
            destination: inputend.value,
            travelmode: 'walking'
        }, function (response, status) {
            if (status === 'ok') {
                vzdialenost = response.routes[0].legs[0].distance.value;
                console.log(vzdialenost);
                var theform = document.getElementById('formular');

                var vzdialenostinput = document.creatEelement('input');
                vzdialenostinput.value = vzdialenost;
                vzdialenostinput.setAttribute("name", "vzdialenost");
                console.log(vzdialenostinput);
                theform.appendChild(vzdialenostinput);

                theform.submit();

            } else {
                window.alert('directions request failed due to ' + status);
            }


        });


    });

}


