<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("li.disabled a").click(function() {
			return false;
		});
	});
</script>
</head>
<body>
	<nav>
		<ul class= "pagination">
			<li <c:if test = "${!page.hasPrevious }">class = "disabled"</c:if>>
				<a href="?page.start=0${page.param }">トップ</a>
			</li>

			<li <c:if test = "${!page.hasPrevious }">class = "disabled"</c:if>>
				<a href="?page.start=${page.start - page.count}${page.param}">前のページ</a>
			</li>


			<c:forEach begin="0" end="${page.totalPage - 1 }" varStatus = "status" >

				<li <c:if test = "${status.index * page.count == page.start }" >class = "disabled"</c:if>>
					<a href="?page.start=${status.index * page.count }${page.param}">${status.count}</a>
				</li>

			</c:forEach>


			<li <c:if test = "${!page.hasNext }">class = "disabled"</c:if>>
				<a href="?page.start=${page.start + page.count}${page.param}">次のページ</a>
			</li>

			<li <c:if test = "${!page.hasNext }">class = "disabled"</c:if>>
				 <a href="?page.start=${page.last }${page.param}">最後</a>
			</li>
		</ul>
	</nav>

</body>
</html>