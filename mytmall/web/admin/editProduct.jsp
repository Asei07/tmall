<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品編集</title>
</head>
<body>
	<div class="nav">
		<ol class="breadcrumb">
			<li><a href="admin_category_list">商品リスト</a></li>
			<li><a href="admin_product_list?cid=${c.id }">${c.name }</a></li>
			<li class="active">${p.name }</li>
			<li class="active">商品編集</li>
		</ol>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">商品編集</div>
		<div class="panel-body">
			<form action="admin_product_update" method="post">
				<table>
					<tr>
						<td>商品名</td>
						<td><input type="text" name="name" value="${p.name }"></td>
					</tr>
					<tr>
						<td>商品タイトル</td>
						<td><input type="text" name="subTitle" value="${p.subTitle }"></td>
					</tr>
					<tr>
						<td>メーカー希望小売価格</td>
						<td><input type="text" name="originalPrice" value="${p.orignalPrice }"></td>
					</tr>
					<tr>
						<td>実際価格</td>
						<td><input type="text" name="promotePrice" value="${p.promotePrice }"></td>
					</tr>
					<tr>
						<td>在庫</td>
						<td><input type="text" name="stock" value="${p.stock }"></td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="cid" value="${c.id }">
							<input type="hidden" name="id" value="${p.id }">
							<input type="submit" name="確定"  class="btn btn-success">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>