<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

<head>
    <title>ホームページ</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <link rel="stylesheet" href="css/fore/topWithSearch.css">
	<link rel="stylesheet" href="css/fore/homePage.css">
</head>

<body>
	<%@include file="include/topWithSearch.jsp" %>

    <div class="categoryWithCarousel">
        <div class="header">
            <div class="head">
                <span class="glyphicon glyphicon-th-list"></span>
                <span>商品分類</span>
            </div>
            <div class="rightMenu">
                <span><a href=""><img src="img/site/chaoshi.png" alt=""></a></span>
                <span><a href=""><img src="img/site/guoji.png" alt=""></a></span>
                <c:forEach items="${cs }" var="c" varStatus="st">
                	<c:if test="${st.count <= 4 }">
                		<span><a href="forecategory?cid=${c.id }">${c.name }</a></span>
                	</c:if>
                </c:forEach>

            </div>
        </div>
        <div class="carouselProduct carousel slide" id="carousel" data-interval="2000" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-slide-to="0" data-target="#carousel" class="active"></li>
                <li data-slide-to="1" data-target="#carousel"></li>
                <li data-slide-to="2" data-target="#carousel"></li>
                <li data-slide-to="3" data-target="#carousel"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active"><img src="img/lunbo/1.jpg" alt="" class="carousel carouselImage"></div>
                <div class="item"><img src="img/lunbo/2.jpg" alt="" class="carouselImage"></div>
                <div class="item"><img src="img/lunbo/3.jpg" alt="" class="carouselImage"></div>
                <div class="item"><img src="img/lunbo/4.jpg" alt="" class="carouselImage"></div>
            </div>
        </div>
        <div class="carouselBackgroundDiv"></div>
        <!-- category and rightMenue -->
        <div>
            <div class="category">
            	<c:forEach items="${cs }" var="c">
            		<div class="eachCategory" cid="${c.id }">
            			<span class="glyphicon glyphicon-link"></span>
            			<a href="forecategory?cid=${c.id }">${c.name }</a>
            		</div>
            	</c:forEach>
            </div>
        </div>
        <div>
        	<c:forEach items="${cs }" var="c">
        		<div class="rightMenuOfCategory" cid="${c.id }">
        			<c:forEach items="${c.productsByRow }" var="pr">
        				<div class="eachRow">
        					<c:forEach items="${pr }" var="p">
        						<a href="foreproduct?pid=${p.id }">
        							<c:forEach items="${fn:split(p.subTitle,' ') }"  var="title" varStatus="st">
        								<c:if test="${st.index == 0 }">
        									${title }
        								</c:if>
        							</c:forEach>
        						</a>
        					</c:forEach>
        					<div class="rowBelow"></div>
        				</div>
        			</c:forEach>
        		</div>
        	</c:forEach>
        </div>
    </div>
    <div class="categoryProduct">
    	<c:forEach items="${cs }" var="c" varStatus="st">
    		<div class="eachCategoryProduct">
    			<div class="leftMark"></div>
    				<span class="categoryName">${c.name }</span>
    				<!-- span行内标签 产品浮动后会跟在浮动元素后 新建块级标签使元素在新行浮动  换行有同样效果-->
					<br>
    				<c:forEach items="${c.products}" var="p" varStatus="st">
    					<c:if test="${st.count <= 5 }">
		    				<div class="productItem">
		    					<a href="foreproduct?pid=${p.id }">
		    						<img alt="" src="img/productSingle_middle/${p.firstProductImage.id}.jpg" width="100px" class="productItemImg">
		    					</a>
		    					<a href="foreproduct?pid=${p.id }">
		    						<span class="productItemInfo">
		    							[热销]${fn:substring(p.name,0,20) }
		    						</span>
		    					</a>
		    					<span class="productItemPrice">
		    					 <fmt:formatNumber value="${p.promotePrice }"  minFractionDigits="2"/>
		    					</span>
		    				</div>
	    				</c:if>
    				</c:forEach>
    				 <!-- 清除浮动使mark不包围产品 -->
    				<div style="clear: both"></div>
    		</div>
    	</c:forEach>
        <img src="img/site/end.png" alt="" class="endPng">
    </div>
	<%@include file="include/footer.jsp" %>
</body>
<script>
    function showCategory(cid) {
        $(".eachCategory[cid=" + cid + "]").css("background-color", "white");
        $(".rightMenuOfCategory[cid=" + cid + "]").show();
    }
    function hideCategory(cid) {
        $(".eachCategory[cid=" + cid + "]").css("background-color", "#e2e2e3");
        $(".rightMenuOfCategory[cid=" + cid + "]").hide();
    }
    $(function () {
        $(".rightMenuOfCategory").hide();
        $(".eachCategory").mouseenter(function () {
            var cid = $(this).attr("cid");
            showCategory(cid);
        });
        $(".eachCategory").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideCategory(cid);
        });
        $(".rightMenuOfCategory").mouseenter(function () {
            var cid = $(this).attr("cid");
            showCategory(cid);
        });
        $(".rightMenuOfCategory").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideCategory(cid);
        });
    });
</script>

</html>