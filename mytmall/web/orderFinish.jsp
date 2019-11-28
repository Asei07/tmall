  
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
        .orderFinishDiv {
            max-width: 1013px;
            margin: 100px auto 0px auto;
            border: 1px solid #e5e5e5;
            padding: 30px;
        }

        .orderFinish span {
            display: inline-block;
            font-size: 14px;
            font-weight: bold;
            position: absolute;
            margin: 10px;
        }
    </style>
</head>

<body>
    <%@include file="include/topWithSimpleSearch.jsp"%>
    <div class="orderFinishDiv">
        <div class="orderFinish">
            <img src="img/site/orderFinish.png" alt="">
            <span class="orderFinishText">取引完成、売店はあなたの支払を受け取ります</span>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
