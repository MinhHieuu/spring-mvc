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
    <title>Size</title>
</head>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="../layout/header.jsp"/>
            <div class="container-fluid">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
                    Thêm
                </button>
                <table class="table">
                    <thead>
                    <th>STT</th>
                    <th>Màu sắc</th>
                    <th>Thao tác</th>
                    </thead>
                    <tbody>
                    <c:forEach var="color" items="${colors}">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${color.name}</td>
                            <td>
                                <button type="button"
                                        class="btn btn-warning btnEdit"
                                        data-id="${color.id}"
                                        data-name="${color.name}">
                                    Sửa
                                </button>
                                <button type="button"
                                        class="btn btn-danger"
                                        data-id="${color.id}">
                                    Xóa
                                </button>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
                <form:form action="/admin/color/create" method="post" modelAttribute="newColor">
                    <div class="modal fade" id="addModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thêm màu sắc</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label class="form-label">Tên</label>
                                        <form:input path="name" type="text" class="form-control ${not empty message ? 'is-invalid' : ''}"
                                                    placeholder="Nhập màu sắc..."/>
                                        <c:if test="${not empty message}">
                                            <div class="alert alert-danger mt-1">${message}</div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
                <%--                Modal update brand--%>
                <div class="modal fade" id="modalUpdate" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Sửa màu sắc</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <form id="updateForm" action="/admin/color/update" method="post">
                                <div class="modal-body">
                                    <input type="hidden" name="id" id="corlorId">
                                    <div class="mb-3">
                                        <label class="form-label">Màu sắc</label>
                                        <input type="text" name="name" id="sizeName" class="form-control">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Cập nhật</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<jsp:include page="../layout/scroll.jsp"/>

</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnEdits = document.querySelectorAll(".btnEdit");

        btnEdits.forEach(btn => {
            btn.addEventListener("click", function () {
                const id = this.getAttribute("data-id");
                const name = this.getAttribute("data-name");

                // Gán dữ liệu vào form modal
                document.getElementById("colorId").value = id;
                document.getElementById("colorName").value = name;

                // Hiển thị modal
                const modal = new bootstrap.Modal(document.getElementById("modalUpdate"));
                modal.show();
            });
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        <c:if test="${not empty messageUpdate}">
        document.getElementById("colorId").value = "${editColor.id}";
        document.getElementById("colorName").value = "${editColor.name}";
        const modal = new bootstrap.Modal(document.getElementById("modalUpdate"));
        modal.show();
        </c:if>
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        <%-- Nếu message tồn tại thì bật modal --%>
        <c:if test="${not empty message}">
        const modal = new bootstrap.Modal(document.getElementById("addModal"));
        modal.show();
        </c:if>
    });
</script>

</html>