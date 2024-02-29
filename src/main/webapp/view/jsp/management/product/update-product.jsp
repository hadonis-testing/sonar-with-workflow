<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="io.hardingadonis.saledock.utils.Singleton" %>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Sale Dock - Cập nhập sản phẩm</title>
        <link rel="icon" type="image/png" sizes="512x512" href="<%=request.getContextPath()%>/view/assets/images/favicon/favicon.png">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/view/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/view/assets/css/animate.min.css">

    </head>

    <body id="page-top">
        <div id="wrapper">
            <%@include file="../../../common/_sidenav.jsp" %>

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">

                    <%@include file="../../../common/_nav.jsp" %>

                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Cập nhập sản phẩm</h3>
                        <div class="row justify-content-center mb-3">
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col">
                                        <div class="card shadow mb-3">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 fw-bold">Cập nhập sản phẩm</p>
                                            </div>
                                            <div class="card-body">
                                                <form action="update-product"  enctype="multipart/form-data" method="post">    
                                                    <input name="id" hidden value="${param.id}" />
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="username">
                                                                    <strong>Mã sản phẩm</strong>
                                                                </label>
                                                                <input class="form-control" type="text" id="username" value="${requestScope.pro.code}" name="username" readonly=""  >
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="email">
                                                                    <strong>Tên sản phẩm</strong>
                                                                </label>
                                                                <input class="form-control" type="text" id="productName" placeholder="${requestScope.pro.name}" name="productName" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="username">
                                                                    <strong>Phân loại</strong>
                                                                </label>
                                                                <input class="form-control"  id="cat" value="${requestScope.cat.name}" name="cat" readonly="" >
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="mb-3">
                                                                <label class="form-label" for="email">
                                                                    <strong>Giá tiền</strong>
                                                                </label>                                  
                                                                <input class="form-control" type="number" id="price" placeholder="${requestScope.pro.price}" name="price" required min="0" oninvalid="this.setCustomValidity('Vui lòng nhập Giá sản phẩm.')" oninput="this.setCustomValidity('')">
                                                                <script>
                                                                    let inputElement = document.getElementById("price");
                                                                    let valueText = inputElement.value;
                                                                    let formattedNum = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(valueText);
                                                                    inputElement.value = formattedNum;
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="address">
                                                                <strong>Ảnh sản phẩm</strong>
                                                            </label>

                                                            <br>

                                                            <c:if test="${requestScope.pro.imageURL == null}">
                                                                <label class="form-label" for="address">
                                                                    Không có ảnh sản phẩm
                                                                </label>
                                                            </c:if>

                                                            <c:if test="${requestScope.pro.imageURL != null}">
                                                                <div class="tag" style="
                                                                     background-image: url('<%=request.getContextPath()%>/${requestScope.pro.imageURL}');
                                                                     background-repeat: no-repeat;
                                                                     background-size: contain;
                                                                     height: 300px;
                                                                     width: 300px;">

                                                                </div>
                                                            </c:if>
                                                            <input class="form-control" type="file" id="imageUpload" name="imageUpload" accept="image/*">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label" for="country">
                                                                <strong>Mô tả chi tiết</strong>
                                                            </label>
                                                            <textarea class="form-control" id="productDescription" name="productDescription" placeholder="${requestScope.pro.description}"></textarea>

                                                        </div>
                                                        <div class="back">
                                                            <a href="<%=request.getContextPath()%>/product" class="btn btn-primary btn-sm" role="button">
                                                                Quay lại
                                                            </a>
                                                            <button class="btn btn-primary btn-sm" type="submit">
                                                                Lưu
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%@include file="../../../common/_footer.jsp" %>
            </div>

            <%@include file="../../../common/_goback.jsp" %>
        </div>

        <script src="<%=request.getContextPath()%>/view/assets/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/view/assets/js/bs-init.js"></script>
        <script src="<%=request.getContextPath()%>/view/assets/js/theme.js"></script>
    </body>

</html>