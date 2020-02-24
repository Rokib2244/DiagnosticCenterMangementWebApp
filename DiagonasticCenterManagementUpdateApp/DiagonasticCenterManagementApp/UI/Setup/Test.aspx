<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.Setup.TestUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="../font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/navbarStyle.css" />
    <link rel="stylesheet" type="text/css" href="../css/test.css"/>
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <form id="form1" runat="server">
        <div class="main-div">
            <div class="test-input-field">
                <div class=form-horizontal" role="form">
                <div class="form-group">
                    <label for="testNameTextBox" class="col-sm-2 control-label">Test Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="testNameTextBox" placeholder="Test Name" runat="server"/>
                        <%--<asp:TextBox ID="testNameTextBox" runat="server" ></asp:TextBox>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="feeTextBox" class="col-sm-2 control-label">Fee</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="feeTextBox" placeholder="Fee" runat="server"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Test Type</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="testTypeDropDownList"  runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                
                

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="text-align: right">
                        <asp:Button ID="saveTypeNameButton" runat="server" CssClass="btn btn-info" Text="Save" OnClick="saveTypeNameButton_Click" />
                    </div>
                </div>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            </div>
            <div class="show-test-grid">
                <asp:GridView ID="showAllTestNameGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-hover table-striped">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("TestName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fee">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("Fee") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("TestType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
            </div>
        </div>
    </form>
</body>
</html>
