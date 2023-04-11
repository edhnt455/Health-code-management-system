<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script src="./js/res_js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
<link rel="stylesheet" href="./adminLogin.css">
</head>
<body>
	<div class="wrap">
		<img src="background.jpg" class="imgStyle">
		<div class="loginForm">
			<form class="layui-form" action="login_back.jsp" method="post">
				<div class="logoHead">
					<h2 style="margin-top: 15px;" align="center">健康码管理系统</h2>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>用户名:</label>
					</div>
					<div class="usernameDiv">
						<i class="layui-icon layui-icon-username adminIcon"></i> <input
							id="loginUsername" class="layui-input adminInput" type="text"
							required lay-verify="required" name="username"
							placeholder="输入用户名">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>密码:</label>
					</div>
					<div class="passwordDiv">
						<i class="layui-icon layui-icon-password adminIcon"></i> <input
							id="loginPassword" class="layui-input adminInput" type="password"
							required lay-verify="required" name="password" placeholder="输入密码">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="submitLabel">
						<label>没有账号？<a href="register.jsp" id="loginRegister">点击注册</a></label>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button style="margin-left: 120px; margin-top: -60px"
								class="layui-btn" lay-submit lay-filter="formDemo">立即登录</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="resource/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'layer' ], function() {
			var layer = layui.layer;
		})
	</script>
</body>
</html>