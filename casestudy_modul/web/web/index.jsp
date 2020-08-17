<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
    body {
    background-image: url("/img/furama-6-1440x690.jpg");
    }
    </style>
  </head>
  <body>
  <nav class="navbar  navbar-expand-md navbar-light bg-light sticky-top ">
    <div class="container-fluid">
      <a class="navbar-branch" href="#">
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
    </ul>
  </form>
      <div class="footer-copyright text-center py-3">© 2020 Copyright:
        <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
      </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</html>
