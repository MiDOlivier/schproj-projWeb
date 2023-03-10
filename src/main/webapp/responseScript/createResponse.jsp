<%@page import="multitools.RandomCode"%>
<%@page import="classes.FileManager"%>
<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	String image = request.getParameter("image");
	
	out.print("Colheu.<br>");
	
	FileManager file = new FileManager();
	
	out.print("Instancious<br>");
	
	String filename = file.create(image);
	
	User user = new User(0, nickname, email, "", filename);
	
	RandomCode rand = new RandomCode();
	
	String pass = rand.generate(32);
	
	user.setUserpasswd(pass);
	
	user.save();
	
	user.sendUserMail("miguel_ifsp_testes@yahoo.com", email, "Account Password", "Password: " + pass);
	
	out.print(System.getProperty("user.dir") + "<br>");
	
	out.print("criou<br>");
	
%>