$(document).ready(function () {
    //$('#birthTextBox').datepicker({
    //    format: "dd/mm/yyyy",
    //    weekStart: 6,
    //    clearBtn: true
    //});
    $("#form1").validate({
        rules: {
            patientNameTextBox: "required",
            birthTextBox: {
                required:true,
            },
            mobileTextBox: {
                required: true,
                minlength:9
            }
        },
        messages: {
            patientNameTextBox: "Patient name should be filled",
            birthTextBox: {
                required:"Birth date should be filled",
            },
            mobileTextBox: {
                required: "Mobile number should be filled",
                minlength:"Mobile number should be 9 character long"
            }
        }
    });
});