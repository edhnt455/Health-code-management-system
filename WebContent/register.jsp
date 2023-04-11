<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<script src="./js/res_js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
<link rel="stylesheet" href="./adminLogin.css">
</head>
<body>
	<div class="wrap">
		<img src="bg2.jpg" class="imgStyle">
		<div class="loginForm">
			<form class="layui-form" action="register_back.jsp" method="post">
				<div class="logoHead">
					<h2 style="margin-top: 15px;" align="center">注册界面</h2>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>用户名:</label>
					</div>
					<div class="usernameDiv">
						<i class="layui-icon layui-icon-login-qq adminIcon"></i> <input
							required id="loginUsername" class="layui-input adminInput"
							type="text" name="username" placeholder="输入用户名">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>密码:</label>
					</div>
					<div class="passwordDiv">
						<i class="layui-icon layui-icon-password adminIcon"></i> <input
							required id="loginPassword" class="layui-input adminInput"
							type="password" name="password" placeholder="输入密码">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>昵称:</label>
					</div>
					<div class="passwordDiv">
						<i class="layui-icon layui-icon-username adminIcon"></i> <input
							required id="nick" class="layui-input adminInput" type="text"
							name="nick" placeholder="输入昵称">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="submitLabel">
						<label>学生请用qq号做用户名</label>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button style="margin-left: 120px; margin-top: -60px"
								class="layui-btn" lay-submit lay-filter="formDemo">立即注册</button>
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