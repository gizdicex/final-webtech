function initMap() {

var directionsService = new google.maps.DirectionsService;

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
        theForm.appendChild(vzdialenostInput);


        theForm.submit();

    }else {
        window.alert('Directions request failed due to ' + status);
    }


});



});

}


