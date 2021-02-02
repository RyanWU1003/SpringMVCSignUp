<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<c:url value="/css/login.css"/>">
</head>
<body>
Hello world 
<%-- 	<%= SecurityContextHolder.getContext().getAuthentication().getName() %>	<!-- 取得登入的帳號 --> --%>
	<c:url value="/perform_logout" var="logoutUrl" />
	<form method="post" action="${logoutUrl}">
		<input value="Logout" type="submit"> 
		<a href="productPage.jsp">購物</a>
		<a href="select_member">會員專區</a>	<!-- "select_member"    member.jsp-->
		<a href="login.jsp">登入</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
<%-- <div class="container">
<c:url value="perform_login" var="loginUrl" />
<form method="post" action="${loginUrl }">
<!-- <form method="post" action="login"> -->
 <h2>Login</h2>
 			
            <input type="text" name="account"  placeholder="Account" class="account" autocomplete="off" />${errors.account}
            <br>
            <br>
            <input type="password" name="password" placeholder="Password" class="password" />${errors.password}
            <br>
            <br>
            <input type="submit" id="btn-submit" value="submit"/><a href="register.jsp">註冊</a>
            <br>
            <br>
            <a href="forgetpwd.jsp">忘記密碼?</a>
            <span id="warning">${errors.error}<br></span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form> --%>
</div>

</body>
</html>