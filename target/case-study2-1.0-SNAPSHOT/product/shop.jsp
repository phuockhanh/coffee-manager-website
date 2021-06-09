<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2021
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../multimedia/css2.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="img-container">
            <div class="content-img1">
                <h2>Nachhaltigkeit auf Knopfdruck</h2>
                <p>JETZT PROBIEREN: Die neuen, kompostierbaren Kapseln von J. Hornig.</p>
                <button>Online bestellen</button>
            </div>
            <img src="../multimedia/image2/row1-img-2.jpg">
            <div class="circle-img">
                <div class="title-circle"><p>100%<br> abbaubar</p></div>
                <div class="content-circle"><p>0% aluminium<br> 0% Plastic</p></div>
            </div>
        </div>
        <div class="row1">
            <div class="row1-content">
                <h2>Shop</h2>
                <p><a href="index.html">STARTSEITE</a>/ SHOP</p>
            </div>
            <div class="row1-select">
                <span>Ergebnisse 1 – 15 von 100 werden angezeigt</span>
                <a href="/product?action=sort"><button style="height: 30px; width: 100px; border: none;border-radius: 4px;background-color: #8B4513 ; color: #fff;font-size: 14px;">Sort By Price</button></a>
                <div class="arrow">
                    <c:if test="${requestScope['arrow']%2==0}">
                        <i class="fas fa-arrow-down"></i>
                    </c:if>
                    <c:if test="${requestScope['arrow']%2!=0}">
                        <i class="fas fa-arrow-up"></i>
                    </c:if>
                </div>
            </div>
        </div>
        <c:if test="${id ==null}">
            <div class="row2">
                <div class="list-row2">
                    <ul>
                        <a href="/product?action=category&id=1"><li class="btn-ctgr ${id==1?"active":""}">Kaffee</li></a>
                        <a href="/product?action=category&id=2"><li class="btn-ctgr ${id==2?"active":""}">Tee</li></a>
                        <a href="/product?action=category&id=3"><li class="btn-ctgr ${id==3?"active":""}">Sets</li></a>
                        <a href="/product?action=category&id=4"><li class="btn-ctgr ${id==4?"active":""}">Zubehör</li></a>
                        <a href="/product?action=category&id=5"><li class="btn-ctgr ${id==5?"active":""}">Zubereitung</li></a>
                        <c:if test="${sessionScope.acc.getUserName().equals('admin')}">
                            <a href="/product?action=create"><li class="btn-ctgr ${id==6?"active":""} create">Create</li></a>
                        </c:if>

                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${id==1 || (id>100 && id<200)}">
            <div class="row2">
                <div class="list-row2">
                    <ul>
                        <a href="/product?action=category&id=101"><li class="btn-ctgr ${id==101?"active":""}">ganze bohne</li></a>
                        <a href="/product?action=category&id=102"><li class="btn-ctgr ${id==102?"active":""}">Mahlkaffee</li></a>
                        <a href="/product?action=category&id=103"><li class="btn-ctgr ${id==103?"active":""}">Kapseln</li></a>
                        <a href="/product?action=category&id=104"><li class="btn-ctgr ${id==104?"active":""}">Cold brew</li></a>
                        <a href="/product?action=category&id=105"><li class="btn-ctgr ${id==105?"active":""}">Pads</li></a>
                        <a href="/product?action=category&id=106"><li class="btn-ctgr ${id==106?"active":""}">Spezialitätenkaffee</li></a>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${id==2 || (id>200 && id<300)}">
            <div class="row2">
                <div class="list-row2">
                    <ul>
                        <a href="/product?action=category&id=201"><li class="btn-ctgr ${id==201?"active":""}">Bio-Triangle Tee</li></a>
                        <a href="/product?action=category&id=202"><li class="btn-ctgr ${id==202?"active":""}">Doppelkammer</li></a>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${id==4 || (id>400 && id<500)}">
            <div class="row2">
                <div class="list-row2">
                    <ul>
                        <a href="/product?action=category&id=401"><li class="btn-ctgr ${id==402?"active":""}">Geschirr</li></a>
                        <a href="/product?action=category&id=5"><li class="btn-ctgr ${id==5?"active":""}">Zubereitung</li></a>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${id==5 || (id>500 && id<600)}">
            <div class="row2">
                <div class="list-row2">
                    <ul>
                        <a href="/product?action=category&id=501"><li class="btn-ctgr ${id ==501?"active":""}">Handfilter Zubehör</li></a>
                        <a href="/product?action=category&id=502"><li class="btn-ctgr ${id ==502?"active":""}">Aeropress Zubehör</li></a>
                    </ul>
                </div>
            </div>
        </c:if>
        <div class="row3" id="row-products">
            <c:forEach items='${requestScope["shop"]}' var="item">
                <div class="product-row3">
                    <div class="img-product">
                        <img src="multimedia/image2/${item.getUrl()}">
                    </div>
                    <c:if test="${item.getIdPdSmall()==103||item.getIdPdSmall()==401 ||item.getIdPdSmall()==501||item.getIdPdSmall()==104}">
                        <div class="title-product" style="font-size: 12px;">
                            <p style="margin-bottom: unset">${item.getName()}</p>
                        </div>
                    </c:if>
                    <c:if test="${item.getIdPdSmall()!=103 && item.getIdPdSmall()!=401 && item.getIdPdSmall()!=501 && item.getIdPdSmall()!=104}">
                        <div class="title-product">
                            <p>${item.getName()}</p>
                        </div>
                    </c:if>
                    <div class='stars'>
                        <span><i class='fas fa-star'></i></span><span><i class='fas fa-star'></i></span>
                        <span><i class='fas fa-star'></i></span><span><i class='fas fa-star'></i></span>
                        <span><i class='fas fa-star'></i></span>
                    </div>
                    <div class="content-product">
                        ab<span>${item.getPrice()}€</span><br>
                        <c:if test="${item.getPriceKg()!=0}">
                            <span class="pricekg">${item.getPriceKg()}</span>/1kg
                        </c:if>
                        <c:if test="${item.getPriceKg()==0}">
                            <span class="pricekg">...</span>
                        </c:if>
                    </div>
                    <div class="footer-product">
                        <a href="/product?action=detail&id=${item.getId()}"><p>AUSFÜHRUNG WÄHLEN</p></a>
                    </div>
                    <c:if test="${sessionScope.acc.getUserName().equals('admin')}">
                        <div class="function">
                            <a href="/product?action=edit&id=${item.getId()}"><button>Edit</button></a>
                            <a href="/product?action=delete&id=${item.getId()}"><button>Delete</button></a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <div id="number-list" class="number-list">
            <c:forEach  var="i" begin="1" end='${requestScope["numberList"]}'>
                <a href="/product?action=${action}&id=${id}&page=${i}"><span class='btn ${page==i?"active":""}'>${i}</span></a>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="../multimedia/js2.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
</body>
</html>
