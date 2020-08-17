<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>thêm note</title>
    <link rel="stylesheet" href="/asset/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/css/fontawesome.min.css">
    <link rel="stylesheet" href="/asset/css/brands.min.css">
    <link rel="stylesheet" href="/asset/css/all.min.css" %>
    <link rel="stylesheet" href="/asset/css/css.css">
    <style>
        .footer-copyright {
            background-color: rgb(8, 95, 86) !important;
            position: fixed;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 1rem;
            background-color: #efefef;
            text-align: center;
        }

        .input {
            float: left;
        }

        .contact-form .form-control, .contact-form .btn {
            min-height: 20px;
            border-radius: 2px;
        }

        .contact-form .form-control {
            border-color: #e2c705;
            height: 30px;
        }

        .contact-form .form-control:focus {
            border-color: #d8b012;
            box-shadow: 0 0 8px #dcae10;
        }
    </style>
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
        <input type="hidden" name="action" value="findContract">
    </li>
    <li>
        <div class="input-group" id="adv-search">
            <input type="text" class="form-control" placeholder="Search for snippets" name="contractId" />
            <div class="input-group-btn">
                <div class="btn-group" role="group">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-search"></i></button>
                </div>
            </div>
        </div>
    </li>
</ul>
<div>
    <div class="container-lg" style="font-size: 20px">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="contact-form">
                    <h3>Edit Contract Detail</h3>
                    <form action="/furamas?action=editContractDetail" method="post">
                        <c:if test="${contractDetail != null}">
                            <input type="hidden" name="contractDetailId"
                                   value="<c:out value='${contractDetail.contractDetailId}' />"/>
                        </c:if>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="contractId">Contract Id</label>
                                    <select name="contractId" id="contractId">
                                        <c:forEach var="contract" items="${contractList}">
                                            <option ${contract.contractId == contractDetail.contractId ? 'selected' : ''}
                                                    value="<c:out value="${contract.contractId}"/>"><c:out
                                                    value="${contract.contractId}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="attachServiceId">Attach Service</label>
                                    <select name="attachServiceId" id="attachServiceId" >
                                        <option ${contractDetail.attachServiceName == 'Massage' ? 'selected' : ''}  value="1">Massage</option>
                                        <option ${contractDetail.attachServiceName == 'Karaoke' ? 'selected' : ''} value="2">Karaoke</option>
                                        <option ${contractDetail.attachServiceName == 'Thức ăn' ? 'selected' : ''} value="3">Thức ăn</option>
                                        <option ${contractDetail.attachServiceName == 'Nước uống' ? 'selected' : ''} value="4">Nước uống</option>
                                        <option ${contractDetail.attachServiceName == 'Thuê xe tham quan resort' ? 'selected' : ''} value="5">Thuê xe tham quan resort</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                               <input type="number" id="quantity" name="quantity" value="<c:out value="${contractDetail.quantity}"/>">
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="reset" class="btn btn-primary">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="footer-copyright text-center py-3 container-fluid">© 2020 Copyright:
        <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
    </div>

</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</html>
