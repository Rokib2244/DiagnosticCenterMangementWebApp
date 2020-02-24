<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBill.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.Report.UnpaidBill" %>

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
                    <br />
                </div>
                <div class="form-group">
                    <label for="toDateTextBox" class="col-sm-2 control-label">To Date:</label>
                    <div class="col-sm-10">
                        <input name="toDateTextBox" type="date" class="form-control" id="toDateTextBox" placeholder="dd/mm/yyyy" runat="server" /><input type="button" id="showButton" value="Show" class="search btn btn-info" runat="server" OnServerClick="showButton_OnServerClick"/>
                    </div>
                </div>
                <br/>
                <br/>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                <br/>
                <br />
            </div>
            <div class="type-wise-search-info">
                <asp:GridView ID="unpaidBillReportGridView" CssClass="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bill Number">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("BillNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact No">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Patient Name">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bill Amount">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("TotalFee") %>'></asp:Label>
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
        </div>
    </form>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <%--<script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datepicker.min.js"></script>--%>
    <script src="../../Scripts/jquery.validate.min.js"></script>
    <script src="../js/typeWiseReportValidation.js"></script>
</body>
</html>
