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
	String uname = "", upass = "", dpass = "";
	uname = request.getParameter("username");
	upass = request.getParameter("password");//获取登录信息
	Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
	SetDao gDao = new SetDao();
	dpass = gDao.match(uname);
	if (upass.equals(dpass)) {
		if (pattern.matcher(uname).matches()) {//若为学生，跳转至学生界面
			session.setAttribute("sname", uname);
			response.sendRedirect("student.jsp");
		} else {//若为老师，跳转至老师界面
			session.setAttribute("tname", uname);
			response.sendRedirect("teacher.jsp");
		}
	} else {
		response.sendRedirect("404.jsp");
	}
	%>
</body>
</html>