<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style>
	

	
</style>
<meta charset="UTF-8">
<title>属性編集</title>
</head>
<body>
	<div class="workingArea">
	<div>
		<ol class="breadcrumb">
			<li><a href="admin_category_list">分類リスト</a></li>
			<li><a href="admin_property_list?cid=${prop.category.id}">${prop.name }</a></li>
			<li class="active">属性編集</li>
		</ol>
	</div>
	<div class="panel panel-warning editDiv">
		<div class="panel-heading">属性編集</div>
		<div class="panel-body">
			<form action="admin_property_update" method="post">
				<table class="editTable">
					<tr>
						<td>属性名</td>
						<td><input type="text" name="name" value="${prop.name }" class="form-control"></td>
					</tr>
					<tr>
						<td align="center" colspan="2">
						<input type="hidden" name="cid" value="${prop.category.id }">
						<input type="hidden" name="id" value="${prop.id }">
						<input type="submit" value="確定"   class="btn btn-success">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	</div>
</body>
</html>