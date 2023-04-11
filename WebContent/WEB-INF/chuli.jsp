<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<%
  String uname="", upass="";
  uname = request.getParameter("uname");
  upass = request.getParameter("upass");
  if(upass.equals("123456")){
	  //application.setAttribute("uname", uname);
	  session.setAttribute("uname", uname);
	  session.setAttribute("upass", upass);
      //response.sendRedirect("chat.jsp");
      request.getRequestDispatcher("chat.jsp").forward(request, response);
  }
  else{
      out.print("对不起 您的密码不正确");
      response.sendRedirect("login.jsp");
  }
%>
</body>
</html>