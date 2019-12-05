<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<script>
		$(function(){
			$("input.pvValue").keyup(function(){
				var value = $(this).val();
				var page = "admin_product_updatePropertyValue";
				var pvid = $(this).attr("pvid");
				var parentSpan = $(this).parent("span");
				parentSpan.css("border","1px solid yellow");
				$.post(
						page,
						{"value": value, "pvid" : pvid},
						function(result){
							if(result == "success")
								parentSpan.css("border","1px solid green");
							else
								parentSpan.css("border","1px solid red");
						}
				)
			});
		});
</script>
<title>属性編集</title>
</head>
<body>
	<div class="workingArea">
		<oi class="breadcrumb">
			<li><a href="admin_category_list">分類リスト</a></li>
			<li><a href="admin_product_list?cid=${p.category.id }">${p.category.name }</a></li>
			<li>${p.name }</li>
			<li>商品属性編集</li>
		</oi>
		<div class="editPVDiv" >
			<c:forEach items="${pvs }" var="pv">
				<div class="eachPV">
					<span class="pvName">${pv.property.name }</span>
					<span class="pvValue" ><input type="text"  value="${pv.value }" class="pvValue" pvid="${pv.id }"></span>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>