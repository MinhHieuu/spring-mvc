<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ProductDetail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">

</head>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="../layout/header.jsp"/>
            <c:if test="${not empty message}">
                <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-danger'} alert-dismissible fade show" role="alert">
                        ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <div class="container-fluid">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCreate">
                    Thêm
                </button>
                <table class="table">
                    <thead>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Màu sắc</th>
                    <th>Size</th>
                    <th>Mô tả</th>
                    <th>Giá mua</th>
                    <th>Giá bán</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${listProductDetail}" var="detail" varStatus="i">
                        <tr>
                            <td>${i.index + 1}</td>
                            <td>${detail.product.name}</td>
                            <td>
                                <c:forEach items="${detail.images}" var="image">
                                    <img src="/images/product/${image.url}" alt="product detail preview"
                                         class="product-image"/>
                                </c:forEach>
                            </td>
                            <td>${detail.size.name}</td>
                            <td>${detail.color.name}</td>
                            <td>${detail.description}</td>
                            <td>${detail.costPrice}</td>
                            <td>${detail.salePrice}</td>
                            <td>${detail.quantity}</td>
                            <td>
                                <c:set var="imageStr" value=""/>
                                <c:forEach var="img" items="${detail.images}" varStatus="st">
                                    <c:set var="imageStr" value="${imageStr}${img.url}${!st.last ? ',' : ''}"/>
                                </c:forEach>

                                <button type="button" class="btn btn-warning btn-edit"
                                        data-id="${detail.id}"
                                        data-product="${detail.product.id}"
                                        data-color="${detail.color.id}"
                                        data-size="${detail.size.id}"
                                        data-description="${detail.description}"
                                        data-cost-price="${detail.costPrice}"
                                        data-sale-price="${detail.salePrice}"
                                        data-quantity="${detail.quantity}"
                                        data-images="${imageStr}">
                                    Sửa
                                </button>
                                <a href="/admin/product-detail/delete/${detail.id}" class="btn btn-danger">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--                    modal them--%>
                <div class="modal fade" id="modalCreate" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create ProductDetail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form:form action="/admin/product-detail/create" method="post"
                                           modelAttribute="newProductDetail" enctype="multipart/form-data"
                                           class="row">
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Sản phẩm</label>
                                    <c:set var="errorProduct">
                                        <form:errors path="product" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="product"
                                                 class="form-control ${empty errorProduct? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn sản phẩm-"/>
                                        <form:options items="${listProduct}" itemValue="id" itemLabel="name"/>
                                    </form:select>
                                        ${errorProduct}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Màu sắc</label>
                                    <c:set var="errorColor">
                                        <form:errors path="color" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="color"
                                                 class="form-control ${empty errorColor? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn màu sắc-"/>
                                        <form:options items="${listColor}" itemLabel="name" itemValue="id"/>
                                    </form:select>
                                        ${errorColor}

                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Kích thước</label>
                                    <c:set var="erroSize">
                                        <form:errors path="size" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:select path="size"
                                                 class="form-control ${empty erroSize? '' : 'is-invalid'}">
                                        <form:option value="" label="-Chọn kích thước-"/>
                                        <form:options itemValue="id" itemLabel="name" items="${listSize}"/>
                                    </form:select>
                                        ${erroSize}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Số lượng</label>
                                    <c:set var="errorQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:input path="quantity" type="number"
                                                class="form-control ${empty errorQuantity? '' : 'is-invalid'}"/>
                                        ${errorQuantity}
                                </div>

                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Giá nhập</label>
                                    <c:set var="errorCostPrice">
                                        <form:errors path="costPrice" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:input path="costPrice"
                                                class="form-control ${empty errorCostPrice? '' : 'is-invalid'}"/>
                                        ${errorCostPrice}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Giá bán</label>
                                    <c:set var="errorSalePrice">
                                        <form:errors path="SalePrice" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <form:input path="salePrice"
                                                class="form-control ${empty errorSalePrice? '' : 'is-invalid'}"/>
                                        ${errorSalePrice}
                                </div>
                                <div class="mb-3 col-12">
                                    <label class="form-label">Mô tả</label>
                                    <form:textarea path="description" class="form-control"/>
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="productFile" class="form-label">Hình ảnh:</label>
                                    <input class="form-control" type="file" id="productFile"
                                           ccept=".jpg, .png, .jpeg" name="imgFile" multiple/>
                                </div>
                                <div class="col-12 mb-3" id="previewContainer">
                                        <%--                                    <img style="max-height: 250px; display: block;" alt="product preview"--%>
                                        <%--                                         id="previewContainer"/>--%>
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

                <%--                modal sửa--%>
                <div class="modal fade" id="modalUpdate" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Update ProductDetail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/admin/product-detail/update" method="post"
                                      enctype="multipart/form-data"
                                      class="row">
                                    <input type="hidden" name="id" id="id"/>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Sản phẩm</label>
                                        <select name="product" id="new-product" class="form-control">
                                            <c:forEach items="${listProduct}" var="p">
                                                <option value="${p.id}"
                                                        <c:if test="${product == p.id}"> selected</c:if>>
                                                        ${p.name}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Màu sắc</label>
                                        <select name="color" id="new-color" class="form-control">
                                            <c:forEach items="${listColor}" var="c">
                                                <option value="${c.id}"
                                                        <c:if test="${color == c.id}">selected</c:if>>
                                                        ${c.name}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Kích thước</label>
                                        <select name="size" id="new-size" class="form-control">
                                            <c:forEach items="${listSize}" var="s">
                                                <option value="${s.id}" <c:if test="${size == s.id}">selected</c:if>>
                                                        ${s.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Số lượng</label>
                                        <input type="number" id="new-quantity" name="quantity"
                                               class="form-control ${empty errorQuantity? '' : 'is-invalid'}"/>
                                        <span class="invalid-feedback">${errorQuantity}</span>
                                    </div>

                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Giá nhập</label>
                                        <input type="text" id="new-cost-price" name="costPrice"
                                               class="form-control ${empty errorCostPrice? '' : 'is-invalid'}"/>
                                        <span class="invalid-feedback">${errorCostPrice}</span>
                                    </div>
                                    <div class="mb-3 col-md-6 col-12">
                                        <label class="form-label">Giá bán</label>
                                        <input type="number" id="new-sale-price" name="salePrice"
                                               class="form-control ${empty errorSalePrice? '':'is-invalid'}"/>
                                        <span class="invalid-feedback">${errorSalePrice}</span>
                                    </div>
                                    <div class="mb-3 col-12">
                                        <label class="form-label">Mô tả</label>
                                        <textarea name="description" id="new-description" class="form-control"></textarea>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label for="productFile" class="form-label">Hình ảnh:</label>
                                        <input class="form-control" type="file" id="newProductFile"
                                               ccept=".jpg, .png, .jpeg" name="imgFile" multiple/>
                                    </div>
                                    <div class="col-12 mb-3" id="preview">

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>

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
    $(document).ready(() => {
        function setupImagePreview(inputId, containerId) {
            const inputFile = $(inputId);
            const previewContainer = $(containerId);

            inputFile.change(function (e) {
                previewContainer.empty(); // clear preview cũ
                const files = e.target.files;

                Array.from(files).forEach(file => {
                    const imgURL = URL.createObjectURL(file);
                    const img = $("<img>", {src: imgURL});
                    previewContainer.append(img);
                });
            });
        }
        setupImagePreview("#productFile", "#previewContainer");
        setupImagePreview("#newProductFile", "#preview");
    });

</script>
<script>
    $(document).ready(function() {
        $(".btn-edit").click(function () {
            const images = $(this).data('images'); // chuỗi "img1.jpg,img2.jpg,..."
            console.log(images);
            const imageArray = images.split(',');  // chuyển thành mảng
            let html = "";
            imageArray.forEach(image => {
                html += `<img src="/images/product/` + image + `" alt="product preview" >`;
            });
            $("#preview").html(html);
            const id = $(this).data("id");
            const product = $(this).data("product");

            const color = $(this).data("color");
            const size = $(this).data("size");
            const description = $(this).data("description");
            const costPrice = $(this).data("costPrice");
            const salePrice = $(this).data("salePrice");
            const quantity = $(this).data("quantity");

            $("#id").val(id);
            $("#new-product").val(product);
            $('#new-color').val(color);
            $('#new-size').val(size);
            $('#new-description').val(description);
            $('#new-cost-price').val(costPrice);
            $('#new-sale-price').val(salePrice);
            $('#new-quantity').val(quantity);
            var modal = new bootstrap.Modal(document.getElementById('modalUpdate'));
            modal.show();
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const hasError = "${messageError}";
        if (hasError === "Create") {
            const errorModal = new bootstrap.Modal(document.getElementById('modalCreate'));
            errorModal.show(); // Tự động hiển thị modal khi có lỗi
        }
        if(hasError === "Update") {

        }
    });
</script>

</html>