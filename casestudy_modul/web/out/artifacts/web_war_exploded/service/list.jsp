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
            <input type="hidden" name="action" value="findService">
        </li>
        <li>
            <div class="input-group" id="adv-search">
                <input type="text" class="form-control" placeholder="Search for snippets" name="serviceName" />
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
    <a href="/furamas?action=createService" class="btn btn-secondary"> <span>Add New Service</span></a>
</div>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max PeoPle</th>
        <th>Rent Type</th>
        <th>Service Type</th>
        <th>Standard Room</th>
        <th>DesCipTion Orther Conveniece</th>
        <th>Pool Area</th>
        <th>Number Of Floors</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="service" items="${serviceList}">
        <tr>
            <td><a href="/furamas?action=editService&serviceId=${service.getServiceId()}">
                <c:out value="${service.serviceId}"/></a></td>
            <td><c:out value="${service.serviceName}"/></td>
            <td><c:out value="${service.serviceArea}"/></td>
            <td><c:out value="${service.serviceCost}"/></td>
            <td><c:out value="${service.serviceMaxPeople}"/></td>
            <td><c:out value="${service.serviceTypeName}"/></td>
            <td><c:out value="${service.rentTypeName}"/></td>
            <td><c:out value="${service.standardRoom}"/></td>
            <td><c:out value="${service.descriptionOtherConvenience}"/></td>
            <td><c:out value="${service.poolAre}"/></td>
            <td><c:out value="${service.numberOfFloors}"/></td>
            <td>
                <a href="/furamas?action=editService&serviceId=${service.serviceId}" class="settings" title="Settings"
                   data-toggle="tooltip"><i class="fas fa-edit"></i></a>
                <a href="/furamas?action=deleteService&serviceId=${service.serviceId}" class="delete" title="Delete"
                   data-toggle="tooltip"> <i class="fas fa-trash-alt"></i></a>
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
