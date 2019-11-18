<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="top">
        <a href="${contextPath}">
            <span class="glyphicon glyphicon-home redColor"></span>
            天猫首页
        </a>
        <span>欢迎来天猫</span>
        <c:if test="${!empty user }">
        	<a href="login.jsp">${user.name }</a>
        	<a href="forelogout">退出</a>
        </c:if>
        <c:if test="${empty user }">
        	<a href="login.jsp">请登录</a>
        	<a href="register.jsp">免费注册</a>
        </c:if>
        <span class="pull-right">
<<<<<<< HEAD
            <a href="foreorder"><span class="glyphicon glyphicon-shopping-cart redColor"></span>
=======
            <a href="forebought"><span class="glyphicon glyphicon-shopping-cart redColor"></span>
>>>>>>> edit-version
                我的订单</a>
            <a href="forecart">
                <span>购物车<strong>0</strong>件</span>
            </a>
        </span>
    </nav>
      <a href=""><img class="logo" src="img/site/logo.gif" alt=""></a>
    <form action="foresearch" method="post">
    <div class="searchDiv">
<<<<<<< HEAD
        <form action="foresearch" method="post">
        <input type="text" placeholder="时尚男鞋 太阳镜">
=======
        <input type="text" name="keyword" value="${param.keyword}" placeholder="时尚男鞋 太阳镜">
>>>>>>> edit-version
        <button class="searchButton" type="submit" value="搜索">検索</button>
        <div class="searchBelow">
        	<c:forEach items="${cs }" var="c" varStatus="st">
        		<c:if test="${st.count >= 5 and st.count <= 8 }">
        			<a href="foreCategory?cid=${c.id }">
        				${c.name }
        			</a>
        			<c:if test="${st.count != 8 }">
        				<span>|</span>
        			</c:if>
        		</c:if>
        	</c:forEach>
        </div>
        </from>
    </div>
    </form>        
</body>
</html>
