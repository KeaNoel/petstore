<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>

<style>
*{
	margin:0;
	padding:0;
	font-family:"微软雅黑";
	font-size:12px;
}
.box{
	width:390px;
	height:320px;
	border:solid 1px #ddd;
	background:#FFF;
	position:absolute;
	left:50%;
	top:42%;
	margin-left:-195px;
	margin-top:-160px;
}
.box h2{
	font-weight:normal;
	color:#666;
	font-size:16px;
	line-height:46px;
	height:46px;
	overflow:hidden;
	text-align:center;
	border-bottom:solid 1px #ddd;
	background:#f7f7f7;
}
.input_box{
	width:350px;
	padding-bottom:15px;
	margin:0 auto;
	overflow:hidden;
}
.input_box input{
	float:left;
	width:348px;
	height:40px;
	font-size:14px;
	border:solid 1px #ddd;
	text-indent:10px;
	outline:none;
	line-height:40px;
}
.input_box button{
	width:350px;
	height:48px;
	background:#3f89ec;
	border:none;
	border-radius:2px;
	outline:none;
	cursor:pointer;
	font-size:16px;
	color:#FFF;
}
#error_box{
	height:40px;
	width:350px;
	margin:0 auto;
	line-height:40px;
	color:#fc4343;
}
</style>
<script>
function fnLogin(){
	var oUname = document.getElementById("uname");
	var oUpass = document.getElementById("upass");
	var oError = document.getElementById("error_box");
	var isNotError = true;
	if(oUname.value.length > 20 || oUname.value.length < 6){
		oError.innerHTML = "用户名长度必须在6~20位之间";
		isNotError = false;
		return;
		
	}else if(oUname.value.charCodeAt(0) >= 48 && oUname.value.charCodeAt(0) <= 57){
		oError.innerHTML = "用户名开头不能为数字";
		isNotError = false;
		return;
	}else{
		for(var i=0; i<oUname.value.length; i++){
			if((oUname.value.charCodeAt(i) > 122 || oUname.value.charCodeAt(i) < 97) && (oUname.value.charCodeAt(i) > 57 || oUname.value.charCodeAt(i) < 48)){
				oError.innerHTML = "用户名只能包含小写字母和数字";
				isNotError = false;
				return;
			}
		}
	}
	if(oUpass.value.length > 20 || oUpass.value.length < 6){
		oError.innerHTML = "密码长度必须在6~20位之间";
		isNotError = false;
		return;
	}
	oError.innerHTML = "登录成功";
}
</script>
</head>
<body>

<div class="box">
	<h2>登录</h2>
    <div id="error_box"></div>
    <div class="input_box">
    	<input type="text" placeholder="请输入账户名" id="uname">
    </div>
    <div class="input_box">
    	<input type="password" placeholder="请输入密码" id="upass">
    </div>
    <div class="input_box">
    	<button onclick="fnLogin()">登录</button>
    </div>
</div>

<script src="http://www.w2bc.com/scripts/2bc/_gg_980_90.js" type="text/javascript"></script></body>
</html>