﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PerpustakaanWeb.Petugas.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% //if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["role"] != null && HttpContext.Current.Session["role"].ToString() == "Petugas")
        if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
       { %>
    <div class="jumbotron">
        <h1>WELCOME PETUGAS</h1>
        <p class="lead"><%--ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.--%></p>
        <p><%--<a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a>--%></p>
    </div>
<div class="row">
        <div class="col-md-4">
            <h2><%--Getting started--%></h2>
            <p>
               <%-- ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.--%>
            </p>
            <p>
                <%--<a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4">
            <h2><%--Get more libraries--%></h2>
            <p>
               <%-- NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.--%>
            </p>
            <p>
                <%--<a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>--%>
            </p>
        </div>
        <div class="col-md-4">
            <h2><%--Web Hosting--%></h2>
            <p>
                <%--You can easily find a web hosting company that offers the right mix of features and price for your applications.--%>
            </p>
            <p>
                <%--<a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>--%>
            </p>
        </div>
    </div>
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
     <%
      }
      else
      {
          Response.Redirect("../LoginAnggota.aspx");
      }
    %>
</asp:Content>
