function initMap() {

    var directionsservice = new google.maps.directionsservice;

    var inputstart = document.getelementbyid('start-input');
    var searchboxstart = new google.maps.places.searchbox(inputstart);

    var inputend = document.getelementbyid('end-input');
    var searchboxend = new google.maps.places.searchbox(inputend);


    document.getelementbyid('submitbutton').addeventlistener('click', function () {
        var vzdialenost = 0;

        directionsservice.route({
            origin: inputstart.value,
            destination: inputend.value,
            travelmode: 'walking'
        }, function (response, status) {
            if (status === 'ok') {
                vzdialenost = response.routes[0].legs[0].distance.value;
                console.log(vzdialenost);
                var theform = document.getelementbyid('formular');

                var vzdialenostinput = document.createelement('input');
                vzdialenostinput.value = vzdialenost;
                vzdialenostinput.setattribute("name", "vzdialenost");
                console.log(vzdialenostinput);
                theform.appendchild(vzdialenostinput);

                theform.submit();

            } else {
                window.alert('directions request failed due to ' + status);
            }


        });


    });

}


