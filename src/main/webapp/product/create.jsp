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
        <h2>CREATE</h2>
        <form method="post">
            <div class="row1">
                <div class="col-6 name">
                    <input type="text" name="idCr" required="required">
                    <span>Id Product</span>
                </div>
                <div class="col-6 email">
                    <input type="text" name="idSmCr" required="required">
                    <span>Id ProductLine sm</span>
                </div>
            </div>
            <div class="row4">
                <div class="col-6 pass">
                    <input type="text" name="priceCr" required="required">
                    <span>Price</span>
                </div>
                <div class="col-6 pass2">
                    <input type="text" name="priceKgCr" required="required">
                    <span>PriceKg</span>
                </div>
            </div>
            <div class="row1">
                <div class="col-6 name">
                    <input type="text" name="urlCr" required="required">
                    <span>Url Image</span>
                </div>
                <div class="col-6 email">
                    <input type="text" name="nameCr" required="required">
                    <span>Name</span>
                </div>
            </div>
            <div class="row1 row3 col-12">
                <input required="required" name="titleCr" type="text">
                <span>Title</span>
            </div>
            <div class="row1 row3 col-12">
                <input required="required" name="contentCr" type="text">
                <span>Content</span>
            </div>
            <div class="row1 col-12">
                <button type="submit">Create</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="../multimedia/js2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
