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
    <title>Product</title>
</head>
<body id="page-top">

<div id="wrapper">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="../layout/header.jsp"/>
            <div class="container-fluid">
                <c:if test="${not empty message}">
                    <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-danger'} alert-dismissible fade show" role="alert">
                            ${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCreate">
                    Thêm sản phẩm
                </button>
                <table class="table">
                    <thead>
                    <th>STT</th>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Danh mục</th>
                    <th>Chất liệu</th>
                    <th>Thương hiệu</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><img src="/images/product/${product.image}" alt="image product"
                                     class="product-image"></td>
                            <td>${product.name}</td>
                            <td>${product.category.name}</td>
                            <td>${product.marterial.name}</td>
                            <td>${product.brand.name}</td>
                            <td>${product.createdAt}</td>
                            <td>${product.status == 1? 'Hoạt động' : 'Ngưng hoạt động'}</td>
                            <td>
                                <button type="button" class="btn btn-warning btn-edit"
                                        data-id="${product.id}"
                                        data-name="${product.name}"
                                        data-category="${product.category.id}"
                                        data-marterial="${product.marterial.id}"
                                        data-brand="${product.brand.id}"
                                        data-status="${product.status}"
                                        data-img="${product.image}"
                                >
                                    Sửa
                                </button>
                                <a href="/admin/product/delete/${product.id}"class="btn btn-danger">Xóa</a>
                                <a href="/admin/product-detail/${product.id}" class="btn btn-primary">
                                    Chi tiết
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <!-- Modal Sửa-->
                <div class="modal fade" id="modalUpdate" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel">Update Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <form action="/admin/product/update" method="post"
                                           enctype="multipart/form-data"
                                           class="row">
                                    <input type="hidden" name="id" id="id"/>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input name="name" id="name" type="text" placeholder="Nhập tên sản phẩm"
                                                    class="form-control ${empty errorName? '' : 'is-invalid'}"/>

                                            <span class="invalid-feedback"> ${errorName}</span>

                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Chọn danh mục</label>
<%--                                        <c:set var="errorCategory">--%>
<%--                                            <form:errors path="category" class="invalid-feedback"/>--%>
<%--                                        </c:set>--%>
                                        <select name="category" id="category" class="form-control">
                                            <option value="" label="-Chọn danh mục-" disabled="true"></option>
                                            <c:forEach items="${listCategory}" var="c">
                                                <option value="${c.id}"
                                                        <c:if test="${category == c.id}">selected</c:if>
                                                >${c.name}</option>
                                            </c:forEach>
                                        </select>
<%--                                            ${errorCategory}--%>
                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Chọn chất liệu</label>
<%--                                        <c:set var="errorMarterial">--%>
<%--                                            <form:errors path="marterial" cssClass="invalid-feedback"/>--%>
<%--                                        </c:set>--%>
                                        <select name="marterial" id="marterial"
                                                     class="form-control">
                                            <option value="" label="-Chọn chất liệu-" disabled="true"></option>
                                            <c:forEach items="${listMarterial}" var="m">
                                                <option value="${m.id}" <c:if test="${marterial == m.id}">selected</c:if>>${m.name}</option>
                                            </c:forEach>
                                        </select>
<%--                                            ${errorMarterial}--%>
                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Chọn thương hiệu</label>
<%--                                        <c:set var="errorBrand">--%>
<%--                                            <form:errors path="brand" cssClass="invalid-feedback"/>--%>
<%--                                        </c:set>--%>
                                        <select name="brand" id="brand"
                                                     class="form-control">
                                            <option value="" label="-Chọn thương hiệu-" disabled="true"></option>
                                            <c:forEach items="${listBrand}" var="b">
                                                <option value="${b.id}"
                                                        <c:if test="${brand == b.id}"> selected</c:if>>
                                                        ${b.name}
                                                </option>
                                            </c:forEach>
                                        </select>
<%--                                            ${errorBrand}--%>
                                    </div>
                                    <label class="form-label">Trạng thái</label>
                                    <div class="mb-3 col-12">
<%--                                        <c:set var="errorStatus">--%>
<%--                                            <form:errors path="status" cssClass="invalid-feedback"/>--%>
<%--                                        </c:set>--%>
                                        <div>
                                            <input type="radio" name="status" id="Active" value="1"/>
                                            <label for="Active">Hoạt động</label>
                                            <input type="radio" name="status" id="Inactive" value="0"/>
                                            <label for="Inactive">Không hoạt động</label>
<%--                                                ${errorStatus}--%>
                                        </div>

                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label for="productFile" class="form-label">Hình ảnh:</label>
                                        <input class="form-control" type="file" id="productFileUpdate"
                                               ccept=".jpg, .png, .jpeg" name="imgFile"/>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img style="max-height: 250px; display: block;" alt="product preview" id="productUpdatePreview"/>
                                    </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
<%--                modal thêm sản phẩm--%>
                <div class="modal fade" id="modalCreate" tabindex="-1"aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form:form action="/admin/product/create" method="post"
                                           modelAttribute="newProduct" enctype="multipart/form-data"
                                           class="row">
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Tên sản phẩm</label>
                                    <c:set var="errorName">
                                        <form:errors path="name" class="invalid-feedback"/>
                                    </c:set>
                                    <form:input path="name" type="text" class="form-control ${empty errorName? '' : 'is-invalid'}"/>
                                        ${errorName}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Chọn danh mục</label>
                                    <c:set var="errorCategory">
                                        <form:errors path="category" class="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="category" class="form-control ${empty errorCategory? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn danh mục-"/>
                                        <form:options items="${listCategory}" itemLabel="name" itemValue="id"/>
                                    </form:select>
                                        ${errorCategory}

                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Chọn chất liệu</label>
                                    <c:set var="errorMarterial">
                                        <form:errors path="marterial" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="marterial"
                                                 class="form-control ${empty errorMarterial? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn chất liệu-"/>
                                        <form:options itemValue="id" itemLabel="name" items="${listMarterial}"/>
                                    </form:select>
                                        ${errorMarterial}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Chọn thương hiệu</label>
                                    <c:set var="errorBrand">
                                        <form:errors path="brand" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="brand"
                                                 class="form-control ${empty errorBrand? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn thương hiệu-"/>
                                        <form:options items="${listBrand}" itemLabel="name" itemValue="id"/>
                                    </form:select>
                                        ${errorBrand}
                                </div>
                                <label class="form-label">Trạng thái</label>
                                <div class="mb-3 col-12">
                                    <c:set var="errorStatus">
                                        <form:errors path="status" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <div>
                                        <form:radiobutton path="status" value="1" label="Hoạt động" class="${empty errorStatus? '' : 'is-invalid'}"/>
                                        <form:radiobutton path="status" value="0" label="Không hoạt động" cssClass="${empty errorStatus? '' : 'is-invalid'}"/>
                                            ${errorStatus}
                                    </div>

                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="productFile" class="form-label">Hình ảnh:</label>
                                    <input class="form-control" type="file" id="productFile"
                                           ccept=".jpg, .png, .jpeg" name="imgFile"/>
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="product preview" id="productPreview"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                            </form:form>
                        </div>
                    </div>
                </div>


        </div>

    </div>
        <jsp:include page="../layout/footer.jsp"/>
</div>
<jsp:include page="../layout/scroll.jsp"/>

</body>

<script>
    $(document).ready(() => {
        const productFile = $("#productFile");
        const orgImage = "${oldImg}";
        if(orgImage) {
            const urlImg = "/images/product/" + orgImage;
            $("#productUpdatePreview").attr("src", urlImg);
            $("#productUpdatePreview").css({"display":"block"});
        }
        productFile.change(function (e) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $("#productPreview").attr("src", imgURL);
            $("#productPreview").css({"display":"block"});
        });
        const productFileUpdate = $("#productFileUpdate");
        productFileUpdate.change(function (e) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $("#productUpdatePreview").attr("src", imgURL);
            $("#productUpdatePreview").css({"display":"block"});
        });
    });
</script>
<%--nếu có lỗi hiển thị modal--%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const hasError = "${messageError}";
        if (hasError === "Create") {
            const errorModal = new bootstrap.Modal(document.getElementById('modalCreate'));
            errorModal.show(); // Tự động hiển thị modal khi có lỗi
        }
        if(hasError === "Update") {
            const errorModal = new bootstrap.Modal(document.getElementById('modalUpdate'));
            const id = "${product.id}";
            const name = "${product.name}";
            const category = "${product.category.id}";
            const brand = "${product.brand.id}";
            const marterial =  "${product.marterial.id}";
            const img = "/images/product/" + "${oldImg}";

            const status = "${product.status}";

            $("#id").val(id);
            $("#name").val(name);
            $("#category").val(category);
            $("#brand").val(brand);
            $("#marterial").val(marterial);

            $("#productUpdatePreview").attr("src", img)
            // Gán trạng thái vào radio
            if(status == 1){
                $("#Active").prop("checked", true);
            } else {
                $("#Inactive").prop("checked", true);
            }
            errorModal.show();
        }
    });
</script>
<%--gán dữ liệu vào modal sửa--%>
<script>
    $(document).ready(function(){
        $(".btn-edit").click(function(){
            const id = $(this).data("id");
            const name = $(this).data("name");
            const category = $(this).data("category");
            const brand = $(this).data("brand");
            const marterial =$(this).data("marterial");
            const img = "/images/product/" + $(this).data("img");

            const status = $(this).data("status");

            $("#id").val(id);
            $("#name").val(name);
            $("#category").val(category);
            $("#brand").val(brand);
            $("#marterial").val(marterial);

            $("#productUpdatePreview").attr("src", img)
            // Gán trạng thái vào radio
            if(status == 1){
                $("#Active").prop("checked", true);
            } else {
                $("#Inactive").prop("checked", true);
            }
            var modal = new bootstrap.Modal(document.getElementById('modalUpdate'));
            modal.show();
        });
    });
</script>
</html>