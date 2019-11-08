<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/fore/footer.css">
<link rel="stylesheet" href="css/fore/topWithSimpleSearch.css">
<style>
.registerSuccessDiv {
	background-color: #F3FDF6;
	border: 1px solid #DEF3E6;
	padding: 20px 130px;
	font-size: 14px;
}

.registerSuccessDiv img {
	vertical-align: middle;
}
</style>
</head>
<body>

	<%@include file="include/topWithSimpleSearch.jsp"%>

	<div class="registerSuccessDiv">
		<img src="img/site/registerSuccess.png"> 恭喜注册成功
	</div>

	<%@include file="include/footer.jsp"%>
</body>
</html>