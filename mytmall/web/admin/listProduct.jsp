<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<script type="text/javascript">

</script>
</head>
<body>
<div>
	<div class="">
		<ol class="breadcrumb">
			<li><a href="admin_category_list">分類リスト</a></li>
			<li><a href="admin_product_list?cid=${c.id }">${c.name }</a></li>
			<li class="active">商品管理</li>
		</ol>
	</div>
	<div class="list">
		<table class="table">
			<thead class="thead">
				<th>ID</th>
				<th>写真</th>
				<th>商品名</th>
				<th>商品タイトル</th>
				<th>メーカー希望小売価格</th>
				<th>実際価格</th>
				<th>在庫</th>
				<th>写真管理</th>
				<th>属性設定</th>
				<th>編集</th>
				<th>削除</th>
			</thead>
			<tbody class="tbody">
				<c:forEach items="${list }" var="p">
					<tr>
						<td>${p.id }</td>
						<td>
							<c:if test="${!empty p.firstProductImage }">
								<img alt="" src="img/productSingle/${p.firstProductImage.id }.jpg" width="40px">
							</c:if>
						</td>
						<td>${p.name }</td>
						<td>${p.subTitle }</td>
						<td>${p.orignalPrice }</td>
						<td>${p.promotePrice }</td>
						<td>${p.stock }</td>
						<td><a href="admin_productImage_list?pid=${p.id }" class="glyphicon glyphicon-picture"></a></td>
						<td><a href=""></a></td>
						<td><a href="admin_product_edit?id=${p.id }" class="glyphicon glyphicon-edit"></a></td>
						<td><a deletelink="true" href="admin_product_delete?id=${p.id }" class="glyphicon glyphicon-trash"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="page">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	<div class="panel panel-warning addDiv">
		<div class="panel panel-heading">商品増加</div>
		<div class="panel panel-body">
			<form action="admin_product_add" method="post" id="addForm" >
				<table class="addTable">
					<tr>
						<td>商品名</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>商品タイトル</td>
						<td><input type="text" name="subTitle"></td>
					</tr>
					<tr>
						<td>メーカー希望小売価格</td>
						<td><input type="text" name="originalPrice"></td>
					</tr>
					<tr>
						<td>実際価格</td>
						<td><input type="text" name="promotePrice"></td>
					</tr>
					<tr>
						<td>在庫</td>
						<td><input type="text" name="stock"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="cid" value="${c.id }">
							<input type="submit" value="確定" class="btn btn-success">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>