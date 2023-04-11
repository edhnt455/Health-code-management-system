<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.*"%>
<%
	try {
	//获得属性，并生成Session对象 
	Properties props = new Properties();
	Session sendsession;
	Transport transport;
	sendsession = Session.getInstance(props, null);
	//向属性中写入SMTP服务器的地址
	props.put("mail.smtp.host", "smtp.qq.com");//第一个参数不要改动；第二个参数：如果用的是QQ邮箱作为发送邮件的发件人，就不要改动，如果用其他的邮箱如：163邮箱，就改为smtp.163.com!
	//设置SMTP服务器需要权限认证
	props.put("mail.smtp.auth", "true");
	props.setProperty("mail.smtp.starttls.enable", "true");//************这里很重要，如果没有这句，这会引起安全配置问题，无法通过验证 !!!
	//需要时使用SSL登录方式，随着各个Mail服务器对于安全的重视，纷纷采用基于SSL的Mail登录方式进行发送和接收电子邮件。
	//例如GMail等。当使用JavaMail发送电子邮件时，需要根据SSL设定，增加安全验证的功能

	//设置输出调试信息:控制台会显示收件人、发件人等信息，可根据自己的需要设为false
	sendsession.setDebug(true);

	//根据Session生成Message对象
	Message message = new MimeMessage(sendsession);

	//设置发信人地址
	message.setFrom(new InternetAddress("2744023177@qq.com"));//将其中的邮箱地址改为你的邮箱地址

	//设置收信人地址
	message.setRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("name")));
	//request.getParameter("Email"))：接受表单里填写的收件人的地址 

	//设置e-mail标题 
	message.setSubject(new String("健康码催收"));

	//设置e-mail发送时间
	message.setSentDate(new Date());

	//设置e-mail内容
	message.setText(new String("同学，你该交健康码啦"));//两个参数都是设置文本格式，做乱码处理

	//保存对于Email的修改
	message.saveChanges();

	//根据Session生成Transport对象
	transport = sendsession.getTransport("smtp");

	//连接到SMTP服务器
	transport.connect("smtp.qq.com", "2744023177@qq.com", "zkvdwtllzpyhdcih");
	//第一个参数是刚刚在上面修改的参数；第二位参数是自己用户发送邮件的邮箱账号，注意不要有.com等后缀名，第三位参数是邮箱pop3的授权密码，进邮箱里申请以后复制到此处

	//发送e-mail
	transport.sendMessage(message, message.getAllRecipients());
	//关闭Transport连接
	transport.close();
%>

<%
	} catch (MessagingException me) {
out.println(me.toString());
}
%>
发送中。。。。
