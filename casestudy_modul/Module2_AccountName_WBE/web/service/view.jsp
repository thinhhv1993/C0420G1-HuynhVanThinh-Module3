<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view</title>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Lemonada:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/asset/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/css/fontawesome.min.css">
    <link rel="stylesheet" href="/asset/css/brands.min.css">
    <link rel="stylesheet" href="/asset/css/all.min.css" %>
    <style type="text/css">
        @font-face {
            font-family: 'Lemonada', cursive;
        }

        * {
            font-family: 'Lemonada', cursive;
        }

        h3.tieude {
            text-align: center;
            padding-top: 50px;
        }

        a {
            margin: 10px;
        }
    </style>
</head>
<body class="p-3 mb-2 bg-light text-dark">
<caption><h3 class="tieude">Các Ghi Chú</h3></caption>
<div align="center">
    <form method="post" action="/notes">
        <input type="hidden" name="action" value="find">
        <input type="text" name="title" id="title" style="margin-right: 10px">
        <input type="submit" value="Tìm">
    </form>
    <h5>
        <a href="/notes?action=create">Thêm Note Mới </a>
    </h5>
</div>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tiêu Đề</th>
        <th>Phân Loại</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="note" items="${findNoteByTitle}">
        <tr>
            <td><a href="/notes?action=edit&id=${note.getId()}"><c:out value="${note.id}"/></a></td>
            <td><c:out value="${note.title}"/></td>
            <td><c:out value="${note.name}"/></td>
            <td>
                <a href="/notes?action=edit&id=${note.id}" class="settings" title="" data-toggle="tooltip"
                   data-original-title="Settings"><i class="fa fa-pen"></i></a>
                <a href="/notes?action=delete&id=${note.id}" class="delete" title="" data-toggle="tooltip"
                   data-original-title="Delete"><i class="fas fa-trash-alt"></i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="/asset/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</html>
