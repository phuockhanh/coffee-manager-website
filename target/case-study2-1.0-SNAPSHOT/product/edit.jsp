<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/7/2021
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="multimedia/cssedit.css">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="form1">
        <div class="container">
            <h2>EDIT</h2>
            <form method="post">
                <div class="row1">
                    <div class="col-6 name">
                        <input type="text" name="nameEd" required="required" value="${product.getName()}">
                        <span>Name</span>
                    </div>
                    <div class="col-6 email">
                        <input type="text" name="idSmEd" required="required" value="${product.getIdPdSmall()}">
                        <span>Id ProductLine sm</span>
                    </div>
                </div>
                <div class="row4">
                    <div class="col-6 pass">
                        <input type="text" name="priceEd" required="required" value="${product.getPrice()}">
                        <span>Price</span>
                    </div>
                    <div class="col-6 pass2">
                        <input type="text" name="priceKgEd" required="required" value="${product.getPriceKg()}">
                        <span>PriceKg</span>
                    </div>
                </div>
                <div class="row1">
                    <div class="col-6 name">
                        <input type="text" name="urlEd" required="required" value="${product.getUrl()}">
                        <span>Url Image</span>
                    </div>
                    <div class="col-6 email">
                        <input type="text" name="titleEd" required="required" value="${product.getTitle()}">
                        <span>Title</span>
                    </div>
                </div>
                <div class="row1 row3 col-12">
                    <input required="required" name="contentEd" type="text" value="${product.getContent()}">
                    <span>Content</span>
                </div>
                <div class="row1 col-12">
                    <button type="submit">Edit</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="../multimedia/js2.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
