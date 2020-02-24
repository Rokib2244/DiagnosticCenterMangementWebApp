<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestType.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.Setup.TestTypeUI" %>
<%@ Import Namespace="DiagonasticCenterManagementApp.UI.Setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TestUI Type</title>
    <link type="text/css" rel="stylesheet" href="../font/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/navbarStyle.css" />
    <link rel="stylesheet" href="../css/testType.css" />
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <%--<div class="container">
        <div class="center-block test-type">
            <h4 class="h4">TestUI Type Setup</h4>
            <div class="type-name">
                <form id="form1" runat="server" class="form-inline">
                    <div class="form-group input-box">
                        <label for="typeName">Type Name</label>
                        <input type="text" class="form-control" id="typeNameTextBox" placeholder="TestUI type" runat="server" />
                    </div>
                    <button type="submit" class="btn btn-default" runat="server" id="saveButton">Save</button>
                  
                    
                </form>
            </div>
        </div>
    </div>--%>
    <div class="main-div">
        <h4 class="h4">Test type Setup</h4>
        <form runat="server">
            <div class="text-input-div">
                <div class="form-group input-box form-inline">
                    <label for="typeName">Type Name</label>
                    <input type="text" class="form-control" id="typeNameTextBox" placeholder="TestUI type" runat="server" />
                </div>
                <button type="submit" class="btn btn-default" runat="server" id="saveButton" OnServerClick="saveButton_Click">Save</button>
                <asp:Label ID="statusLabel" runat="server" Text="" CssClass="status-label"></asp:Label>
            </div>
            <br />
            <br/>
            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            <br/>
            <br/>
            <div class="test-type-div">
                <h4 class="h4">Test Types</h4>
                <asp:GridView ID="allTestTypeGridView" runat="server" CssClass="table show-all-type" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("TestTypeName")%>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
        </form>
    </div>
</body>
</html>
