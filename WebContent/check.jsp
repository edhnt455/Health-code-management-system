<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resource/layui/css/layui.css">
<script src="resource/layui/layui.js" charset="utf-8"></script>
<meta charset="utf-8">
<title>健康码</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://8.210.20.160:3306/java_web", "zyc", "Abc123456");
		String sql = "select Base from Student where StuName='" + id + "'";
		out.clearBuffer();
		out = pageContext.pushBody();
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			response.setContentType("image/jpeg");
			Blob b = rs.getBlob("Base");
			long size = b.length();
			byte bs[] = b.getBytes(1, (int) size);
			OutputStream outs = response.getOutputStream();
			outs.write(bs);
			outs.flush();
		}
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();

	}
	%>

</body>
</html>