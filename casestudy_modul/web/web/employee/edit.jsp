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
            position: relative;
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
<div>
    <div class="container-lg" style="font-size: 20px">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="contact-form">
                    <h1> Employee</h1>
                    <form action="/furamas?action=editEmployee" method="post">
                        <c:if test="${employee != null}">
                            <input type="hidden" name="employeeId" value="<c:out value='${employee.employeeId}' />"/>
                        </c:if>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeName">Name </label>
                                    <input type="text" class="form-control" id="employeeName" name="employeeName"
                                           value="<c:out value='${employee.employeeName}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeBirthday">Birthday </label>
                                    <input type="text" class="form-control" id="employeeBirthday" name="employeeBirthday"
                                           value="<c:out value='${employee.employeeBirthday}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeIdCard">Id Card </label>
                                    <input type="text" class="form-control" id="employeeIdCard" name="employeeIdCard"
                                           value="<c:out value='${employee.employeeIdCard}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeSalary">Salary </label>
                                    <input type="number" class="form-control" id="employeeSalary" name="employeeSalary"
                                           value="<c:out value='${employee.employeeSalary}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeePhone">Phone </label>
                                    <input type="text" class="form-control" id="employeePhone" name="employeePhone"
                                           value="<c:out value='${employee.employeePhone}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeEmail">Email </label>
                                    <input type="text" class="form-control" id="employeeEmail" name="employeeEmail"
                                           value="<c:out value='${employee.employeeEmail}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="employeeAddress">Address </label>
                                    <input type="text" class="form-control" id="employeeAddress" name="employeeAddress"
                                           value="<c:out value='${employee.employeeAddress}' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="divisionId">Division </label>
                                    <select name="divisionId" id="divisionId">
                                        <option ${employee.divisionName == 'Sale – Marketing' ? 'selected' : ''} value="1">
                                            Sale – Marketing
                                        </option>
                                        <option ${employee.divisionName == 'Hành Chính' ? 'selected' : ''} value="2">
                                            Hành Chính
                                        </option>
                                        <option ${employee.divisionName == 'Phục vụ' ? 'selected' : ''} value="3">
                                            Phục vụ
                                        </option>
                                        <option ${employee.divisionName == 'Quản lý' ? 'selected' : ''} value="4">
                                            Quản lý
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="educationDegreeId">Education Degree  </label>
                                    <select name="educationDegreeId" id="educationDegreeId">
                                        <option ${employee.educationDegreeName == 'Trung Cấp' ? 'selected' : ''} value="1">
                                            Trung Cấp
                                        </option>
                                        <option ${employee.educationDegreeName == 'Cao Đẳng' ? 'selected' : ''} value="2">
                                            Cao Đẳng
                                        </option>
                                        <option ${employee.educationDegreeName == 'Đại Học' ? 'selected' : ''} value="3">
                                            Đại Học
                                        </option>
                                        <option ${employee.educationDegreeName == 'Sau Đại Học' ? 'selected' : ''} value="4">
                                            Sau Đại Học
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="positionId">Position </label>
                                    <select name="positionId" id="positionId">
                                        <option ${employee.positionName == 'Lễ Tân' ? 'selected' : ''} value="1">
                                            Lễ Tân
                                        </option>
                                        <option ${employee.positionName == 'Phục Vụ' ? 'selected' : ''} value="2">
                                            Phục Vụ
                                        </option>
                                        <option ${employee.positionName == 'Chuyên Viên' ? 'selected' : ''} value="3">
                                            Chuyên Viên
                                        </option>
                                        <option ${employee.positionName == 'Giám Sát' ? 'selected' : ''} value="4">
                                            Giám Sát
                                        </option>
                                        <option ${employee.positionName == 'Quản Lý' ? 'selected' : ''} value="5">
                                            Quản Lý
                                        </option>
                                        <option ${employee.positionName == 'Giám Đốc' ? 'selected' : ''} value="6">
                                            Giám Đốc
                                        </option>
                                    </select>
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
<div class="container-fluid padding">
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
        <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
    </div>
</div>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</html>
