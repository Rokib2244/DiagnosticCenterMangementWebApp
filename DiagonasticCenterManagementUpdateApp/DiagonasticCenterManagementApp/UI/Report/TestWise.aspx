<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestWise.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.Report.TestWise" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/navbarStyle.css" rel="stylesheet" />
    <link href="../css/testWiseReport.css" rel="stylesheet" />
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <form id="form1" runat="server">
        <div class="main-div">
            <div class="test-wise-search">
                <h3 style="text-align: center">Test Wise Report</h3>
                <div class="form-group">
                    <label for="fromDateTextBox" class="col-sm-2 control-label">From Date:</label>
                    <div class="col-sm-10">
                        <input name="fromDateTextBox" type="date" class="form-control" id="fromDateTextBox" placeholder="dd/mm/yyyy" runat="server" />
                    </div>
                    <br />
                </div>
                <div class="form-group">
                    <label for="toDateTextBox" class="col-sm-2 control-label">To Date:</label>
                    <div class="col-sm-10">
                        <input name="toDateTextBox" type="date" class="form-control" id="toDateTextBox" placeholder="dd/mm/yyyy" runat="server" /><input type="button" id="showButton" value="Show" class="search btn btn-info" runat="server" onserverclick="showButton_OnServerClick" />
                    </div>
                </div>
            </div>
            <br />
            <br />
            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <div class="test-wise-search-info">
                <asp:GridView ID="testWiseReportGridView" runat="server" CssClass="table show-all-test" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle VerticalAlign="Middle" />
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("TestName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Test">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("TotalTest") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Amount">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
            
            <div class="form-group" id="totalDiv">
                <label for="totalTextBox" class="col-sm-2 control-label" id="totalLabel">Total:</label>
                <div class="col-sm-10">
                    <input name="totalTextBox" type="number" class="form-control" id="totalTextBox" placeholder="Total" runat="server" readonly="readonly" />
                </div>
                <br />
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
