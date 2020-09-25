
addEventListener("message", function(event) {
    if (event.data.data || event.data.data == "") {
        $("#3dme").html(event.data.data)
    }
});