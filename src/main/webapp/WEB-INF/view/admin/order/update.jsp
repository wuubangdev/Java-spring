<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Update Order</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manager Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/order">Table order</a></li>
                                        <li class="breadcrumb-item active">Update order</li>
                                    </ol>
                                    <div>
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Update a order</h3>
                                                <hr>
                                                <form:form method="post" action="/admin/order/update"
                                                    modelAttribute="updateOrder" class="row">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div class="my-3">
                                                        <label class="form-label">Order id: ${updateOrder.id}</label>
                                                        <form:input type="text" class="form-control d-none" path="id" />
                                                        <label class="form-label mx-4">Price:
                                                            <fmt:formatNumber type="number"
                                                                value="${updateOrder.totalPrice}" /> đ
                                                        </label>
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label class="form-label">User:</label>
                                                        <form:input type="text" disabled="true" class="form-control"
                                                            path="user.fullName" />
                                                    </div>
                                                    <div class="mb-3 col-md-6 col-12">
                                                        <label for="status" class="form-label">Status:</label>
                                                        <form:select class="form-select" id="status" path="status">
                                                            <form:option value="PENDING">PENDING</form:option>
                                                            <form:option value="SIPPING">SIPPING</form:option>
                                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                                            <form:option value="CANCEL">CANCEL</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div><button type="submit" class="btn btn-warning">Update</button>
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