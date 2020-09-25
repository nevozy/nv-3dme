
addEventListener("message", function(event) {
    if (event.data.data) {
        if (event.data.data == "") {
            $("#3dme").fadeOut(500);
        } else {
            $("#3dme").fadeIn(500);
        }

        $("#3dme").html(event.data.data)
    }
});