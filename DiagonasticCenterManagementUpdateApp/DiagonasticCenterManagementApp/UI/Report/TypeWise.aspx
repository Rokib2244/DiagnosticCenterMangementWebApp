<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeWise.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.Report.TypeWise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="../css/navbarStyle.css" rel="stylesheet" />
    <link href="../css/testWiseReport.css" rel="stylesheet" />
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <form id="form1" runat="server">
    <div class="main-div">
        <div class="type-wise-search">
            <h3 style="text-align: center">Type Wise Report</h3>
                <div class="form-group">
                    <label for="fromDateTextBox" class="col-sm-2 control-label">From Date:</label>
                    <div class="col-sm-10">
                        <input name="fromDateTextBox" type="date" class="form-control" id="fromDateTextBox" placeholder="dd/mm/yyyy" runat="server" />
                    </div>
                    <br/>
                </div>
                <div class="form-group">
                    <label for="toDateTextBox" class="col-sm-2 control-label">To Date:</label>
                    <div class="col-sm-10">
                        <input name="toDateTextBox" type="date" class="form-control" id="toDateTextBox" placeholder="dd/mm/yyyy" runat="server" /><input type="button" id="showhButton" value="Show" class="search btn btn-info" runat="server" OnServerClick="showhButton_OnServerClick"/>
                    </div>
                </div>
        </div>
        <div class="type-wise-search-info">
            <asp:GridView ID="typeWiseReportGridView" runat="server" AutoGenerateColumns="false">
                                
            </asp:GridView>
        </div>
    </div>
    </form>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <%--<script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datepicker.min.js"></script>--%>
    <script src="../../Scripts/jquery.validate.min.js"></script>
    <script src="../js/typeWiseReportValidation.js"></script>
</body>
</html>
