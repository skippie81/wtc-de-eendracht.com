$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
    $('[data-toggle="popover"]').popover({
        container: 'body',
        html: true,
        content : function() {
            return $(this).attr('data-content');
        },
        placement : 'left',
    })
})

function includeHTML() {
    var elements = document.getElementsByTagName("*");
    for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        var file = element.getAttribute("w3-include-html");
        if (file) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4) {
                    if (this.status == 200) {
                        element.innerHTML = this.responseText;
                    }
                    if (this.status == 404) {
                        element.innerHTML = "Page not found.";
                    }
                    element.removeAttribute("w3-include-html");
                    includeHTML();
                }
            }
            xhr.open("GET", file, true);
            xhr.send();
            return;
        }
    }
}