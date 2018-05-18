function demoFromHTML() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    source = $('#content')[0];

    specialElementHandlers = {
        '#bypassme': function (element, renderer) {
            return true
        }
    };
    margins = {
        top: 80,
        bottom: 60,
        left: 80,
        width: 700
    };
    pdf.fromHTML(
        source,
        margins.left,
        margins.top, {
            'width': margins.width,
            'elementHandlers': specialElementHandlers
        },

        function (dispose) {

            pdf.save('Test.pdf');
        }, margins);
}