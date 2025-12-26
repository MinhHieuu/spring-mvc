<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <title>User</title>
</head>
<body id="page-top">
    <div id="wrapper">
        <jsp:include page="../layout/sidebar.jsp"/>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <jsp:include page="../layout/header.jsp"/>
                <div class="container-fluid">
                    <a href="/admin/user/create" class="btn btn-primary">Thêm người dùng</a>
                    <table class="table">
                        <thead>
                            <th>STT</th>
                            <th>Ảnh</th>
                            <th>Tên</th>
                            <th>Tài khoản</th>
                            <th>Mật khẩu</th>
                            <th>Vai trò</th>
                            <th>Thao tác</th>
                        </thead>
                    <tbody>
                        <c:forEach items="${listUser}" var="user" varStatus="i">
                            <tr>
                                <td>${i.index +  1}</td>
                                <td><img src="/images/avatar/${user.avatar}" alt="" class="product-image"></td>
                                <td>${user.fullName}</td>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.role.name}</td>
                                <td>
                                    <a href="/admin/user/update/${user.id}" class="btn btn-warning">Sửa</a>
                                    <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</body>
</html>