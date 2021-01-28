<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="checkpassword.controller" method="post">
<table>
<tr>
<td>舊密碼</td>
<td><input type="text" id="oldpassword" name="oldpassword" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
<td>新密碼</td>
<td><input type="text" id="newpassword" name="newpassword" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
<td>確認密碼</td>
<td><input type="text" id="checkpassword" name="checkpassword" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
</table>

<div>
    <input type="submit" id="send" value="送出" />
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>