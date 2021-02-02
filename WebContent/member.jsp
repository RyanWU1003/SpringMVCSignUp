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
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<c:url value="updatePage" var="memberUrl" />
<form method="get" action="${memberUrl} }"></form>

<%-- <c:url value="update_member" var="memberUrl" />
<form method="post" action="${memberUrl} }"></form> --%>

<c:choose>
<c:when test="${selection == 'all' or empty selection}">
<c:forEach var="member" items="${memberList }">
<table>會員資料
<a href="updatePage">修改</a>
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



<c:when test="${selection == 'update' or empty selection}">
<c:forEach var="member" items="${memberList }">
<c:url value="update_member" var="memberUrl" />
<form method="post" action="${memberUrl} ">
<table>修改會員資料

<tr>
<th>姓名</th>
<th><input type="text" name="username" id="username" value="${member.userName}"></th>
</tr>

<tr>
<th>信箱</th>
<th><input type="text" name="email" id="email" value="${member.email}"></th>
</tr>

<tr>
<th>電話</th>
<th><input type="text" name="phone" id="phone" value="${member.phone}"></th>
</tr>

<tr>
<th>地址</th>
<th><input type="text" name="address" id="address" value="${member.address}"></th>
</tr>

<tr>
<th>生日</th>
<th><input type="text" name="birthday" id="birthday" value="${member.birthday}"></th><!-- ${member.birthday} -->
</tr>

<tr>
<th>性別</th>
<th><input type="text" name="gender" id="gender" value="${member.gender}"></th>
</tr>
</table>
<div>
    <input type="submit" id="send" value="送出" />
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</c:forEach>
</c:when>
</c:choose>
<a href="select_member">會員資料</a>
<!-- <a href="update_member">會員資料修改</a> -->
<a href="changepwd.jsp">更換密碼</a>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</body>
</html>