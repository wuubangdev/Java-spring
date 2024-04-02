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
                <title>Product Information</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manager Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Table product</a></li>
                                    <li class="breadcrumb-item active">Product Info</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-around">
                                                <h3>Product Detail with id = ${product.id}</h3>
                                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>
                                            </div>
                                            <hr />
                                            <div class="card mx-auto" style="width: 60%;">
                                                <div class="card-header d-flex justify-content-center ">
                                                    <b>Thông tin chi tiết sản phẩm</b>
                                                </div>
                                                <div class="my-3 col-12 d-flex justify-content-center">
                                                    <img src="/images/product/${product.image}"
                                                        style="max-height: 250px; display: block;" alt="User avatar">
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item text-center">ID: ${product.id}</li>
                                                    <li class="list-group-item text-center">Tên sản phẩm:
                                                        ${product.name}</li>
                                                    <li class="list-group-item text-center">Giá bán: ${product.price}
                                                    </li>
                                                    <li class="list-group-item text-center">Số lượng tồn kho:
                                                        ${product.soil}
                                                    </li>
                                                    <li class="list-group-item text-center">Mục đích sử dụng:
                                                        ${product.target}</li>
                                                </ul>
                                                <a href="/admin/product/update/${product.id}"
                                                    class="btn btn-warning mt-3">Update</a>
                                            </div>
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