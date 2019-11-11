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
        	<a href="">退出</a>
        </c:if>
        <c:if test="${empty user }">
       		<a href="login.jsp">请登录</a>
        	<a href="register.jsp">免费注册</a>
        </c:if>
        <span class="pull-right">
            <a href="foreorder">
                オーダー</a>
            <a href="forecart">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                ショッピングカート<strong>0</strong>件
            </a>
        </span>
    </nav>
    <div>
        <a href="#nowhere"><img class="smallLogo" src="img/site/simpleLogo.png" alt=""></a>
        <form action="foresearch" method="POST">
            <div class="simpleSearch">
                <div class="pull-right smallSearch">
                    <input type="text" placeholder="キーワードから捜す"">
                    <button class="" type=" submit" value="搜索">検索</button>
                    <div class="smallSearchBelow">
                    	<c:forEach items="${cs }" var="c" varStatus="st">
                    		<c:if test="${st.count >= 8 and st.count <= 11 }">
                    			<a href="foreCategory.jsp">${c.name }</a>
              					<c:if test="${st.count != 11}">
              						<span>|</span>
              					</c:if>
                    		</c:if>
                    	</c:forEach>

                    </div>
                </div>
            </div>
        </form>

    </div>
    <div style="clean:both"></div>
</body>
</html>
