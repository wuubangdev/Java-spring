<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Create User</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Create Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/user">Table users</a></li>
                                    <li class="breadcrumb-item active">Create User</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a user</h3>
                                            </hr>
                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Email:</label>
                                                        <c:set var="emailErr">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input type="email"
                                                            class="form-control ${not empty emailErr?'is-invalid':''}"
                                                            path="email" />
                                                        ${emailErr}
                                                    </div>
                                                    <div class="mb-3 col-md-6 v">
                                                        <label class="form-label">Password:</label>
                                                        <c:set var="passwordErr">
                                                            <form:errors path="password" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input type="password"
                                                            class="form-control ${not empty passwordErr?'is-invalid':''}"
                                                            path="password" />
                                                        ${passwordErr}
                                                    </div>
                                                    <div class="mb-3  col-md-6 col-12">
                                                        <label class="form-label col-md-6">Phone number:</label>
                                                        <form:input type="text" class="form-control" path="phone" />
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Full name:</label>
                                                        <c:set var="fullNameErr">
                                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input type="text"
                                                            class="form-control ${not empty fullNameErr?'is-invalid':''}"
                                                            path="fullName" />
                                                        ${fullNameErr}
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Address:</label>
                                                        <form:input type="text" class="form-control" path="address" />
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label for="role" class="form-label">Role:</label>
                                                        <form:select class="form-select" id="role" path="role.name">
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            path="avatar" accept=".png, .jpg, .jpeg"
                                                            name="avatarFile" />
                                                    </div>
                                                    <div class="mb-3 col-12 d-flex justify-content-center">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview" />
                                                    </div>
                                                    <div class="d-grid gap-2 col-6 mx-auto">
                                                        <button class="btn btn-primary" type="submit">Tạo</button>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>