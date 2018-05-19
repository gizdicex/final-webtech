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
        oneline = "<tr><td  onclick='consolea("+val.id+")'>" + val.start + "</td><td onclick='consolea("+val.id+")'>" + val.end + "</td><td onclick='consolea("+val.id+")'>" + val.aktivnost + "</td><td  onclick='consolea("+val.id+")'>" + val.Vzdialenost/1000 + "km</td><td  onclick='consolea("+val.id+")'>" + val.Mode + "</td><td onclick='spravAktivnu("+val.id+")'>"+ "Aktivuj" +"</td>";
        if(val.login) oneline += "<td>" + val.login + "</td>" ;
        oneline += "</tr>";
        items.push(oneline);
    });

    $("#tab-data").html(items.join(""));
}

var source = new EventSource('./getPaths.php');
source.onmessage = function(event) {
    loadTable(event.data);
};

function consolea(a){
    location.href = "tabulkaTras.php?id="+ a;

}

function OverUrl(){
    if (window.location.href.indexOf("id") > -1) {

        showImport();
    }
}

function spravAktivnu(a){
    location.href = "tabulkaTras.php?aktivuj="+ a;
    alert('Trasa bola aktivovaná');
}
