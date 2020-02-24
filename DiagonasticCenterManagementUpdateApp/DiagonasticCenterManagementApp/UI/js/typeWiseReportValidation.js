$(document).ready(function () {
    //$('#fromDateTextBox,#toDateTextBox').datepicker({
    //    format: "dd/mm/yyyy",
    //    weekStart: 6,
    //    clearBtn: true
    //});
    var tables = document.getElementsByTagName("table");
    if (tables.length === 0) {
        console.log("hidden");
        $("#totalDiv").hide();
    }
    $("#form1").validate({
        rules: {
            fromDateTextBox: {
                required: true,
},
            toDateTextBox: {
                required: true,
            }
        },
        messages: {
            fromDateTextBox: {
                required: "From Date Required",
            },
            toDateTextBox: {
                required: "To Date Required",
            }
        }
    });
});