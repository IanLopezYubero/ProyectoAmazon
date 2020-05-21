<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="amazon.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Amazon</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="recursos/css/index.css">
</head>
<body>
<%
BDController controladorBD = new BDController();
ArrayList<Amazon> amazons = controladorBD.dameAmazons();
System.out.println(amazons.size());
%>
<div class="container">
    <div class="row">
        <div class="col-12" align="center"><img src="recursos/images/logo/amazonlogo2.png" class="imagenLogo"></div>
    </div>
    <div class="row" align="center">
    <%for(int i = 0; i < amazons.size(); i++){ %>
        <div class="col-3"><a href="amazonMain.jsp?id_amazon=<%= amazons.get(i).getId_amazon() %>"><img src="recursos/images/paises/<%= amazons.get(i).getPais() %>.png" class="imagenPais"></a></div>
    <%} %>
    </div>
    <div class="row" align="center">
    <%for(int i = 0; i < amazons.size(); i++){ %>
        <div class="col-3"><h2><%= amazons.get(i).getPais() %></h2></div>
    <%} %>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>