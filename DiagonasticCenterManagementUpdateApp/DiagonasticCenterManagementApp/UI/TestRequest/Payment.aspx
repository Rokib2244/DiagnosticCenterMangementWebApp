<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.TestRequest.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
    <link href="../css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../css/navbarStyle.css" rel="stylesheet" />
    <link href="../css/payment.css" rel="stylesheet" />
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <form id="form1" runat="server">
        <div class="main-div">
            <div class="payment-search-div">
                <h3 style="text-align: center">Payment</h3>
                <div class="form-group">
                    <label for="patientNameTextBox" class="col-sm-2 control-label">Bill No:</label>
                    <div class="col-sm-10">
                        <input name="billNoTextBox" type="number" class="form-control" id="billNoTextBox" placeholder="Bill No" runat="server" /><span class="or">Or</span>
                    </div>
                    <br/>
                </div>
                <div class="form-group">
                    <label for="mobileNoTextBox" class="col-sm-2 control-label">Mobile No:</label>
                    <div class="col-sm-10">
                        <input name="mobileNoTextBox" type="text" class="form-control" id="mobileNoTextBox" placeholder="Mobile No" runat="server" /><input type="button" id="searchButton" value="Search" class="search btn btn-info" runat="server" OnServerClick="searchButton_OnServerClick"/>
                    </div>
                </div>
            </div>
            <br />
            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            <br/>
            <div class="payment-info-div">
                <div class="form-group">
                    <label for="amountTextBox" class="col-sm-2 control-label">Amount: </label>
                    <div class="col-sm-10">
                        <input name="amountTextBox" type="number" class="form-control" id="amountTextBox" placeholder="amount" runat="server" />
                    </div>
                    <br/>
                </div>
                <div class="form-group">
                    <label for="dueDateTextBox" class="col-sm-2 control-label">Due Date:</label>
                    <div class="col-sm-10">
                        <input name="dueDateTextBox" type="text" class="form-control" id="dueDateTextBox" placeholder="Due Date" runat="server" readonly="readonly"/><input type="button" id="payButton" value="Pay" class="search btn btn-info" runat="server" OnServerClick="payButton_OnServerClick"/>
                    </div>
                </div>
                <br />
                <asp:Label ID="paymentLabel" runat="server" Text=""></asp:Label>
                <br/>
            </div>
        </div>
    </form>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate.min.js"></script>
    <script src="../js/paymentValidation.js"></script>
</body>
</html>
