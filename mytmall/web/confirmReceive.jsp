  
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
            upper half of receive info */
        .receiveInfo {
            max-width: 1013px;
            margin: 100px auto 0px auto;
            /* border: 1px solid; */
        }

        .receiveImg {
            /* border: 1px solid; */
            width: 900px;
            margin: 20px auto 80px auto;
            position: relative;
        }

        .receiveImg div {
            color: #999999;
        }

        .time1 {
            position: absolute;
            top: 100px;
        }

        .time2 {
            position: absolute;
            left: 200px;
            top: 100px;
        }

        .time3 {
            position: absolute;
            top: 100px;
            left: 400px;
        }

        .receiveText {
            font-size: 16px;
            font-weight: bold;
            margin-left: 5px;
            border-bottom: 1px solid #adcbe6;
            padding-bottom: 15px;
            /* margin: 0px auto; */
            /* border: 1px solid; */
            /* width: 500px; */
            /* text-align: center; */
        }

        .receiveItemText {
            display: block;
            margin: 15px 15px;
            font-size: 14px;
        }

        .receiveItemTB {
            border: 1px solid #dddddd;
            width: 98%;
            margin: 0px auto;
        }

        .receiveItemTB thead {
            border: 1px solid #dddddd;
            background-color: #e8f2ff;
        }

        .receiveItemTB th {
            /* border: 1px solid; */
            font-size: 15px;
            text-align: center;
            width: 120px;
            height: 30px;
        }

        .receiveItemTB td {
            padding: 20px 20px;
            text-align: center;
        }

        .receiveAllPrice {
            float: right;
            margin: 20px 20px;
            font-size: 14px;
        }

        .receiveItemAllPrice {
            font-weight: bold;
            font-size: 18px;
            color: #666666;
        }

        .receiveAllPriceDigit {
            color: #c40000;
        }

        a {
            color: #999;
        }

        .receiveItemLink a:hover {
            color: #c40000;
            text-decoration: none;
        }

        /* note
           seconde half of receive info  */
        .receiveAddressTB {
            width: 95%;
            border-top: 1px solid #dddddd;
            margin: 0px auto;
        }

        .receiveAddressTB td {
            padding: 8px;
        }

        .receiveConfirm {
            margin-top: 40px;
            border: 1px solid #f58b0f;
            height: 120px;
            margin: 10px;
        }

        .wwIcon {
            display: inline-block;
            background-image: url(img/site/wangwang.gif);
            height: 20px;
            width: 70px;
            background-repeat: none;
            background-color: transparent;
        }

        .receiveConfirmText {
            padding: 20px 60px;
            font-size: 16px;
            color: red;
            font-weight: bold;
        }

        .receiveConfirmButton {
            border: 1px solid #e67c00;
            margin: 10px 60px;
            color: white;
            background-color: #f4a21d;
            border-radius: 4px;
            /* line-height: 20px; */
            padding: 5px;
            font-size: 12px;
            /* outline: none; */
        }

        .receiveConfirmButton:hover {
            background-color: #f6ae30;
        }
    </style>
</head>

<body>
    <%@include file="include/topWithSimpleSearch.jsp"%>
    <div class="receiveInfo">
        <div class="receiveImg">
            <img src="img/site/comformPayFlow.png" alt="">
            <div class="time1">2016-09-14 11:14:45</div>
            <div class="time2">2016-09-14 11:14:47</div>
            <div class="time3">yyyy-MM-dd HH:mm:ss</div>
        </div>
        <div class="receiveText">商品を受け取り、Alipayで支払うことに同意します</div>
        <span class="receiveItemText">オーダー詳細</span>
        <div class="receiveItemTBDiv">
            <table class="receiveItemTB">
                <thead>
                    <tr>
                        <th colspan="2">商品</th>
                        <th>単価</th>
                        <th>数量</th>
                        <th>総価格</th>
                        <th>送料</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${o.orderItems}" var="oi">
                    <tr>
                        <td>
                            <img src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"" alt="" width=" 45px">
                        </td>
                        <td class="receiveItemLink">
                            <a href="foreproduct?pid=${oi.product.id}">${ oi.product.name}</a>
                        </td>
                        <td>￥${oi.product.promotePrice}</td>
                        <td>${oi.number }</td>
                        <td class="receiveItemAllPrice">￥${oi.product.promotePrice}</td>
                        <td>宅配便 ： 0.00</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="receiveAllPrice">実際払い：<span class="receiveAllPriceDigit">￥${o.totalPrice}</span></div>
        <div style="clear: both"></div>
        <div>
            <table class="receiveAddressTB">
                <tbody>
                    <tr>
                        <td>オーダー番号：</td>
                        <td>
                            ${o.orderCode}
                            <img src="img/site/confirmOrderTmall.png" alt="" width="23px">
                        </td>
                    </tr>
                    <tr>
                        <td>売店名：</td>
                        <td>
                            Tmall店舗
                            <a href="#nowhere"><span class="wwIcon"></span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>受取人情報 </td>
                        <td>${o.address}, ${o.receiver}, ${o.mobile}, ${o.post}</td>
                    </tr>
                    <tr>
                        <td>取引時間：</td>
                        <td>
                        <fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="receiveConfirm">
            <div class="receiveConfirmText">商品を受け取った後、確認してください！ </div>
            <a href="foreorderFinish?oid=${o.id}"><button class="receiveConfirmButton">支払確認</button></a>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
