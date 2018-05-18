$(function() {
    $.getJSON( "./getPaths.php", function( data ) {
        loadTable(data.data);
    });
});

function loadTable(data) {
    console.log(JSON.parse(data));
    var items = [];
    var oneline;
    $.each(JSON.parse(data), function (key, val) {
        oneline = "<tr><td>" + val.start + "</td><td>" + val.end + "</td><td>" + val.aktivnost + "</td><td>" + val.Vzdialenost/1000 + "km</td><td>" + val.Mode + "</td>";
        if(val.login) oneline += "<td>" + val.login + "</td>";
        oneline += "</tr>";
        items.push(oneline);
    });

    $("#tab-data").html(items.join(""));
}

var source = new EventSource('./getPaths.php');
source.onmessage = function(event) {
    loadTable(event.data);
};

