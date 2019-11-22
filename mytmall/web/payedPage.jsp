  
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

        .payedDiv {
            border: 1px solid #d4d4d4;
            max-width: 1013px;
            margin: 100px auto 0px auto;
        }

        .payedTextInfo {
            background-color: #ecffdc;
            padding: 18px 20px;
        }

        .payedText {
            font-size: 14px;
            font-weight: bold;
            margin-left: 10px;
        }

        .payedAddressInfo {
            padding: 25px 20px;
        }

        .payedPrice {
            color: #c40000;
            font-weight: bold;
            font-size: 14px;
        }

        .payedLink {
            margin-left: 30px;
        }

        .payedSplitLine {
            border-top: 1px dotted #d4d4d4;
            margin: 0px 40px;
        }

        .payedWarnInfo {
            margin: 20px 30px 20px 30px;
        }

        .payedWarn {
            color: #c40000;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <%@include file="include/topWithSimpleSearch.jsp"%>
    <div class="payedDiv">
        <div class="payedTextInfo">
            <img src="img/site/paySuccess.png" alt="">
            <span class="payedText">您已成功付款</span>
        </div>
        <div class="payedAddressInfo">
            <ul class="payedAddress">
                <li>收货地址： ${o.address} ${o.receiver} ${o.mobile}</li>
                <li>实付款：<span class="payedPrice">￥${total}</span></li>
                <li>预计08月08日送达</li>
            </ul>
            <div class="payedLink">
                <span>您可以</span>
                <a href="forebought">查看已买到的宝贝</a>
                <a href="forebought">查看交易详情</a>
            </div>
        </div>
        <div class="payedSplitLine"></div>
        <div class="payedWarnInfo">
            <img src="img/site/warning.png" alt="">
            <b>安全提醒:</b>
            <span>
                下单后，<span class="payedWarn">用QQ给您发送链接办理退款的都是骗子！</span> 天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
            </span>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
