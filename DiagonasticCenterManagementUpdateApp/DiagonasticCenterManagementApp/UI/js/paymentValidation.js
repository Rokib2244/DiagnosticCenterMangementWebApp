$("#form1").validate({
    rules: {
        billNoTextBox: {
            required: function() {
                if ($("#mobileNoTextBox").val().trim().length === 0) {
                    return true;
                } else {
                    return false;
                }
            }
        },
        mobileNoTextBox: {
            required:function() {
                if ($("#billNoTextBox").val().trim().length===0) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    },
    messages: {
        billNoTextBox: {
            required: "Bill No is Required"
        },
        mobileNoTextBox: {
            required:"Mobile No is Required"
        }
    }
});