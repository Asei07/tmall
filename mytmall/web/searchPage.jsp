<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

<head>
    <script src="study/js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="study/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <link rel="stylesheet" href="css/fore/topWithSimpleSearch.css">
    <style>
      
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
    <%@include file="include/topWithSimpleSearch.jsp">
    
    <div class="categoryPage">
        <!-- 数を制限する -->
        <c:if test="${empty param.categoryCount}">
            <c:set var="categoryCount" scope="page" value="100"></c:set>
        </c:if>
        <c:if test="${!empty param.categoryCount}">
            <c:set var="categoryCount" scope="page" value="${param.categoryCount}"></c:set>
        </c:if>

        <div class="categoryProducts">
            <c:forEach items="${ps}}" var="p" varStatus="stc">
                <c:if test="${stc.count <= categoryCount}">
                    <div price="${p.price}" class="productUnit">
                        <div class="productUnitFrame">
                                <a href="foreproduct?pid=${p.id}"><img width="100px" src="img/productSingle_middle/${p.firstProductImage.id}.jpg" alt="" class="unitImg"></a>
                                <span class="unitPrice">${p.premotePrice}</span>
                                <a href="foreproduct?pid=${p.id}" class="unitLink">${fn:substring(p.name,0,50)}</a>
                                <a href="foreproduct?pid=${p.id}" class="unitTM">天猫专卖</a>
                                <div class="unitInfo">
                                    <span class="monthDeal">月成交<span class="monthDealNumber">${p.saleCount}笔</span></span>
                                    <span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
                                    <span class="wangwang">
                                        <a href=""><img src="img/site/wangwang.png" alt="" "></a>
                                    </span>
                                </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>  
            <c:if test = "${empty ps}">
                <div class="noMatch">該当する商品は見つかりませんでした</div>
            </c:if>
         </div>
        </div>
            <div style="clear: both;"></div>
            <%@include file="include/footer.jsp">
</body>

</html>
