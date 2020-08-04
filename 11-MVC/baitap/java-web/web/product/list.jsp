<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product List</h1>
<p>
    <a href="/products?action=create">Create new products</a>
</p>
<form method="get" action="/findName">
    <fieldset>
<p>Search name product : </p>
<input type="text" name="name" id="name" >
<input type="submit" value="View product">
    </fieldset>
</form>
<table border="1" style="border-collapse: collapse">
    <tr>
        <td>Name</td>
        <td>Country</td>
        <td>Species</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
        <c:forEach items='${requestScope["products"]}' var="product">
            <tr>
                <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getCountry()}</td>
                <td>${product.getSpecies()}</td>
                <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
                <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
            </tr>
        </c:forEach>
</table>
</body>
</html>
