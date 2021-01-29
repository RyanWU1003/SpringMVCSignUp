<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員專區</title>
</head>
<body>
<c:url value="select_member" var="memberUrl" />
<form method="post" action="${memberUrl} }">
<c:choose>
<c:when test="${selection == 'all' or empty selection}">
<c:forEach var="member" items="${memberList }">
<table>

<tr>
<th>帳號</th>
<th>${member.account}</th>
</tr>

<tr>
<th>姓名</th>
<th>${member.userName}</th>
</tr>

<tr>
<th>信箱</th>
<th>${member.email}</th>
</tr>

<tr>
<th>電話</th>
<th>${member.phone}</th>
</tr>

<tr>
<th>地址</th>
<th>${member.address}</th>
</tr>

<tr>
<th>生日</th>
<th>${member.birthday}</th><!-- ${member.birthday} -->
</tr>

<tr>
<th>性別</th>
<th>${member.gender}</th>
</tr>
</c:forEach>
</table>
</c:when>
</c:choose>
<a href="changepwd.jsp">更換密碼</a>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>