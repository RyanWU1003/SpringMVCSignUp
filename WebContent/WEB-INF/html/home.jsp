<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	Hello world 
	<%= SecurityContextHolder.getContext().getAuthentication().getName() %>	<!-- 取得登入的帳號 -->
	<c:url value="/perform_logout" var="logoutUrl" />
	<form method="post" action="${logoutUrl}">
		<input value="Logout" type="submit"> 
		<a href="productPage.jsp">購物</a>
		<a href="select_member">會員專區</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
</body>
</html>