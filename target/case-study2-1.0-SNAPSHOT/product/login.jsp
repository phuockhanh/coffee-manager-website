<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/7/2021
  Time: 06:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="multimedia/css4.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <meta charset="utf-8">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <h2>MEIN ACCOUNT</h2>
    <div class="container">
        <div class="form1">
            <h2>ANMELDEN</h2>
            <form method="post" action="product?action=register">
                <div class="row1">
                    <div class="col-6 name">
                        <input type="text" name="nameRg" required="required">
                        <span>Name</span>
                    </div>
                    <div class="col-6 email">
                        <input type="text" name="emailRg" required="required">
                        <span>Email</span>
                    </div>
                </div>
                <div class="row4">
                    <div class="col-6 pass">
                        <input type="PassWord" name="passRg" required="required">
                        <span>PassWord</span>
                    </div>
                    <div class="col-6 pass2">
                        <input type="PassWord" name="pass2Rg" required="required">
                        <span>PassWord</span>
                    </div>
                </div>
                <div class="row1 row2 col-12">
                    <input type="text" name="phoneRg" required="required">
                    <span>Phone</span>
                </div>
                <div class="row1 row3 col-12">
                    <input required="required" name="addressRg" type="text">
                    <span>Address</span>
                </div>
                <div class="row1 col-12">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
        <div class="form2">
            <h2>NEUES KUNDENKONTO ANLEGEN</h2>
            <form method="post" action="product?action=login">
                <div class="row1 row2 col-12">
                    <input type="text" name="nameLg" required="required">
                    <span>User Name</span>
                </div>
                <div class="row1 row3 col-12">
                    <input type="PassWord" name="passLg">
                    <span>PassWord</span>
                </div>
                <div class="row1 col-12">
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../multimedia/js2.js"></script>
</body>
</html>
