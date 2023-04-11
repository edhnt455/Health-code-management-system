<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="resource/layui/css/layui.css">
    <link rel="stylesheet" href="images/NewFile.css">
    <title>My JSP 'javaweb.jsp' starting page</title>
    <script src="resource/layui/layui.js" charset="utf-8"></script>
    
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    
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
    This is my JSP page. <br>
	<% 
 		String stuid=(String) session.getAttribute("stuid"); 
 		stuid=request.getParameter("stuid");
 		session.setAttribute("stuid",stuid);
 	%> 
 	<%
 		String stu=(String) session.getAttribute("stuid");  
 		String getpiccolor=new String();
 	%> 
	<%=stu %><br> 
    
    
    
    
	<%
		java.util.Date d = new java.util.Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
		String timeisnow=new String();
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://8.210.20.160:3306/java_web","zyc","Abc123456");
   		Statement stat = conn.createStatement();
		String sql = "select StuNo,StuPs,StuName,Pic,Data from Student where StuNo='"+stu+"'";
		ResultSet rs = stat.executeQuery(sql);
		while(rs.next()){
		String stuno = rs.getString("StuNo");
		String stups = rs.getString("StuPs");
		String pic = rs.getString("Pic");
		getpiccolor=pic;
		String data = rs.getString("Data");
		timeisnow=data;
	%>
		<%=stuno %><br>
	 	<%=stups %><br>
	 	<%=getpiccolor %><br>
	 	<%=timeisnow %><br>
	 	<%
	 	}
	 	stat.close();
		conn.close();
	 	%>
	 	
	 	
	 	
	 	

    <br>
    <form method="post" action="javaupdate.jsp">
    	<input type="file" id="upload" name="upload" onchange="uploadFile(this)" accept=".jpg, .png, .jpeg">
    	<input  type="submit" id="submit" name="submit" onclick="get()" value="upload">
    </form>
    
    <br>
    
    <%
    String fileName=request.getParameter("upload");
    %>
    <%=fileName %>
    <br>
    <div id="testsub" style="position:absolute;font-size:40px;left:30%;">今日已提交</div>

<script>
    $('#testsub').addClass("tr");
    
    function get(){		//查看今日提交状态
    	$('#testsub').toggleClass("visible");
    }
    
    
    if (<%=timeisnow%> != <%=now%>){		//判断今天是否提交
    	alert("今天还未提交健康码，请尽快提交！");
    	}
    else{
    	alert("今天的健康码已提交。");
    }
    </script>
   
  </body>
</html>
