<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="/SpringMVCWebProject/css/javascripts/jquery-3.5.1.min.js" /></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript">
$(function(){
	checknum = function(){
		if($("#account").val().length >= 4){
	$.ajax({
		url:"/register1.jsp",
		type: 'post',
        dataType: 'json',
        success: function(data) {
            var html = "";
            for(var i in data){
                if(data[i].account == $("#account").val()){
					$(".text-box").append("<td>已有此帳號<</td>");
                    }
                /* html += "<tr><td>"+data[i].name+"</td><td>"+data[i].gender+"</td></tr>"; */
            }
           /*  $("table").html(html); */
        }
    });
	}

	}	
});
</script>
</head>
<div class="register">
<form action="register.controller" method="post">
<h1>註冊會員</h1>

<table class="regist_box">
<tr class="text-box">
<td>帳號</td>
<td><input type="text" id="account" name="account" onkeyup="checknum()" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
<tr class="text-box">
<td>密碼</td>
<td><input type="password" id="password" name="password" /></td>
<td>${err.password }${err.passwordformat }</td>
</tr>
<tr class="text-box">
<td>確認密碼</td>
<td><input type="password" id="configpwd" name="configpwd" /></td>
<td>${err.againpwd }${err.checkpwd }</td>
</tr>
<tr class="text-box">
<td>姓名</td>
<td><input type="text" id="username" name="username" /></td>
<td>${err.userName }</td>
</tr>
<tr class="text-box">
<td>信箱</td>
<td><input type="email" id="email" name="email" /></td>
<td>${err.email }</td>
</tr>
<tr class="text-box">
<td>電話</td>
<td><input type="text" id="phone" name="phone" /></td>
<td>${err.phone }</td>
</tr>
<tr class="text-box">
<td>地址</td>
<td><input type="text" id="address" name="address" /></td>
<td>${err.address }</td>
</tr>
<tr class="text-box">
<td>生日</td>
<td><input type="date" id="birthday" name="birthday" /></td>
<td>${err.birthday }</td>
</tr >
<tr class="text-box">
<td>性別</td>
<td><input type="radio" id="gender1" name="gender" value="男"  />
	<label for="gender1">男</label>
	<input type="radio" id="gender2" name="gender" value="女" />
	<label for="gender1">女</label>
	<input type="radio" id="gender3" name="gender" value="秘密"  checked="checked"/>
	<label for="gender1">秘密</label>
</td>
<td>${err.gender }</td>
</tr>
</table>
<div>
    <input type="submit" id="btn-submit" value="送出" />
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body>

</html>