<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Table user</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <!-- <link rel="stylesheet" href="/css/demo.css"> -->
        </head>

        <body>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Table user</h3>
                            <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                        </div>
                        <hr />
                        <table class="table table-bordered table-hover mt-2">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Full name</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <th scope="row">${user.id}</th>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>
                                            <a type="submit" href="/admin/user/${user.id}"
                                                class="btn btn-primary">View</a>
                                            <a type="submit" href="/admin/user/update/${user.id}"
                                                class="btn btn-warning">Update</a>
                                            <a type="submit" href="/admin/user/delete/${user.id}"
                                                class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>

        </html>