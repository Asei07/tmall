<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>属性管理</title>
	<script>
		$(function(){
			$("#addForm").submit(function(){
				if(!checkEmpty("name","属性名"))
					return false;
				return true;
			});
		});
	</script>
</head>
<body>
	<div class="">
		<ol class="breadcrumb">
			<li><a href="admin_category_list">分類リスト</a></li>
			<li><a href="admin_property_list?cid=${c.id }">${c.name }</a></li>
			<li></li>
		</ol>
		<div class="list">
			<table class="table">
				<thead class="thead">
					<tr>
						<th>ID</th>
						<th>属性名</th>
						<th>編集</th>
						<th>削除</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<c:forEach items="${list}" var="p">
						<tr>
							<td>${p.id }</td>
							<td>${p.name }</td>
							<td>
								<a href="admin_property_edit?id=${p.id }" class="glyphicon glyphicon-edit"></a>
							</td>
							<td>
								<a deletelink="true" href="admin_property_delete?id=${p.id }" class="glyphicon glyphicon-trash"></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pageDiv">
			<%@include file="../include/admin/adminPage.jsp"%>
		</div>
		<!-- original -->
		<div class="panel panel-warning addDiv">
			<div class="panel-heading">属性添加</div>
			<div class="panel-body">
				<form action="admin_property_add" id="addForm" method="post">
							<!-- original -->
					<table class="addTable">
						<tr>
							<td>属性名</td>
							<td><input type="text" name="name" id="name" class="form-control"></td>
						</tr>
						<tr class="">
							<td colspan="2" align="center">
								<input type="hidden" name="cid" value="${c.id }">
								<input type="submit" class="btn btn-success" value="確定">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>