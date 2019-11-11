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
            <a href=""><span class="glyphicon glyphicon-shopping-cart redColor"></span>
                我的订单</a>
            <a href="">
                <span>购物车<strong>0</strong>件</span>
            </a>
        </span>
    </nav>
      <a href=""><img class="logo" src="img/site/logo.gif" alt=""></a>
    <form action="foresearch" method="post">
    <div class="searchDiv">
        <input type="text" name="keyword" value="${param.keyword}" placeholder="时尚男鞋 太阳镜">
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
    </div>
    </form>        
</body>
</html>
