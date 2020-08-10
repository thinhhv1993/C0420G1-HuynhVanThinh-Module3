<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>thêm note</title>
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
<form style="align-items: center" action="/notes?action=create" method="post">
<div class="container-lg">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="contact-form" >
                <h1 align="center">Thêm Mới Note</h1>
                <h2 >
                    <a href="notes?action=notes">Quay lại danh sách</a>
                </h2>
                <form action="/examples/actions/confirmation.php" method="post">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label >Tiêu Đề</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >Kiểu Note</label>
                        <input type="text" class="form-control" id="type_id" name="type_id" required>
                    </div>
                    <div class="form-group">
                        <label >Nội Dung</label>
                        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary"> LƯU</button>
                    <button type="reset" class="btn btn-primary"> HUỶ</button>
                </form>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
