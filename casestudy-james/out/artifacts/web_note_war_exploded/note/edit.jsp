<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
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
        a{
            margin: 10px;
        }
        body {
            background-image: url("/image/94321578-notebook-and-a-green-pencil-on-yellow-background-office-theme-.jpg");
        }
    </style>
</head>
<body>
<form style="align-items: center" action="/notes?action=edit" method="post">
    <c:if test="${note != null}">
        <input type="hidden" name="id" value="<c:out value='${note.id}' />"/>
    </c:if>
    <div class="container-lg">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="contact-form" >
                    <h1 align="center">Sửa Note</h1>
                    <h2 >
                        <a href="notes?action=notes">Quay lại danh sách</a>
                    </h2>
                    <form action="/examples/actions/confirmation.php" method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label >Tiêu Đề</label>
                                    <input type="text" class="form-control" id="title" name="title" required value="<c:out value='${note.title}' />">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Kiểu Note</label>
                            <input type="text" class="form-control" id="type_id" name="type_id" required value="<c:out value='${note.type_id}' />">
                        </div>
                        <div class="form-group">
                            <label >Nội Dung</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required><c:out value='${note.content}' /></textarea>
                        </div>
                        <a href="notes?action=notes"><button type="submit" class="btn btn-primary"> LƯU</button></a>
                        <a href="notes?action=notes"><button type="reset" class="btn btn-primary"> HUỶ</button></a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
