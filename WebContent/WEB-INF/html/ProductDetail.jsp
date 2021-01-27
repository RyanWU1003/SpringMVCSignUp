<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.productName}</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path }/css/javascripts/jquery-3.5.1.min.js"/></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${path }/css/productDetail.js"></script>
	<style type="text/css">
	.page-wrapper{
		min-height: 100%;
	}
	</style>
</head>
<body>
<%@ include file="navbar.jsp" %>

 <div class="mycart">
 <table >
 	<thead>
 	<tr>
 		<th>name</th>
 		<th>quantity</th>
 		<th>price</th>
 		<th>total</th>
 		<th>action</th>
 	</tr>
 	</thead>
 	<tbody id="cartTable">
	 	<c:if test="${empty cart}" />
	 		<tr>
	 		<td>購物車是空的</td>
	 		</tr>
	 	
 	</tbody>
 </table>
 </div>
 
 <div class="page-wrapper">
<form action="goToCart" method="post">
<table>
	    <tr>
			<td>${product.productName}</td>
			<td>${product.price}</td>
			<td>${product.brand }/${product.classification }/${product.species }</td>
			<td>${product.descripton }</td>
			<td class="stock" name="${product.stock }">${product.stock }</td>
			<td>
				<button type="button" id="qtyMinus">-</button>
				<input type="text" min="1" class="pqty" name="quantity"/>
				<input type="hidden" name="id" value="${product.productID}">
				<button type="button" id="qtyAdd">+</button>
			</td>
			<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
			<td><button type="submit">直接結帳</button></td>
		</tr>

</table>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>