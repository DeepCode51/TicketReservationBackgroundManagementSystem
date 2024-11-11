<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>机票后台管理</title>

	<link rel="stylesheet" type="text/css" href="css/style.css">

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/vector.js"></script>

</head>

<script>
	function isValid() {
		if (nameform.id.value == "") {
			window.alert("您必须完成帐号的输入!");
			nameform.id.focus();
			return false;
		}

		if (nameform.password.value == "") {
			window.alert("您必须完成密码的输入!");
			nameform.password.focus();
			return false;
		}
	}
</script>

<body>

<div id="container">
	<div id="output">
		<div class="containerT">
			<h1>管理员登录</h1>
			<form action="../login" method=post name="nameform"
				  onSubmit="return isValid(this);">
				<input type="text" placeholder="用户名" name="id" id="id" value="admin">
				<input type="password" placeholder="密码" name="password" id="password">
				<button name=b1 type="submit" id="entry_btn">登录</button>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		Victor("container", "output");   //登录背景函数
		$("#entry_name").focus();
		$(document).keydown(function(event){
			if(event.keyCode==13){
				$("#entry_btn").click();
			}
		});
	});
</script>

</body>
</html>