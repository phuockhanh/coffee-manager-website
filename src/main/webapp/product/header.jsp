<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="fistLineHD"><p>Hol dir jetzt -20% auf deine Kaffeebestellung zu Ostern - mit dem Gutscheincode "ostern21".</p></div>
    <div class="secondLineHD"><span>Gratis Lieferung (AT/DE) ab € 20</span></span><span><i class="fas fa-envelope-square"></i><span>Newsletter</span></span></div>
</div>
<div class="topNav" id="navbar">
    <div class="logoNav">
        <a href="product/index.jsp"><span>J.<br></span><span>HORNIG</span></a>
    </div>
    <div class="contentNav">
        <ul>
            <div class="shopDown">
                <li>
                    <a href="/product?action=shop">SHOP</a>
                    <div class="dropDown-shop">
                        <div class="drop1">
                            <p>Kaffee</p>
                            <p>Ganze Bohne</p>
                            <p>Gemahlen</p>
                            <p>Spezialitätenkaffee</p>
                            <p>Kapseln</p>
                            <p>Cold Brew</p>
                            <p>Cialde & Softpads</p>
                        </div>
                        <div class="drop1">
                            <p>Tee</p>
                            <p>Doppelkammer</p>
                            <p>Bio Triangel-Beutel</p>
                        </div>
                        <div class="drop1">
                            <p>Gutscheine</p>
                            <p>Zubehör</p>
                            <p>Zubereitung</P>
                        </div>
                    </div>
                </li>
            </div>

            <li><a href="#">GASTRO & BÜRO</a></li>
            <li><a href="#">KURSE</a></li>
            <li><a href="#">ÜBER UNS</a></li>
            <li><a href="#">WISSEN</a></li>
            <li><a href="#">ZUBEREITUNG</a></li>
            <li><a href="#">BLOG</a></li>
        </ul>
    </div>
    <div class="iconNav">
        <ul>
            <li><i class="fas fa-search"></i></li>
            <c:if test="${sessionScope.acc==null}">
                <a href="/product?action=login"><li><i class="fas fa-user"></i></li></a>
            </c:if>
            <c:if test="${sessionScope.acc!=null}">
                <a href="#"><li class="text">Hello ${sessionScope.acc.getUserName()}</li></a>
                <a href="/product?action=logout"><li><i class="fas fa-sign-out-alt"></i></li></a>
            </c:if>
            <a href="/product?action=cart"><li style="position: relative"><i class="fas fa-suitcase"></i></li>
<%--                <c:if test="${sessionScope.order.getItems.size()!=0}">--%>
<%--                    <div class="circle-noti"--%>
<%--                         style="    display: flex;height: 15px;width: 15px;position: absolute;border-radius: 50%;--%>
<%--                          background-color: red;color: #fff;top: 37px;right: 69px;justify-content: center;font-size: 11px;">5</div>--%>
<%--                </c:if>--%>
            </a>
        </ul>
    </div>
</div>
