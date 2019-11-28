  
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
            <span class="payedText">支払いが完了しました</span>
        </div>
        <div class="payedAddressInfo">
            <ul class="payedAddress">
                <li>配送先： ${o.address} ${o.receiver} ${o.mobile}</li>
                <li>支払金額：<span class="payedPrice">￥${total}</span></li>
                <li>一週間以内に到着する予定です</li>
            </ul>
            <div class="payedLink">
                <span>表示</span>
                <a href="forebought">購入した物を見ます</a>
                <a href="forebought">取引詳細を見ます</a>
            </div>
        </div>
        <div class="payedSplitLine"></div>
        <div class="payedWarnInfo">
            <img src="img/site/warning.png" alt="">
            <b>セキュリティリマインダー:</b>
            <span>
                ご注文後，<span class="payedWarn">Lineを使用して払い戻しのリンクを送信する人は詐欺師です！</span> Tmallには、システムのアップグレードや異常な注文などの問題はありません。偽のカスタマーサービス電話詐欺に注意してください。
            </span>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
