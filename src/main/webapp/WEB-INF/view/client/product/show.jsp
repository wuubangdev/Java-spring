<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Sản phẩm</title>
                    <meta content=" width=device-width, initial-scale=1.0" name="viewport">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>
                    <!-- Navbar start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <hr>
                        <div class="container py-5">
                            <div class="row">
                                <!-- Filter -->
                                <div class="col-12 col-md-3">
                                    <div class="col-12 mb-3" id="factoryFilter">
                                        <div class="mb-2">Hãng sản xuất</div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="Apple">
                                            <label class="form-check-label" for="inlineCheckbox1">Apple</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="Asus">
                                            <label class="form-check-label" for="inlineCheckbox2">Asus</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="Lenovo">
                                            <label class="form-check-label" for="inlineCheckbox3">Lenovo</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="Dell">
                                            <label class="form-check-label" for="inlineCheckbox1">Dell</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="MSI">
                                            <label class="form-check-label" for="inlineCheckbox2">MSI</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="Acer">
                                            <label class="form-check-label" for="inlineCheckbox3">Acer</label>
                                        </div>
                                    </div>
                                    <div class="col-8 mb-3" id="targetFilter">
                                        <div class="mb-2">Mục đích sử dụng</div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="Gaming">
                                            <label class="form-check-label" for="inlineCheckbox1">Gaming</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="Study">
                                            <label class="form-check-label" for="inlineCheckbox2">Sinh viên - Văn
                                                phòng</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="Graphic">
                                            <label class="form-check-label" for="inlineCheckbox3">Thiết kế đồ
                                                họa</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="Business">
                                            <label class="form-check-label" for="inlineCheckbox1">Doanh nhân</label>
                                        </div>
                                    </div>
                                    <div class="col-8 mb-3" id="priceFilter">
                                        <div class="mb-2">Mức giá</div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="duoi-10tr">
                                            <label class="form-check-label" for="inlineCheckbox1">Dưới 10 triệu</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="10tr-den-15tr">
                                            <label class="form-check-label" for="inlineCheckbox2">Từ 10 = 15
                                                triệu</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="15tr-den-20tr">
                                            <label class="form-check-label" for="inlineCheckbox3">Từ 15 - 20
                                                triệu</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                value="20tr-den-25tr">
                                            <label class="form-check-label" for="inlineCheckbox1">Từ 20 - 25
                                                triệu</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="25tr-den-30tr">
                                            <label class="form-check-label" for="inlineCheckbox2">Từ 25 - 30
                                                triệu</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="tren-30tr">
                                            <label class="form-check-label" for="inlineCheckbox3">Trên 30 triệu</label>
                                        </div>
                                    </div>
                                    <div class="col-8 mb-3" id="sortFilter">
                                        <div class="mb-2">Sắp xếp</div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="radio-sort"
                                                id="flexRadioDefault1" value="increment">
                                            <label class="form-check-label" for="radio-sort">
                                                Tăng dần
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="radio-sort"
                                                id="flexRadioDefault2" value="decrement">
                                            <label class="form-check-label" for="radio-sort">
                                                Giảm dần
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="radio-sort"
                                                id="flexRadioDefault2" value="off" checked>
                                            <label class="form-check-label" for="radio-sort">
                                                Không sắp xếp
                                            </label>
                                        </div>
                                    </div>
                                    <button class="btn border-secondary rounded-pill text-primary mt-2" id="btnFilter">
                                        Lọc dữ liệu
                                    </button>
                                </div>
                                <!-- Product -->
                                <div class="col-12 col-md-9">
                                    <div class="row">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-4 col-12 mb-3">
                                                <a href="/product/${product.id}">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt=""
                                                                style="max-height: min-content;">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute align-items-center"
                                                            style="top: 10px; left: 10px;">Laptop</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px; text-align: center;">
                                                                ${product.name}</h4>
                                                            <p style="font-size: 13px; text-align: center">
                                                                ${product.shortDesc}</p>
                                                            <div class="d-flex flex-column flex-lg-wrap">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark fw-bold">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </p>
                                                                <form action="/add-product-to-cart/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />
                                                                    <button
                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary justify-content-center flex-column"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <nav aria-label="Page navigation" class="mt-3">
                                        <ul class="pagination justify-content-center d-flex">
                                            <li class="${1 eq currentPage ? 'disabled page-item':'page-item'}">
                                                <a class="page-link" href="/products?page=${currentPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <li class="page-item">
                                                    <a class="${loop.index eq currentPage ? 'active page-link':'page-link'}"
                                                        href="/products?page=${loop.index}">
                                                        ${loop.index}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                            <li class="${totalPages eq currentPage ? 'disabled page-item':'page-item'}">
                                                <a class="page-link" href="/products?page=${currentPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- Single Product End -->
                    <!-- Modal Search Start -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                            aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i
                                                class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Search End -->
                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->
                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>
                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                    <script>
                        const product_quantity = document.querySelector(".product-quantity");
                        const detail_quantity = document.querySelector(".detail-quantity");
                        const quantity_controls = document.querySelectorAll(".quantity-control");
                        for (const quantity_control of quantity_controls) {
                            quantity_control.addEventListener("click", function () {
                                detail_quantity.value = product_quantity.value
                            })
                        }
                    </script>
                </body>

                </html>