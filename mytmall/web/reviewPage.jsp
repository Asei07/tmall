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
        body {
            font-size: 12px;
        }

        .reviewDiv {
            max-width: 1013px;
            margin: 100px auto 0px auto;

        }

        .reviewImg {
            float: left;
            border: 1px solid #e7e7e7;
        }

        .reviewImg img {
            width: 400px;
            height: 400px;
            padding: 0px 20px;
        }

        .reviewProductInfo {
            overflow: hidden;
            border-top: 1px solid #e7e7e7;
            padding: 30px 30px;
        }

        .reviewProductTitle {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .reviewTB td {
            color: #999;
            width: 80px;
        }

        .reviewTB .reviewSecendTd {
            width: 200px;
        }

        .reviewPriceDigit,
        .reviewSaleNumber {
            color: #c40000;
            font-size: 14px;
            font-weight: bold;
        }

        .productBottomDiv {
            border: 1px solid #f6f5f3;
            height: 160px;
            margin: 20px 10px;
            background-color: #fdfbfa;
        }

        .productBottomInfo {
            margin: 10px 60px;

        }

        .productBottomInfo span {
            border: 1px solid #e1e1e1;
            display: inline-block;
            width: 200px;
            position: absolute;

        }

        .productBottomInfo img {
            border: 1px solid #e1e1e1;
            height: 36px;
        }

        /* note
            reviewTotal and makeReview */
        .reviewTotalDiv {
            margin-top: 20px;
        }

        .reviewTotalLeft {
            float: left;
            width: 180px;
        }

        .reviewTotalLeftTop {
            border: 3px solid #c40000;
        }

        .reviewTotalLeftMiddle {
            text-align: center;
            font-weight: bold;
            border-left: 1px solid #d5d4d4;
            border-right: 1px solid #d5d4d6;
            /* border: 1px solid; */
            line-height: 30px;
            font-size: 13px;
            background-color: #f6f5f1;
        }

        .reviewTotalLeftFoot {
            height: 6px;
            border-left: 1px solid #d5d4d6;
            border-bottom: 1px solid #d5d4d6;
            background-color: #f6f5f1;
        }

        .reviewTotalRightEmpty {
            height: 35px;
        }

        .reviewTotalRightFoot {
            height: 6px;
            border: 1px solid #d5d4d4;
            background-color: #f6f5f1;
        }

        .makeReviewDiv {
            border: 1px solid #d1ccc8;
            background-color: #efefef;
            margin: 20px 0px;
        }

        .makeReviewText {
            margin: 20px 30px;
            font-size: 16px;
            font-weight: bold;
            color: #333333;
        }

        .makeReviewTB {
            border: 1px solid #e7e7e7;
            margin-left: 30px;
            font-size: 12px;
            background-color: white;
        }

        .makeReviewTB td {
            /* border-right: 1px solid #e7e7e7; */
            background-color: white;
            padding: 5px;
        }

        .makeReviewTBFirstTD {
            border-right: 1px solid #e7e7e7;
        }

        .makeReviewContent {
            border-width: 0px;
            resize: none;
            width: 420px;
            height: 120px;
        }

        .makeReviewButtonDiv {
            background-color: white;
            margin: 18px 0px;
            height: 50px;
            text-align: center;
        }

        .makeReviewButtonDiv button {
            height: 26px;
            width: 72px;
            margin-top: 10px;
            border-width: 0px;
            color: white;
            background-color: #c40000;
            border-radius: 2px;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
</head>

<body>
    
    <%@include file="include/topWithSimpleSearch.jsp"%>
        
    <div class="reviewDiv">
        <div class="reviewImg">
            <img src="img/productSingle/${p.firstProductImage.id}.jpg" alt="">
        </div>
        <div class="reviewProductInfo">
            <div class="reviewProductTitle">${p.name}</div>
            <table class="reviewTB">
                <tbody>
                    <tr>
                        <td>価格</td>
                        <td class="reviewSecendTd"><span class="reviewPriceDigit"> ￥
                        	<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                        </span>円</td>
                    </tr>
                    <tr>
                        <td>配送</td>
                        <td clsas="reviewSecendTd">宅配便: 0.00</td>
                    </tr>
                    <tr>
                        <td>月取引量</td>
                        <td class="reviewSecendTd"><span class="reviewSaleNumber">${p.saleCount}</span>件</td>
                    </tr>
                </tbody>
            </table>
            <div class="productBottomDiv">
                <div class="productBottomInfo">
                    <img src="img/site/reviewLight.png" alt="">
                    <span>購入した製品の情報を表示しています.
                    <fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    にこの製品を注文しました</span>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
        <div class="reviewTotalDiv">
            <div class="reviewTotalLeft">
                <div class="reviewTotalLeftTop"></div>
                <div class="reviewTotalLeftMiddle">累加評価<span class="reviewTotalDigit">${p.reviewCount}</span></div>
                <div class="reviewTotalLeftFoot"></div>
            </div>
            <div class="reviewTotalRight">
                <div class="reviewTotalRightEmpty"></div>
                <div class="reviewTotalRightFoot"></div>
            </div>
        </div>
        
        <c:if test="${param.showonly != true }">
        <div class="makeReviewDiv">
            <form action="foredoReview" method="post">
            <div class="makeReviewText">アドバイス</div>
            <table class="makeReviewTB">
                <tbody>
                    <tr>
                        <td class="makeReviewTBFirstTD">商品評価</td>
                        <td><textarea class="makeReviewContent" cols="30" rows="8" name="reviewContent"></textarea></td>
                    </tr>
                </tbody>
            </table>
            <div class="makeReviewButtonDiv">
                <input type="hidden" name="oid" value="${o.id}">
                <input type="hidden" name="pid" value="${p.id}">
                <button>送信</button>
            </div>
            </form>
        </div>
        </c:if>
        
        <c:if test="${param.showonly == true }">
        	   <c:forEach items="${reviews }" var="r">
        		<div class="reviewItem">
                <div class="reviewContent">
                   	${r.content }
                    <div class="reviewData">${r.createDate }</div>
                </div>
                <div class="reviewName">${r.user.anonymousName }<span class="nameGray">（匿名）</span></div>
                <div style="clear: both"></div>
            </div>
        	</c:forEach>
        </c:if>
    </div>
    
    <%@include file="include/footer.jsp"%> 
        
</body>

</html>
