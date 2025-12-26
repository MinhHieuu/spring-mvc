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
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display":"block"});
            });
        });
    </script>
</head>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="../layout/header.jsp"/>
            <div class="container-fulid">
                <div>
                    <div class="col-md-6 col-12 mx-auto">
                        <form:form method="post" action="/admin/user/create"
                                   modelAttribute="newUser" class="row"
                                   enctype="multipart/form-data"
                        >
                            <div class="mb-3 col-md-6 col-12">
                                <label class="form-label">Username</label>
                                <c:set var="errorUsername">
                                    <form:errors path="username" cssClass="invalid-feedback"/>
                                </c:set>
                                <form:input path="username" type="text" class="form-control
                                ${empty errorUsername ? '' : 'is-invalid'}"/>
                                ${errorUsername}
                            </div>
                            <div class="mb-3 col-md-6 col-12">
                                <label class="form-label">Password</label>
                                <c:set var="errorPassword">
                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                </c:set>
                                <form:input path="password" type="password" class="form-control ${empty errorPassword ? '' : 'is-invalid'}"/>
                                ${errorPassword}
                            </div>
                            <div class="mb-3 col-md-6 col-12">
                                <label class="form-label">Full Name</label>
                                <c:set var="errorFullName">
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                </c:set>
                                <form:input path="fullName" type="text" class="form-control ${empty errorFullName ? '' : 'is-invalid'}"/>
                                ${errorFullName}
                            </div>
                            <div class="mb-3 col-md-6 col-12">
                                <label class="form-label">Phone</label>
                                <c:set var="errorPhone">
                                    <form:errors path="phone" cssClass="invalid-feedback"/>
                                </c:set>
                                <form:input path="phone" type="text" class="form-control ${empty errorPhone ? '' : 'is-invalid'}"/>
                                ${errorPhone}
                            </div>

                            <div class="mb-3 col-md-6 col-12">
                                <label class="form-label">Role</label>
                                <form:select path="role" class="form-select" items="${roles}" itemLabel="name" itemValue="id">

                                </form:select>
                            </div>
                            <div class="mb-3 col-md-6 col-12">
                                <label for="avatarFile" class="form-label">Avatar:</label>
                                <input class="form-control" type="file" id="avatarFile"
                                       ccept=".jpg, .png, .jpeg" name="imgFile"/>
                            </div>
                            <div class="col-12 mb-3">
                                <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview"/>
                            </div>
                            <div class="col-12 mb-5">
                                <button class="btn btn-primary" type="submit">Create</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>