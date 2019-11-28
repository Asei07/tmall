<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <link rel="stylesheet" href="css/fore/topWithSimpleSearch.css">
    <style>
        /* note
        sort and price */
        body {
            font-size: 12px;
            min-width: 1013px;
        }

        .categoryPage {
            max-width: 1013px;
            margin: 100px auto 0px auto;
        }

        .sortBar {
            background-color: #faf9f9;
            margin: 40px 20px 20px 20px;
        }

        .sortBarTable {
            display: inline-block;
        }

        .glyphicon {
            font-size: 10px;
        }

        .sortBarTable td {
            font-size: 12px;
            border: 1px solid #cccccc;
            padding: 3px;
            margin: 2px;
        }

        .sortBarTable td:hover {
            background-color: #f1edec;
        }

        td.grayColum {
            background-color: #f1edec;
        }

        .sortBarTable a {
            color: #806f66;
        }

        .sortBarTable a:hover {
            color: #c40000;
            text-decoration: none;
        }

        .sortBarTable input {
            border-width: 0px;
            width: 50px;
            height: 15px;
        }

        .priceMiddleColum {
            color: #cccccc;
        }

        /* note
        product of category */

        .categoryProducts {
            padding: 0px 20px 40px 20px;
        }

        .productUnit {
            float: left;
            width: 225px;
            height: 330px;
            margin: 12px 5px;
            /* 鼠标悬停时候增加了边框 若不事先添加边框改变大小会影响布局且画面抖动 */
            border: 1px solid #fff;
        }

        .productUnitFrame {
            border: 1px solid #eee;
            height: 100%;
        }

        .productUnitFrame:hover {
            border: 1px solid #c40000;
        }

        .productUnit:hover {
            border: 1px solid #c40000;
        }

        .unitImg {
            width: 100%;
            height: 190px;
        }

        .unitPrice {
            display: block;
            font-size: 20px;
            margin-left: 3px;
            color: #c40000;
        }

        .unitLink {
            display: block;
            color: #333333;
            margin-top: 10px;
            text-decoration: none;
        }

        .unitLink:hover {
            color: #c40000;
        }

        .unitTM {
            display: block;
            margin-top: 10px;
            color: #999999;
        }

        .unitTM:hover {
            color: #c40000;
        }

        .unitInfo {
            margin-top: 10px;
            border-top-width: 1px;
            border-top-style: solid;
            border-top-color: #eeeeee;
            color: #999999;
        }

        .monthDealNumber {
            font-weight: bold;
            color: #B57C5B;
            margin-left: 3px;
        }

        .productReview {
            border-left-style: solid;
            border-left-color: #eeeeee;
            border-left-width: 1px;
            border-right-style: solid;
            border-right-color: #eeeeee;
            border-right-width: 1px;
        }

        .monthDeal,
        .productReview {
            display: inline-block;
            height: 23px;
            width: 90px;
            padding-top: 5px;
            padding-left: 5px;
        }

        .productReviewNumber {
            font-weight: bold;
            color: #3388bb;
        }

        .wangwang img {
            padding-left: 2px;
        }
    </style>
    <script>
        $(function () {
            $(".sortBarPrice").keyup(function () {
                var num = $(this).val();
                if (num.length == 0) {
                    $(".productUnit").show();
                    return;
                }
                if (isNaN(num)) {
                    num = 1;
                }
                if (num <= 0) {
                    num = 1;
                }
                $(this).val(num);
                var beginPrice = $(".beginPrice").val();
                var endPrice = $(".endPrice").val();
                $(".productUnit").each(function () {
                    var price = $(this).attr("price");
                    price = new Number(price);
                    // document.write(typeof price);
                    $(this).hide();
                    if (price >= beginPrice && price <= endPrice) {
                        $(this).show();
                    }
                });
            });
        });
    </script>
</head>

<body>
    <%@include file="include/topWithSimpleSearch.jsp" %>

    <div class="categoryPage">
        <img src="img/category/72.jpg" alt="">
        <div class="sortBar">
            <table class="sortBarTable">
                <tbody>
                    <tr>
                        <td <c:if test="${param.sort == 'all' || empty param.sort}">class="grayColum"</c:if>>
                            <a href="?cid=${c.id}&sort=all">総合<span class="glyphicon glyphicon-arrow-down"></span></a>
                        </td>
                        <td <c:if test="${param.sort == 'review'}">class="grayColum"</c:if>>
                            <a href="?cid=${c.id}&sort=review">人気<span class="glyphicon glyphicon-arrow-down"></span></a>
                        </td>
                        <td <c:if test="${param.sort == 'date'}">class="grayColum"</c:if>>
                            <a href="?cid=${c.id}&sort=date">新品<span class="glyphicon glyphicon-arrow-down"></span></a>
                        </td>
                        <td <c:if test="${param.sort == 'saleCount'}">class="grayColum"</c:if>>
                            <a href="?cid=${c.id}&sort=saleCount">売上<span class="glyphicon glyphicon-arrow-down"></span></a>
                        </td>
                        <td <c:if test="${param.sort == 'price'}">class="grayColum"</c:if>>
                            <a href="?cid=${c.id}&sort=price">価格<span class="glyphicon glyphicon-resize-vertical"></span></a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="sortBarTable">
                <tbody>
                    <tr>
                        <td><input type="text" placeholder="" class="sortBarPrice beginPrice"></td>
                        <td class="grayColum priceMiddleColum">-</td>
                        <td><input type="text" placeholder="" class="sortBarPrice endPrice"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 数を制限する -->
        <c:if test="${empty param.categoryCount}">
            <c:set var="categoryCount" scope="page" value="100"></c:set>
        </c:if>
        <c:if test="${!empty param.categoryCount}">
            <c:set var="categoryCount" scope="page" value="${param.categoryCount}"></c:set>
        </c:if>

        <div class="categoryProducts">
            <c:forEach items="${c.products}" var="p" varStatus="stc">
                <c:if test="${stc.count <= categoryCount}">
                    <div price="${p.promotePrice}" class="productUnit">
                        <div class="productUnitFrame">
                                <a href="foreproduct?pid=${p.id}"><img width="100px" src="img/productSingle_middle/${p.firstProductImage.id}.jpg" alt="" class="unitImg"></a>
                                <span class="unitPrice">
                                <fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                                </span>
                                <a href="foreproduct?pid=${p.id}" class="unitLink">${fn:substring(p.name,0,50)}</a>
                                <a href="foreproduct?pid=${p.id}" class="unitTM">Tmall独占</a>
                                <div class="unitInfo">
                                    <span class="monthDeal">月売上<span class="monthDealNumber">${p.saleCount}回</span></span>
                                    <span class="productReview">評価<span class="productReviewNumber">${p.reviewCount}</span></span>
                                    <span class="wangwang">
                                        <a href=""><img src="img/site/wangwang.png" alt="" "></a>
                                    </span>
                                </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
         </div>
        </div>
            <div style="clear: both;"></div>
            <%@include file="include/footer.jsp" %>

</body>

</html>