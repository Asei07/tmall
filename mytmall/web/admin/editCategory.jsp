<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

</script>
<body>
	<div >
		<ol class="breadcrumb">
			<li><a href="admin_category_list">全部分類</a></li>
			<li>分類編集</li>
		</ol>
	</div>

	<div class="panel panel-warning editDiv">
		<div class="panel-heading">分類編集</div>
		<div class="panel-body">
			<form action="admin_category_update" method="post" id="" class="" enctype="multipart/form-data">
				<table>
					<tr>
						<td>分類名</td>
						<td><input type="text" value="${category.name}" name="name" id="id"></td>
					</tr>
					<tr>
						<td>分類写真</td>
						<td><input type="file" accept="image/*" id="" name="filePath"></td>
					</tr>
					<tr class="">	
					
						<td>
							<input type="hidden" name="id" value="${category.id}">
							<button type="submit" class="btn btn-success">確認</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>