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
    <link rel="stylesheet"  href="css/fore/top.css">
    <link rel="stylesheet" href="css/fore/footer.css">
    <style>
        body {
            font-size: 12px;
        }

        .aliPay {
            max-width: 1013px;
            margin: 10px auto;
            text-align: center;
        }
		.aliPayText{
			color: #4d4d4d;
		}
        .aliPayPrice {
            display: block;
            color: #ff6600;
            font-weight: bold;
            font-size: 20px;
            margin: 10px;
        }

        .confirmPay {
            border: 1px solid;
            background-color: #00aaee;
            color: white;
            font-weight: bold;
            line-height: 30px;
            width: 100px;
            margin-top: 20px;
        }
	
        .aliPayLogoImg {
            margin: 20px 0px 20px -100px;
        }
    </style>
</head>

<body>
    <%@include file="include/top.jsp"%>
    </nav>
    <div class="aliPay">
        <div class="aliPayLogoImg">
            <img src="img/site/simpleLogo.png" alt="" class="pull-left">
            <div style="clear: both"></div>
        </div>
        <div>
            <span class="aliPayText">スキャン払い（元）</span>
            <span class="aliPayPrice">￥
            <fmt:formatNumber  value="${param.total}"  minFractionDigits="2"/>
            </span>
        </div>
        <div>
            <img src="img/site/alipay2wei.png" alt="" class="">
        </div>
        <div>
            <a href="forepayed?oid=${param.oid}&total=${param.total}">
                <button class="confirmPay">支払確認</button>
            </a>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
