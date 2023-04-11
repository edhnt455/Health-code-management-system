<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javaweb.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resource/layui/css/layui.css">
<title>学生界面</title>
<script src="resource/layui/layui.js" charset="utf-8"></script>
<script src="./js/res_js/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #cccccc;">
	<%
		String stu = (String) session.getAttribute("sname");
	java.util.Date d = new java.util.Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String now = df.format(d);
	SetDao gDao = new SetDao();
	String timeisnow = gDao.matchstu(stu);
	if (timeisnow.equals(now)) {
	%>
	<h1 id="testsub"
		style="position: absolute; font-size: 40px; left: 50%; top: 40%">今日已提交</h1>
	<%
		String a = "";
	} else {
	%>
	<h1 id="testsub"
		style="position: absolute; font-size: 40px; left: 50%; top: 40%">今日未提交</h1>
	<%
		String a = "";
	}
	%>

	<br>
	<form style="position: absolute; left: 41%; top: 72%"
		class="layui-form" action="student_back.jsp">
		<div class="layui-form-item">
			<input style="width: 390px; height: 40px;" type="file" id="upload"
				name="upload" onchange="uploadFile(this)" accept=".jpg, .png, .jpeg">
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button style="height: 50px; width: 180px" class="layui-btn"
					lay-submit lay-filter="formDemo" onclick="get()" value="upload">立即提交</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;

    </script>
</body>
</html>
