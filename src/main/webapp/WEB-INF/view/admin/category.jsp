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
    <title>Category</title>

</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
    Thêm
</button>
<table class="table">
    <thead>
    <th>STT</th>
    <th>Tên</th>
    <th>Thao tác</th>
    </thead>
    <tbody>
    <c:forEach var="category" items="${categories}" varStatus="i">
        <tr>
            <td>${i.index + 1}</td>
            <td>${category.getName()}</td>
            <td>
                <button type="button"
                        class="btn btn-warning btnEdit"
                        data-id="${category.id}"
                        data-name="${category.name}">
                    Sửa
                </button>
                <button type="button"
                        class="btn btn-danger"
                        data-id="${category.id}">
                    Xóa
                </button>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnEdits = document.querySelectorAll(".btnEdit");

        btnEdits.forEach(btn => {
            btn.addEventListener("click", function () {
                const id = this.getAttribute("data-id");
                const name = this.getAttribute("data-name");

                // Gán dữ liệu vào form modal
                document.getElementById("categoryId").value = id;
                document.getElementById("categoryName").value = name;

                // Hiển thị modal
                const modal = new bootstrap.Modal(document.getElementById("modalUpdate"));
                modal.show();
            });
        });
    });
</script>

<%--Modal thêm danh mục--%>
<form:form action="/admin/category/add" method="post" modelAttribute="newCategory">
    <div class="modal fade" id="addModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm danh mục sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="myForm">
                        <div class="mb-3">
                            <label class="form-label">Tên</label>
                            <form:input path="name" type="text" class="form-control ${not empty message ? 'is-invalid' : ''}"
                                        placeholder="Nhập tên..."/>
                        </div>
<%--                        <div class="mb-3">--%>
<%--                            <label class="form-label">Mô tả</label>--%>
<%--                            <form:input path="description" type="text" class="form-control"--%>
<%--                                        placeholder="Mô tả..."/>--%>
<%--                        </div>--%>
                    </form>
                    <c:if test="${not empty message}">
                        <div class="alert alert-danger">${message}</div>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>

            </div>
        </div>
    </div>
</form:form>
<!-- Modal update -->
<div class="modal fade" id="modalUpdate" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sửa danh mục</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="updateForm" action="/admin/category/update" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id" id="categoryId">


                    <div class="mb-3">
                        <label class="form-label">Tên danh mục</label>
                        <input type="text" name="name" id="categoryName" class="form-control ${not empty messageUpdate ? 'is-invalid' : ''}">
                    </div>
                    <c:if test="${not empty messageUpdate}">
                        <div class="alert alert-danger">${messageUpdate}</div>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        <%-- Nếu message tồn tại thì bật modal --%>
        <c:if test="${not empty message}">
        const modal = new bootstrap.Modal(document.getElementById("addModal"));
        modal.show();
        </c:if>
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        <c:if test="${not empty messageUpdate}">
        document.getElementById("categoryId").value = "${editCategory.id}";
        document.getElementById("categoryName").value = "${editCategory.name}";
        const modal = new bootstrap.Modal(document.getElementById("modalUpdate"));
        modal.show();
        </c:if>
    });
</script>

</html>