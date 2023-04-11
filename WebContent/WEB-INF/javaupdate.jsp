<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jython.Jp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'javaupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page.<br>
    <%
    	Jp judge= new Jp();
    %>
    <%
    String fileName=request.getParameter("upload");
    %>
    <br>
    <%=fileName %>
    <br>
    <%String piccolor=judge.judgegreen(fileName); %>  
    
    
    <%String stu=(String) session.getAttribute("stuid"); %>
	<%=stu %><br>
    
    
    <%
        java.util.Date d = new java.util.Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
   		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://8.210.20.160:3306/java_web","zyc","Abc123456");
   		Statement stat = conn.createStatement();
		String sql = "update Student set Pic='"+piccolor+"', Data= '"+ now +"' where StuNo='"+stu+"' ";
		
    	//ResultSet rs = stat.executeQuery(sql);
		//while(rs.next()){
		//	String subjectid = rs.getString("StuNo");
		//	String subjectname = rs.getString("SubjectName");
		stat.executeUpdate(sql);
	%>
    <%		
		//}
		stat.close();
		conn.close();
	%><br>
  

<jsp:forward page="javaweb.jsp"></jsp:forward>
  </body>
</html>
