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
    <title>Brand</title>
</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
    Thêm
</button>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnEdits = document.querySelectorAll(".btnEdit");

        btnEdits.forEach(btn => {
            btn.addEventListener("click", function () {
                const id = this.getAttribute("data-id");
                const name = this.getAttribute("data-name");

                // Gán dữ liệu vào form modal
                document.getElementById("brandId").value = id;
                document.getElementById("brandName").value = name;

                // Hiển thị modal
                const modal = new bootstrap.Modal(document.getElementById("modalUpdate"));
                modal.show();
            });
        });
    });
</script>

<%--Modal thêm danh mục--%>

<div class="modal fade" id="addModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm thương hiệu sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form:form action="/admin/brand/add" method="post" modelAttribute="newBrand">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Tên</label>
                        <form:input path="name" type="text" class="form-control"
                                    placeholder="Nhập tên..."/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Modal update -->
<div class="modal fade" id="modalUpdate" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sửa thương hiệu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="updateForm" action="/admin/brand/update" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id" id="brandId">
                    <div class="mb-3">
                        <label class="form-label">Tên thương hiệu</label>
                        <input type="text" name="name" id="brandName" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>