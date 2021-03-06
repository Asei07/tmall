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
        	<a href="forelogout">ログアウト</a>
        </c:if>
        <c:if test="${empty user }">
       		<a href="login.jsp">ログイン</a>
        	<a href="register.jsp">無料登録</a>
        </c:if>
        <span class="pull-right">
            <a href="forebought">
                マイオーダー</a>
            <a href="forecart">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                ショッピングカート<strong> ${0 + itemNum }</strong>件
            </a>
        </span>
    </nav>
    <div>
        <a href="#nowhere"><img class="smallLogo" src="img/site/simpleLogo.png" alt=""></a>
        <form action="foresearch" method="post">
            <div class="simpleSearch">
                <div class="pull-right smallSearch">
                    <input type="text" name="keyword" value="" placeholder="キーワードから捜す"">
                    <button class="" type="submit" value="搜索">検索</button>
                    <div class="smallSearchBelow">
                    	<c:forEach items="${cs }" var="c" varStatus="st">
                    		<c:if test="${st.count >= 7 and st.count <= 9}">
                    			<a href="forecategory?cid=${c.id}">${c.name }</a>
              					<c:if test="${st.count != 9}">
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