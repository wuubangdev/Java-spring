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
                <title>Update Product</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#imageFile");
                        const orgImage = "${updateProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#imagePreview").attr("src", urlImage);
                            $("#imagePreview").css({ "display": "block" });
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
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
                                <h1 class="mt-4">Update Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Table product</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a product</h3>
                                            </hr>
                                            <form:form method="post" action="/admin/product/update"
                                                modelAttribute="updateProduct" enctype="multipart/form-data">
                                                <div class="row">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div class="d-none">
                                                        <label class="form-label">ID:</label>
                                                        <form:input type="number" class="form-control" path="id" />
                                                    </div>

                                                    <c:set var="nameErr">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="shortDescErr">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="priceErr">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="quantityErr">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="detailDescErr">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>


                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Tên sản phẩm:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty nameErr?'is-invalid':''}"
                                                            path="name" />
                                                        ${nameErr}
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Mô tả ngắn:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty shortDescErr?'is-invalid':''}"
                                                            path="shortDesc" />
                                                        ${shortDescErr}
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Giá bán:</label>

                                                        <form:input type="number"
                                                            class="form-control ${not empty priceErr?'is-invalid':''}"
                                                            path="price" min="0" />
                                                        ${priceErr}
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Số lượng:</label>

                                                        <form:input type="number"
                                                            class="form-control ${not empty quantityErr?'is-invalid':''}"
                                                            path="quantity" min="0" />
                                                        ${quantityErr}
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">Nhà sản xuất:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="Apple">Apple (Macbook)</form:option>
                                                            <form:option value="Msi">Msi</form:option>
                                                            <form:option value="Asus">Asus</form:option>
                                                            <form:option value="Lenovo">Lenovo</form:option>
                                                            <form:option value="Dell">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="HP">HP</form:option>
                                                            <form:option value="Acer">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label ">Mục đích sử
                                                            dụng:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="Gaming">Gaming</form:option>
                                                            <form:option value="Study">Sinh viên - Văn Phòng
                                                            </form:option>
                                                            <form:option value="Graphic">Thiết kế đồ họa</form:option>
                                                            <form:option value="Business">Doanh nhân</form:option>\
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-12">
                                                        <label class="form-label">Mô tả chi tiết:</label>
                                                        <form:textarea cols="30" rows="2"
                                                            class="form-control ${not empty detailDescErr?'is-invalid':''}"
                                                            path="detailDesc"></form:textarea>
                                                        ${detailDescErr}
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="avatarFile" class="form-label">Image:</label>
                                                        <input class="form-control" type="file" id="imageFile"
                                                            path="avatar" accept=".png, .jpg, .jpeg"
                                                            name="productFile" />
                                                    </div>
                                                    <div class="mb-3 col-12 d-flex justify-content-center">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="image preview" id="imagePreview" />
                                                    </div>
                                                    <div class="d-grid gap-2 col-6 mx-auto">
                                                        <button class="btn btn-primary" type="submit">Cập nhật</button>
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