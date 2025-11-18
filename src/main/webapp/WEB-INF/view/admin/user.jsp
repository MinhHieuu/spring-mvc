<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
<body>
<div class="container">
    <div>
        <div class="col-md-6 col-12 mx-auto">
            <form:form method="post" action="/admin/user/create"
                       modelAttribute="newUser" class="row"
                       enctype="multipart/form-data"
            >
                <div class="mb-3 col-md-6 col-12">
                    <label class="form-label">Username</label>
                    <form:input path="username" type="text" class="form-control"/>
                </div>
                <div class="mb-3 col-md-6 col-12">
                    <label class="form-label">Password</label>
                    <form:input path="password" type="password" class="form-control"/>
                </div>
                <div class="mb-3 col-md-6 col-12">
                    <label class="form-label">Full Name</label>
                    <form:input path="fullName" type="text" class="form-control"/>
                </div>
                <div class="mb-3 col-md-6 col-12">
                    <label class="form-label">Phone</label>
                    <form:input path="phone" type="text" class="form-control"/>
                </div>
                <div class="mb-3 col-12">
                    <label class="form-label">Address</label>
                    <form:input path="address" type="text" class="form-control"/>
                </div>
                <div class="mb-3 col-md-6 col-12">
                    <label class="form-label">Role</label>
                    <form:select path="role.id" class="form-select" items="${roles}">
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
</body>
</html>