<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	 $(function(){
		$("#addForm").submit(function(){
			if(!checkEmpty("name","分類名"))
				return false;
			if(!checkEmpty("categoryPic","分類写真"))
				return false;
			return true;
		});
	});
</script>
</head>

<body>
	<!-- original -->
	<div class="">
	<h1 class="label label-info">分類管理</h1>
	<br>
	<br>
		<!-- original -->
		<div class="">
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<thead>
					<tr class = "success">
						<th>ID</th>
						<th>写真</th>
						<th>分類名</th>
						<th>属性管理</th>
						<th>商品管理</th>
						<th>編集</th>
						<th>削除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cList}" var="c">
						<tr>
							<td>${c.id}</td>
							<td><img alt="unknow" src="img/category/${c.id }.jpg" height="40px">
							<td>${c.name }</td>
							<td><a href="admin_property_list?cid=${c.id }" class="glyphicon glyphicon-th-list"></a></td>
							<td><a href="admin_product_list?cid=${c.id }" class="glyphicon glyphicon-shopping-cart"></a></td>
							<td><a href="admin_category_edit?id=${c.id }" class="glyphicon glyphicon-edit"></a></td>
							<td><a deletelink = "true" href="admin_category_delete?id=${c.id }"	 class="glyphicon glyphicon-trash"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- original -->
		<div class="pageDiv">
			 <%@include file = "../include/admin/adminPage.jsp" %> 
		</div>
	</div>
	<div class="workingArea">
	<div class="panel panel-warning addDiv">
		<div class="panel panel-heading">新規分類</div>
		<div class="panel panel-body">
			<form action="admin_category_add" method="post" id="addForm" enctype="multipart/form-data">
				 <!-- original -->
				<table class="addTable">
					<tr>
						<td>分類名</td>
						<td><input type="text" id="name" name="name" class="form-control"></td>
					</tr>
					<tr>
						<td>分類写真</td>
						<td><input type="file" id="categoryPic" accept="image/*" name="filePath"></td>
					</tr>
					<!-- original -->
					<tr class="">
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-success">確認</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
</body>
</html>