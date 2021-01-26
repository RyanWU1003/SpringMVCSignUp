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
<div class="container">
<%-- <c:url value="/login" var="loginUrl"/> --%>
<form method="post" action="login">
<%-- <form method="post" action="/${loginUrl}"> --%>
 <h2>Login</h2>
 			
            <input type="text" name="account"  placeholder="Account" class="account" autocomplete="off" />${errors.account}
            </br>
            </br>
            <input type="password" name="password" placeholder="Password" class="password" />${errors.password}
            </br>
            </br>
            <input type="submit" id="btn-submit" value="submit"/><a href="register.jsp">註冊</a>
            </br>
            </br>
            <a href="forgetpwd.jsp">忘記密碼?</a>
            <span id="warning">${errors.error}<br></span>
            <a href="#">登出</a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>

</body>
</html>