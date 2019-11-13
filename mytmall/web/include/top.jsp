<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../css/fore/topWithSearch.css">
</head>
<body>
    <nav class="top">
        <a href="forehome">
            <span class="glyphicon glyphicon-home redColor"></span>
            ホームページ
        </a>
        <span>Tmallへようこそ</span>
        <c:if test="${!empty user }">
        	<a href="login.jsp">${user.name }</a>
        	<a href="forelogout">退出</a>
        </c:if>
        <c:if test="${empty user }">
       		<a href="login.jsp">请登录</a>
        	<a href="register.jsp">免费注册</a>
        </c:if>
        <span class="pull-right">
            <a href="forebought">
                オーダー</a>
            <a href="forecart">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                ショッピングカート<strong>0</strong>件
            </a>
        </span>
    </nav>
    <div style="clean:both"></div>
</body>
</html>