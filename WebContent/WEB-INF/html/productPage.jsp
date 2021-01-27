<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
</head>
	<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<script src="${path }/css/javascripts/jquery-3.5.1.min.js"/></script>
    <link rel="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="${path }/css/productPage.js">

</script>
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
 
	<h3>所有產品</h3>
	<div class="table">
		<div class="search-container">
			 <form method="get" action="getAllProduct">
				<button id="selectAllproduct">檢視全部</button>
			</form> 
			<br>

<!-- 物種搜尋選單 -->
			<div><strong>寵物分類</strong></div>
			<form action="selectSpecies" method="post">
				<div class="search-con species">
					<select name="species">
						<option selected>請選擇</option>
						<option value="dog">狗</option>
						<option value="cat">貓</option>
					</select>
					<button id="button7" type="submit">
						送出
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<br>


<!-- 產品種類搜尋選單 -->
			<div><strong>產品分類</strong></div>
			<form action="selectClass" method="post">
				<div class="search-con ctg">
					<select name="classification">
						<option selected>請選擇</option>
						<option value="飼料">飼料</option>
						<option value="a">罐頭</option>
						<option value="b">玩具</option>
					</select>
					<button id="button7" type="submit">
						送出
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<br>

<!-- 品牌搜尋選單 -->
			<div><strong>品牌分類</strong></div>
			<form action="selectBrand" method="post">
				<div class="search-con brand">
					<select name="brand">
						<option selected>請選擇</option>
						<option value="ROYAL法國皇家">ROYAL 法國皇家</option>
						<option value="BLACKWOOD柏萊富">BLACKWOOD 柏萊富</option>
					</select>
					<button id="button7" type="submit">
						送出
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<br>

<!-- 價格查詢 -->
			<div><strong>價格查詢</strong></div>
			<form action="selectPrice" method="post">
				<div class="search-con price">
					<label for="min">最低價格:</label><input type="text" name="min"
						id="min" class="searchbox" value="1000"> <label for="max">最高價格:</label><input
						type="text" name="max" id="max" class="searchbox" value="2000">
					<button id="button5" type="submit">
						送出
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>

<%-- 全部產品TABLE --%>
		<c:choose>
			<c:when test="${selection == 'all' or empty selection}">
				<p class="count">共 ${count}筆資料</p>
				<div class="inside">
					<table>
						<thead>
							<tr>
								
								<th>產品名稱</th>
								<th>價格</th>
								<th>品牌</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="product" items="${productList }">
								<tr>
									<td class="name">${product.productName }</td>
									<td class="price">${product.price }</td>
									<td class="brand">${product.brand }</td>
									<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
									<td><button><a href="getProductDetail?id=${product.productID}">Detail</a></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
<%--  產品種類TABLE--%> 
			<c:when test="${selection == 'selectClass' }">
				<p class="count">共 ${count}筆資料</p>
				<div class="inside">
					<table>
						<thead>
							<tr>
								
								<th>產品名稱</th>
								<th>價格</th>
								<th>品牌</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="product" items="${productList }">
								<tr>
									<td class="name">${product.productName }</td>
									<td class="price">${product.price }</td>
									<td class="brand">${product.brand }</td>
									<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
									<td><button><a href="getProductDetail?id=${product.productID}">Detail</a></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			
<%-- 品牌TABLE--%>
			<c:when test="${selection == 'selectBrand' }">
				<p class="count">共 ${count}筆資料</p>
				<div class="inside">
					<table>
						<thead>
							<tr>
								
								<th>產品名稱</th>
								<th>價格</th>
								<th>品牌</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="product" items="${productList }">
								<tr>
									<td class="name">${product.productName }</td>
									<td class="price">${product.price }</td>
									<td class="brand">${product.brand }</td>
									<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
									<td><button><a href="getProductDetail?id=${product.productID}">Detail</a></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			
<%-- 物種TABLE--%>		
						<c:when test="${selection == 'selectSpecies' }">
				<p class="count">共 ${count}筆資料</p>
				<div class="inside">
					<table>
						<thead>
							<tr>
								
								<th>產品名稱</th>
								<th>價格</th>
								<th>品牌</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="product" items="${productList }">
								<tr>
									<td class="name">${product.productName }</td>
									<td class="price">${product.price }</td>
									<td class="brand">${product.brand }</td>
									<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
									<td><button><a href="getProductDetail?id=${product.productID}">Detail</a></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>

<%--價格查詢--%>
			<c:when test="${selection == 'limitPrice'}">
				<p class="count">共 ${count}筆資料</p>
				<div class="inside">
					<table>
						<thead>
							<tr>
								
								<th>產品名稱</th>
								<th>價格</th>
								<th>品牌</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="product" items="${productList }">
								<tr>
									<td class="name">${product.productName }</td>
									<td class="price">${product.price }</td>
									<td class="brand">${product.brand }</td>
									<td><button class="add2Cart" type="button" id="${ product.productID}">Add to Cart</button></td>
									<td><button><a href="getProductDetail?id=${product.productID}">Detail</a></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
		</c:choose>
	</div>
 <%@ include file="footer.jsp" %>
</body>
</html>