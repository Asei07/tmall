<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        	<a href="forelogout">ログアウト</a>
        </c:if>
        <c:if test="${empty user }">
        	<a href="login.jsp">ログイン</a>
        	<a href="register.jsp">無料登録</a>
        </c:if>
        <span class="pull-right">
            <a href=""><span class="glyphicon glyphicon-shopping-cart redColor"></span>
                オーダー</a>
            <a href="forecart">
                <span>ショッピングカート<strong>0</strong>件</span>
            </a>
        </span>
    </nav>
</body>
</html>