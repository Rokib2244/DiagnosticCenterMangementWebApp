$(document).ready(function() {
    var tables = document.getElementsByTagName("table");
    if (tables.length === 0) {
        console.log("total Hidden");
        $("#totalAndSaveDiv").hide();
    }
});