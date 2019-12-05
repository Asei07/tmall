<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品写真管理</title>
</head>
<body>
<div class="workingArea">
	<ol class="breadcrumb">
		<li><a href="admin_category_list">分類リスト</a></li>
		<li><a href="admin_product_list?cid=${p.category.id }">${p.category.name }</a></li>
		<li class="active">${p.name }</li>
		<li class="active">商品写真管理</li>
	</ol>

	<table class="" align="center">
		<tr>
			<td class="addPictureTableTD">
				<div>
					<div class="panel panel-warning addPictureDiv">
						<div class="panel-heading">商品イメージ写真</div>
						<div class="panel-body">
							<form action="admin_productImage_add" method="post" enctype="multipart/form-data" class="">
								<table class="addTable" >
									<tbody  align="center">
									<tr>
										<td>写真を選んでください</td>　
									</tr>
									<tr>
										<td><input type="file" name="filePath" id="filePathSingle"></td>
									</tr>
									<tr class="submitTR">
										<td colspan="2" align="center">
											<input type="hidden" name="type" value="type_single">
											<input type="hidden" name="pid" value="${p.id }">
											<input type="submit" value="確定" class="btn btn-success">
										</td>
									</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover  table-condensed">
						<thead>
							<tr class="success">
								<th>ID</th>
								<th>写真サムネイル</th>
								<th>削除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pisSingle }" var="pis">
								<tr>
									<td>${pis.id}</td>
									<td>
										<a title="クリックで原図を見る" href="img/productSingle/${pis.id }.jpg">
											<img  src="img/productSingle/${pis.id }.jpg" height="50px">
										</a>
									</td>
									<td>
										<a deletelink="true" href="admin_productImage_delete?id=${pis.id }"
										class="glyphicon glyphicon-trash"></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
			<td class="addPictureTableTD" >
				<div>
					<div class="panel panel-warning addPictureDiv">
						<div class="panel-heading">商品詳細写真</div>
						<div class="panel-body">
							<form action="admin_productImage_add" method="post" enctype="multipart/form-data" class="">
								<table class="addTable" align="center">
								<tbody align="center">
									<tr>
										<td>写真を選んでください</td>
									</tr>
									<tr>
										<td><input type="file" name="filePath" ></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<input type="hidden" name="type" value="type_detail">
											<input type="hidden" name="pid" value="${p.id }">
											<input type="submit" value="確定" class="btn btn-success">
										</td>
									</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover  table-condensed">
						<thead>
							<tr class="success">
								<td>ID</td>
								<td>写真サムネイル</td>
								<td>削除</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pisDetail }" var="pid">
								<tr>
									<td>${pid.id }</td>
									<td>
										 <a href="img/productDetail/${pid.id }.jpg">
										 	<img title="クリックで原図を見る" alt="" src="img/productDetail/${pid.id }.jpg"
										 	height="50px">
									 	</a>
									</td>
									<td>
										<a deletelink="true" href="admin_productImage_delete?id=${pid.id }"
										class="glyphicon glyphicon-trash"></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>