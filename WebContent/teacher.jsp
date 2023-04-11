<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.javaweb.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jython.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师端</title>
<script src="./js/res_js/jquery-3.4.1.min.js">
	$(document).ready(function() {
		$("tr:gt(0) td:last-child").each(function(i, j) {
			if (String($(this).text()) == "2@qq.com") {
				$(this).parent().css('color', 'red');
			}
		});
	});
</script>
<script src="resource/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body" onload="onload()">
	<%
		String tno = (String) session.getAttribute("tname");
	SetDao gDao = new SetDao();
	String tnam = gDao.tname(tno);
	%>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">教师界面</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><img src="tc.jpg"
					class="layui-nav-img"> <%=tnam%></li>
			</ul>
		</div>
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item"><a href="login.jsp">重新登录</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<table class="layui-table" id="t1">
				<colgroup>
					<col width="150">
					<col width="200">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>学生姓名</th>
						<th>健康状况</th>
						<th>上次提交时间</th>
						<th>学生邮箱</th>
						<th>提醒</th>
					</tr>
				</thead>
				<%
					User ge = new User();
				ArrayList num = gDao.getAllnum();
				String qq = "";
				for (int i = 0; i < num.size(); i++) {//从数据库循环查询学生信息
					ge = (User) num.get(i);
				%>
				<tr>
					<%
						out.println("<td><a href='check.jsp?id=" + ge.getStuName() + "'>" + ge.getStuName() + "</a></td>");//将学生姓名做成跳转查看其健康码
					%>
					<td><%=ge.getPic()%></td>
					<td><%=ge.getData()%></td>
					<%
						qq = ge.getStuNo() + "@qq.com";//组合成qq邮箱地址
					%>
					<td><%=qq%></td>
					<td><a href="mail.jsp?name=<%=qq%>" class="layui-btn">提醒</a></td>
				</tr>
				<%
					}
				%>

			</table>

			<div class="layui-footer">教师界面</div>
		</div>
	</div>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		function onload() {
			var table = document.getElementById("t1")
			var rowObj = null;
			var cellObj = null;
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var time = year + "-" + month + "-" + day;
			// 引用rows 
			for (var i = 1; i < table.rows.length; i++) {
				rowObj = table.rows[i];
				var s = rowObj.cells[1].innerHTML;
				if (s == "red") {//根据健康码状态改变字体颜色
					rowObj.cells[1].style.color = "red";
				} else if (s == "yellow") {
					rowObj.cells[1].style.color = "yellow";
				} else if (s == "green") {
					rowObj.cells[1].style.color = "green";
				} else {
					rowObj.cells[1].style.color = "black";
				}
				var dat = rowObj.cells[2].innerHTML;
				if (dat == time) {
					rowObj.cells[4].style.opacity = "0";//如果已提交就不显示提醒按钮
				}
			}
		}
	</script>
</body>
</html>