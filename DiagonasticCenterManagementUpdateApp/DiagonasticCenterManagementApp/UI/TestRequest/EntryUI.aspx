<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryUI.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.TestRequest.Entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="../font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link href="../css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/navbarStyle.css" />
    <link href="../css/requestEntry.css" rel="stylesheet" />
    
</head>
<body>
    <!-- #include file="../partials/navbar.htm" -->
    <form id="form1" runat="server">
        <div class="main-div">
            <h3 style="text-align: center">Test Request Entry</h3>
            <div class="test-input-field">
                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="patientNameTextBox" class="col-sm-2 control-label">Name Of the Patient</label>
                        <div class="col-sm-10">
                            <input name="patientNameTextBox" type="text" class="form-control" id="patientNameTextBox" placeholder="Patient Name" runat="server" />
                            <%--<asp:TextBox ID="testNameTextBox" runat="server" ></asp:TextBox>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthTextBox" class="col-sm-2 control-label">Date Of Birth</label>
                        <div class="col-sm-10">
                            <input name="birthTextBox" type="date" class="form-control" id="birthTextBox" placeholder="dd/mm/yyyy" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobileTextBox" class="col-sm-2 control-label">Mobile No</label>
                        <div class="col-sm-10">
                            <input name="mobileTextBox" type="text" class="form-control" id="mobileTextBox" placeholder="Mobile No" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Select Test</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="selectTestDropDownList" runat="server" CssClass="form-control" OnSelectedIndexChanged="selectTestDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group" id="feeDiv">
                        <label for="feeTextBox" class="col-sm-2 control-label">Fee</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="feeTextBox" placeholder="Fee" runat="server" readonly="readonly" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10 add-button" style="text-align: right">
                            <asp:Button ID="addButton" runat="server" CssClass="btn btn-info" Text="Add" OnClick="addButton_Click" />
                        </div>
                    </div>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                    <asp:Label ID="successEntryLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="show-test-grid">
                    <div id="grid">
                    <asp:GridView ID="showAllTestEntryGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table show-all-entries">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("TestName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Fee") %>'></asp:Label>
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
                    <div id="totalAndSaveDiv">
                    <div class="form-group" id="totalDiv">
                        <label for="totalTextBox" class="col-sm-2 control-label">Total</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="totalTextBox" placeholder="Total" runat="server" readonly="readonly" style="text-align: center;">
                        </div>
                    </div>
                    <input type="button" class="btn btn-info" value="PDF" onclick="generatePdf()"/>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10 total-button" style="text-align: right">
                            <asp:Button ID="saveButton" runat="server" CssClass="btn btn-info" Text="Save" OnClick="saveButton_Click" />
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="billNo" value="" runat="server"/>
        </div>
    </form>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <%--<script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datepicker.min.js"></script>--%>
    <script src="../../Scripts/jquery.validate.min.js"></script>
    <script src="../js/testEntryFormValidation.js"></script>
    <script src="../js/jspdf.min.js"></script>
    <script src="../js/html2canvas.min.js"></script>
    <script src="../js/hideSaveButton.js"></script>
    <script src="../js/createPdfForEntryUI.js"></script>

</body>
</html>
