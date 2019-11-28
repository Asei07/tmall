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
    <style>
     /* top */
        body {
			font-size:12px;
            min-width: 1024px;
        }

        a {
            color: #999;
        }

        .redColor {
            color: #C40000 !important;
        }

        .top {
            background-color: #f2f2f2;
            padding-top: 5px;
            padding-bottom: 5px;
            border-bottom: 1px solid #e7e7e7;
        }

        .top span,
        .top a {
            color: #999;
            margin: 0px 10px 0px 10px;
        }

        .top a:hover {
            color: #C40000;
            text-decoration: none;
        }
        
        body {
            font-size: 12px;
            min-width: 1013px;
        }

        .confirmDiv {
            max-width: 1013px;
            margin: 20px auto;
        }

        /* note
            address */
        .address {
            margin: 20px 10px;
            /* text-align: left; */
        }

        .addressTip,
        .confirmText {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 16px;
        }

        .addressTB {
            margin: 20px 20px;
            /* border: 1px solid; */
            width: 600px;
            font-size: 12px;
        }

        .addressTB td {
            padding: 5px 0px;
            vertical-align: top;

        }

        .addressTB textarea {
            width: 400px;
            border: 1px solid #afafaf;
        }

        .addressTB input {
            width: 200px;
            border: 1px solid #afafaf;
        }

        .redStar {
            font-size: 8px;
            color: #c40000;
        }

        /* note
            confirm info of order  */
        .confirmOrderDiv {
            margin: 30px 10px;
        }

        .confirmOrderTB {
            width: 100%;
        }

        .confirmOrderTB th {
            text-align: center;
            padding-bottom: 5px;
            color: #999999;
            font-weight: normal;
            /* border: 1px solid; */
        }

        .confirmOrderTB td {
            /* border: 1px solid; */
            text-align: center;
            /* margin: 10px; */
        }

        .confirmItemTr td {
            border-bottom: 1px solid #e5e5e5;
        }

        .orderFirstTd,
        .orderLastTd {
            border-bottom: none !important;
        }

        .firstTh {
            text-align: left !important;
        }

        .blueLine td {
            background-color: #b2d1ff;
            border-right: 2px solid white;
            height: 3px;
        }

        .wwGif {
            display: inline-block;
            background-image: url(img/site/wangwang.gif);
            width: 20px;
            height: 20px;
            background-position: -82px 0px;
            position: relative;
            top: 2px;
        }

        .confirmOrderImg {
            width: 60px;
            padding: 5px 0px;
        }

        .confirmImgTd,
        .confirmOrderItem {
            text-align: left !important;
        }

        .orderItemLink {
            display: block;
            color: black;
        }

        .confirmItemPrice {
            color: #c40000;
            font-weight: bold;
        }

        .confirmOrderFoot {
            background-color: #f2f6ff;
            margin-top: 10px;
            border-top: 2px solid #b4d0ff;
            /* height: 50px; */
        }

        .confirmOrderFoot span {
            display: inline-block;
            margin: 20px;
            color: #999999;
            clear: both;
        }
        .leaveMessageText{
            float: left;
        }
        .leaveMessageTextArea{
            resize: none;
            width:250px;
            height: 60px;
            border: 1px solid #ffad35;
        }
        .confirmPrice {
            margin: 20px;
            overflow: hidden;
            color: #999999;
        }

        .confirmPriceDigit {
            color: #c40000;
            font-weight: bold;
            font-size: 20px;
        }

        .confirmButton {
            background-color: #c40000;
            color: white;
            border-radius: 2px;
            border: 1px solid;
            width: 180px;
            height: 40px;
            font-size: 14px;
            font-weight: 700;

        }

        a {
            color: black;
        }

        a:hover {
            text-decoration: none;
            color: #c40000;
        }
    </style>
    <script>
        $(function(){
            $(".leaveMessageImg").click(function(){
                $(this).hide();
                $(".leaveMessage").show();
            });
        });
    </script>
</head>

<body>
	<%@include file="include/top.jsp" %>
    <div class="confirmDiv">
        <form action="forecreateOrder" method="post">
        <div class="confirmFlow">
            <img src="img/site/simpleLogo.png" alt="" class="pull-left">
            <img src="img/site/buyflow.png" alt="" class="pull-right">
        </div>
        <div style="clear: both"></div>
        <div class="address">
            <div class="addressTip">住所確認</div>
            <table class="addressTB">
                <tbody>
                    <tr>
                        <td>住所<span class="redStar">*</span></td>
                        <td><textarea name="address" id=""></textarea></td>
                    </tr>
                    <tr>
                        <td>郵便番号<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="post"></td>
                    </tr>
                    <tr>
                        <td>名前<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="name"></td>
                    </tr>
                    <tr>
                        <td>携帯番号<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="mobile"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="confirmOrderDiv">
            <div class="confirmText">オーダー詳細</div>
            <div class="confirmOrderInfo">
                <table class="confirmOrderTB">
                    <thead>
                        <tr>
                            <th colspan="2" class="firstTh">
                                <img src="img/site/tmallbuy.png" alt="" class="tmallImg" width="15px">
                                <a href="">店舗：Tmall店舗</a>
                                <a href=""><span class="wwGif"></span></a>
                            </th>
                            <th>単価</th>
                            <th>数量</th>
                            <th>小計</th>
                            <th>配送方法</th>
                        </tr>
                        <tr class="blueLine">
                            <td colspan="2"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${ois}" var="oi" varStatus="st">
                                <tr class="confirmItemTr">
                                        <td class="confirmImgTd orderFirstTd"><img src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" alt=""
                                                class="confirmOrderImg"></td>
                                        <td class="confirmOrderItem">
                                            <a href="foreproduct?pid=${oi.product.id }" class="orderItemLink">${oi.product.name}</a>
                                            <img src="img/site/creditcard.png" alt="">
                                            <img src="img/site/7day.png" alt="">
                                            <img src="img/site/promise.png" alt="">
                                        </td>
                                        <td>
                                        <fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/>
                                        </td>
                                        <td>${oi.number}</td>
                                        <td class="confirmItemPrice">
                                        	￥<fmt:formatNumber type="number"  value="${oi.product.promotePrice * oi.number}"  minFractionDigits="2"/>
                                        </td>
                                        <c:if test="${st.count == 1}">
                                        <td rowspan="10" class="orderLastTd">
                                            <input type="radio" checked>
                                           普通配送
                                            <select class="distributionMethod">
                                                <option value="">送料無料</option>
                                            </select>
                                        </td>
                                        </c:if>
                                    </tr>                           
                        </c:forEach>      
                    </tbody>
                </table>
            </div>
            <div class="confirmOrderFoot">
                <div class="pull-left">
                    <span class="leaveMessageText">売店へのメッセージ:</span>
                    <span class="leaveMessageImg"><img src="img/site/leaveMessage.png" alt=""></span>
                    <span class="leaveMessage" style="display: none;">
                        <textarea name="" id=""  class="leaveMessageTextArea"></textarea>
                        <div class="typeText">200文字を入力することもできます</div>
                    </span>
                </div>
                <div class="pull-right"> <span>店舗合計（送料を含む）: ￥
                <fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span></div>
                <div style="clear: both"></div>
            </div>
            <div class="confirmPrice">
                <div class="pull-right">
                    <span>実際払い：</span>
                    <span class="confirmPriceDigit">￥
                    <fmt:formatNumber type="number" value="${total }" minFractionDigits="2"/> </span>
                </div>
            </div>
            <div style="clear: both"></div>
            <div><button class="confirmButton pull-right">注文を送信</button></div>
        </div>
        </form>
    </div>
    <div style="clear: both;"></div>
    
    <%@include file="include/footer.jsp" %>
</body>

</html>
