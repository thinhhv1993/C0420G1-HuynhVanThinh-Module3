<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/8/2020
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to customer list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Country: </td>
        <td>${requestScope["product"].getCountry()}</td>
    </tr>
    <tr>
        <td>Species: </td>
        <td>${requestScope["product"].getSpecies()}</td>
    </tr>
</table>
</body>
</html>
