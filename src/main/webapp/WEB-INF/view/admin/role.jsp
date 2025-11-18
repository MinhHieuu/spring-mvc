<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Role</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
    Thêm
</button>
<form:form action="/admin/roles" method="post" modelAttribute="newRole">
    <div class="modal fade" id="addModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm dữ liệu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="myForm">
                        <div class="mb-3">
                            <label class="form-label">Tên</label>
                            <form:input path="name" type="text" class="form-control"
                                        placeholder="Nhập tên..."/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <form:input path="description" type="text" class="form-control"
                                        placeholder="Mô tả..."/>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>

            </div>
        </div>
    </div>
</form:form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>