<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/6/2021
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="../multimedia/css3.css">
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
      <div class="image">
        <img src="multimedia/image2/${product.getUrl()}">
      </div>
      <div class="content">
        <div class="text">
          <h2>${product.getName()}</h2>
          <span><i class='fas fa-star'></i></span><span><i class='fas fa-star'></i></span>
          <span><i class='fas fa-star'></i></span><span><i class='fas fa-star'></i></span>
          <span><i class='fas fa-star'></i></span>
          <h3>${product.getContent()}</h3>
        </div>
        <div class="payment">
          <div class="price">
            <h3>${product.getPrice()} €</h3>
            <c:if test="${product.getPriceKg()!=0}">
              <small>(${product.getPriceKg()}/1kg)</small>
            </c:if>
          </div>
          <div class="paymentCount">
            <div class="qty mt-5">
              <form method="post" action="product?action=cart&id=${product.getId()}">
                <span class="minus bg-dark">-</span>
                <input type="number" class="count1" name="amount" value="1">
                <span class="plus bg-dark">+</span>
                <input type="submit" value="IN DEN WARENKORB" class="submit">
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="../multimedia/js3.js"></script>
</html>
