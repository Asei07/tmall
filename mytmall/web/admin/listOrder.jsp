<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var oid = $(this).attr("oid");
		$("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
	});
});

</script>

<title>オーダー管理</title>

<div class="workingArea">
	<h1 class="label label-info" >オーダー管理</h1>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover1  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>ステータス</th>
					<th>金額</th>
					<th width="100px">商品数量</th>
					<th width="100px">ユーザ名</th>
					<th>作成日時</th>
					<th>支払日時</th>
					<th>配達日時</th>
					<th>受取日時</th>
					<th width="120px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${os}" var="o">
					<tr>
						<td>${o.id}</td>
						<td>${o.statusDesc}</td>
						<td>￥<fmt:formatNumber type="number" value="${o.totalPrice}" minFractionDigits="2"/></td>
						<td align="center">${o.totalNum}</td>
						<td align="center">${o.user.name}</td>
						
						<td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

						<td>
							<button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">詳細を見る</button>
							
							<c:if test="${o.status=='waitDelivery'}">
								<a href="admin_order_delivery?oid=${o.id}">
									<button class="btn btn-primary btn-xs">配達</button>
								</a>							
							</c:if>
						</td>
					</tr>
					<tr class="orderPageOrderItemTR"  oid=${o.id}>
						<td colspan="10" align="center">
							
							<div  class="orderPageOrderItem">
								<table width="800px" align="center" class="orderPageOrderItemTable">
									<c:forEach items="${o.orderItems}" var="oi">
										<tr>
											<td align="left">
												<img width="40px" height="40px" src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
											</td>	
											
											<td>
												<a href="foreproduct?pid=${oi.product.id}">
													<span>${oi.product.name}</span>
												</a>											
											</td>
											<td align="right">
											
												<span class="text-muted">${oi.number}个</span>												
											</td>
											<td align="right">
											
												<span class="text-muted">単価：￥${oi.product.promotePrice}</span>												
											</td>

										</tr>
									</c:forEach>
								
								</table>
							</div>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>
