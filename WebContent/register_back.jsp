<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.javaweb.dao.*"%>
<%@page import="java.util.regex.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	String uname = "", upass = "", unick = "";
	uname = request.getParameter("username");//获取前端注册信息
	upass = request.getParameter("password");
	unick = request.getParameter("nick");
	SetDao gDao = new SetDao();//新建数据库对象
	User ge = new User();
	Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");//判断是否为纯数字
	if (pattern.matcher(uname).matches()) {//将信息插入学生表
		ge.setStuNo(uname);
		ge.setStuPs(upass);
		ge.setStuName(unick);
		gDao.StuRegister(ge);
	} else {//将信息插入教师表
		ge.setTeacherNo(uname);
		ge.setTeacherPs(upass);
		ge.setTeName(unick);
		gDao.TeRegister(ge);
	}
	response.sendRedirect("login.jsp");//跳转至登录界面
	%>
</body>
</html>