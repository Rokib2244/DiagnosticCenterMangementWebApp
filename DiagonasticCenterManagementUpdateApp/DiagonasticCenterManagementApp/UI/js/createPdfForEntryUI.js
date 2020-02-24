function generatePdf(parameters) {
    html2canvas(document.getElementsByTagName('table')[0], {
        onrendered:function(canvas) {
            var img = canvas.toDataURL("image/png");
            var doc = new jsPDF();
            var name = $("#patientNameTextBox").val();
            var birthDate = $("#birthTextBox").val().split("-").reverse().join("/");
            var mobileNumber = $("#mobileTextBox").val();
            var billNo = $("#billNo").val();
            doc.text("Patient Report", 92, 20);
            doc.text("Patient Name: " + name, 20, 40);
            doc.text("Date of Birth: " + birthDate, 20, 60);
            doc.text("Mobile No: " + mobileNumber, 20, 80);
            doc.text("Bill No: " + billNo, 20, 100);
            doc.text("Patient's Test", 92, 110);
            doc.addImage(img, "JPEG", 20, 120);
            doc.save("Entry.pdf");
        }
    });
}