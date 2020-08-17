<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <input type="hidden" name="action" value="findCustomer">
    </li>
    <li>
        <div class="input-group" id="adv-search">
            <input type="text" class="form-control" placeholder="Search for snippets" name="customerName" />
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
                    <h1>Insert Customer</h1>
                    <form action="/furamas?action=createCustomer" method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerTypeId">Type Customer</label>
                                    <select name="customerTypeId" id="customerTypeId" >
                                        <option value="1">Diamond</option>
                                        <option value="2">Platinium</option>
                                        <option value="3">Gold</option>
                                        <option value="3">Silver</option>
                                        <option value="3">Member</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerName">Name </label>
                                    <input type="text" class="form-control" id="customerName" name="customerName">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerBirthday">Birth Day</label>
                                    <input type="date" class="form-control" id="customerBirthday" name="customerBirthday">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerGender">Gender</label>
                                    <select name="customerGender" id="customerGender" >
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerIdCard">Id Card</label>
                                    <input type="text" class="form-control" id="customerIdCard" name="customerIdCard">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerPhone">Phone</label>
                                    <input type="text" class="form-control" id="customerPhone" name="customerPhone">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerEmail">Email</label>
                                    <input type="text" class="form-control" id="customerEmail" name="customerEmail">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="customerAddress">Address</label>
                                    <input type="text" class="form-control" id="customerAddress"
                                           name="customerAddress">
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
