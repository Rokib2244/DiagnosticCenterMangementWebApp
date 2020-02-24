<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DiagonasticCenterManagementApp.UI.HomeUI" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HomeUI Page</title>
    <link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/navbarStyle.css"/>
    <link type="text/css" rel="stylesheet" href="css/home.css"/>
</head>
<body>
    <div class="title">
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>HomeUI</a>
        <a href="#">Setup</a>
        <a href="#">TestUI&nbsp;Request</a>
        <a href="#">Report</a>
        <%--<a href="#"><i class="fa fa-search fa-rotate-90 search" aria-hidden="true"></i></a>--%>
    </div>
    <div class="container">
        <div class="center-block home-page">
        <h2 class="h2">Diagonostic Center Bill Maangement System</h2>
        <ul class="list-unstyled list-inline ul-elements">
            <li class="list-inline-item btn btn-danger setup header-item">Setup
                <ul class="list-unstyled setup-ul">
                <li class="btn btn-default"><a href="Setup/TestType.aspx" class="another-page-link">Test type</a></li>    
                <li class="btn btn-default"><a href="Setup/Test.aspx" class="another-page-link">Test</a></li>
                </ul>
            </li>
            <li class="list-inline-item btn btn-danger test-request header-item">Test Request
                <ul class="list-unstyled setup-ul">
                <li class="btn btn-default"><a href="TestRequest/EntryUI.aspx" class="another-page-link">Entry</a></li>
                <li class="btn btn-default"><a href="TestRequest/Payment.aspx" class="another-page-link">Payment</a></li>
                </ul>
            </li>
            <li class="list-inline-item btn btn-danger report header-item">Report
                <ul class="list-unstyled setup-ul">
                <li class="btn btn-default"><a href="Report/TestWise.aspx" class="another-page-link">Test Wise</a></li>
                <li class="btn btn-default"><a href="Report/TypeWise.aspx" class="another-page-link">Type Wise</a></li>
                <li class="btn btn-default"><a href="Report/UnpaidBill.aspx" class="another-page-link">Unpaid Bill</a></li>
                </ul>
            </li>
        </ul>
        </div>
    </div>
    <form id="form1" runat="server">
        <div style="height: 268px">
            
        </div>
    </form>
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
