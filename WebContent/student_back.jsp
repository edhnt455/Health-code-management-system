<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jython.Jp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.nio.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<span style="font-size: 18px;"> </span>
<span style="font-size: 24px;"><meta http-equiv="refresh"
		content="3;URL=student.jsp"> </span>
<span style="font-size: 24px;">
</head>

<body>
	<%
		Jp judge = new Jp();
	String fileName = request.getParameter("upload");
	File file = new File(fileName);
	String piccolor = judge.judgegreen(fileName);
	String stu = (String) session.getAttribute("sname");
	java.util.Date d = new java.util.Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String now = df.format(d);
	try {
		//打开文件
		FileInputStream fin = new FileInputStream(file);
		//建一个缓冲保存数据
		ByteBuffer nbf = ByteBuffer.allocate((int) file.length());
		byte[] array = new byte[1024];
		int offset = 0, length = 0;
		//读存数据
		while ((length = fin.read(array)) > 0) {
			if (length != 1024)
		nbf.put(array, 0, length);
			else
		nbf.put(array);
			offset += length;
		}
		//新建一个数组保存要写的内容
		byte[] content = nbf.array();
		//创建数据库连接
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://8.210.20.160:3306/java_web", "zyc", "Abc123456");
		//保存数据
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sqlstr = "select * from Student where StuNo='" + stu + "'";//根据登录Id插入相应图片数据
		ResultSet rs = stmt.executeQuery(sqlstr);
		if (rs.next()) {
			rs.updateString(4, piccolor);
			rs.updateString(5, now);
			rs.updateBytes(6, content);
			rs.updateRow();
		}
		rs.close();
		//		关闭文件
		fin.close();
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	%>
	<h1>提交成功！！</h1>
</body>
</html>
