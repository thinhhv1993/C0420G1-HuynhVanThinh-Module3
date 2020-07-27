<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>list</title>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
            background: white;
            padding-bottom: 20px;
        }
        tr{
                border-bottom-style:solid ;
        }
    </style>
</head>
<body>
<div class="content" style="text-align: center ; height:506px; box-shadow: 0px 0px 29px 0px aquamarine  ">
<h2>Danh sách khách hàng</h2>
 <table  style="border-collapse: collapse;  padding-top: 20px;  line-height: 2.5 ; width: 100% ">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
     <c:forEach var="Customers" items="${listCustomer}">
         <tr >
            <td><c:out value="${Customers.getName()}"></c:out> </td>
            <td><c:out value="${Customers.getDate_of_birth()}"></c:out> </td>
            <td><c:out value="${Customers.getAddress()}"></c:out> </td>
            <td><img src="${pageContext.request.contextPath}/${Customers.getImage()}"/></td>

         </tr>
     </c:forEach>
<%--     <img src="<c:url ><value>/image/Capture.png</value></c:url> ">--%>
 </table>
</div>
</body>
</html>
