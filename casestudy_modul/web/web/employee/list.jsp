<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Note</title>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/asset/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/css/fontawesome.min.css">
    <link rel="stylesheet" href="/asset/css/brands.min.css">
    <link rel="stylesheet" href="/asset/css/all.min.css">
    <link rel="stylesheet" href="/asset/css/css.css">
</head>
<body>
<nav class="navbar  navbar-expand-md navbar-light bg-light sticky-top ">
    <div class="container-fluid">
        <a class="navbar-branch" href="index.jsp">
            <img src="/img/FURAMA.png" height="80">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#"><h4>Huỳnh Văn Thịnh</h4></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form method="post" action="/furamas">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/furamas?action=listEmployee">Employee</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/furamas?action=listCustomer">Customer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/furamas?action=listService">Service</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/furamas?action=listContract">Contract</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/furamas?action=listContractDetail">Contract Detail</a>
        </li>
        <li>
            <input type="hidden" name="action" value="findEmployee">
        </li>
        <li>
            <div class="input-group" id="adv-search">
                <input type="text" class="form-control" placeholder="Search for snippets" name="employeeName" />
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</form>
<div class="col-sm-12">
    <a href="/furamas?action=createEmployee" class="btn btn-secondary"> <span>Add New Employee</span></a>
</div>
<c:if test="${empty employeeList}">
    <div class="container alert alert-danger" role="alert">
      <h4> không có đối tượng</h4>
    </div>
</c:if>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Birth Day</th>
        <th>Id Card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Division</th>
        <th>Education Degree</th>
        <th>Position</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    
    <c:forEach var="employee" items="${employeeList}">
        
        <tr>
            <td><a href="/furamas?action=editEmployee&employeeId=${employee.employeeId}">
                <c:out value="${employee.employeeId}"/></a></td>
            <td><c:out value="${employee.employeeName}"/></td>
            <td><c:out value="${employee.employeeBirthday}"/></td>
            <td><c:out value="${employee.employeeIdCard}"/></td>
            <td><c:out value="${employee.employeeSalary}"/></td>
            <td><c:out value="${employee.employeePhone}"/></td>
            <td><c:out value="${employee.employeeEmail}"/></td>
            <td><c:out value="${employee.employeeAddress}"/></td>
            <td><c:out value="${employee.divisionName}"/></td>
            <td><c:out value="${employee.educationDegreeName}"/></td>
            <td><c:out value="${employee.positionName}"/></td>
            <td>
                <a href="/furamas?action=editEmployee&employeeId=${employee.employeeId}"  class="settings" title="Settings"
                   data-toggle="tooltip"><i class="fas fa-edit"></i></a>
                <a href="/furamas?action=deleteEmployee&employeeId=${employee.employeeId}" class="delete" title="Delete" id="delete"
                   data-toggle="tooltip" data-confirm="Are you sure to delete this item?"><i class="fas fa-trash-alt"></i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    <div class="container-fluid padding">
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<script src="../asset/scrip/scrip.js"></script>
</html>
