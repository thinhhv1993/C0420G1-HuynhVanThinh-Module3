<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
            /*font-size: 20px;*/
            /*width: 100%;*/
            /*position: static;*/
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
    <div>
        <div class="container-lg" style="font-size: 20px">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="contact-form">
                        <h1>Insert Service</h1>
                        <form action="/furamas?action=createService" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceName">Name Service</label>
                                        <input type="text" class="form-control" id="serviceName" name="serviceName">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceArea">AreA </label>
                                        <input type="number" class="form-control" id="serviceArea" name="serviceArea">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceCost">Cost</label>
                                        <input type="number" class="form-control" id="serviceCost" name="serviceCost">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceMaxPeople">Max PeoPle</label>
                                        <input type="number" class="form-control" id="serviceMaxPeople"
                                               name="serviceMaxPeople">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="service_type_id">Type Service</label>
                                        <select name="service_type_id" id="service_type_id" name="service_type_id">
                                            <option value="1">Villa</option>
                                            <option value="2">House</option>
                                            <option value="3">Room</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="rent_type_id">Rent Type</label>
                                        <select name="rent_type_id" id="rent_type_id" name="rent_type_id">
                                            <option value="1">YEAR</option>
                                            <option value="2">MOUTH</option>
                                            <option value="3">DAY</option>
                                            <option value="4">TIME</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="standardRoom">Standard Room</label>
                                        <input type="text" class="form-control" id="standardRoom" name="standardRoom">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descriptionOtherConvenience">Description Other Convenience</label>
                                        <input type="text" class="form-control" id="descriptionOtherConvenience"
                                               name="descriptionOtherConvenience">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="poolAre">Pool Are</label>
                                        <input type="number" class="form-control" id="poolAre" name="poolAre">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="numberOfFloors">NumberOf Floors</label>
                                        <input type="number" class="form-control" id="numberOfFloors"
                                               name="numberOfFloors">
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</html>
