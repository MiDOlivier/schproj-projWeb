<%@page import="classes.FileManager"%>
<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	String email = request.getParameter("email");
	String senha = request.getParameter("pass");
	
	User user = new User(email, senha);
	
	boolean retorno = user.checkUser();
	
	if (retorno == true) {
		
		user.fillfromEmailAndPass();
		
		String picturepath = user.getUserpicture();
		
		FileManager filemanager = new FileManager();
		
		String picture = filemanager.read(picturepath);
		
		//load mail, pass to cookie
		Cookie mailCookie = new Cookie("email", email);
		Cookie passCookie = new Cookie("pass", senha);
		
		response.addCookie(mailCookie);
		response.addCookie(passCookie);
		
		out.print("Usuario encontrado.<br>");
		out.print("<br>ID: " + user.getUserid());
		out.print("<br>Nickname: " + user.getUsernickname());
		out.print("<br>Mail: " + user.getUsermail());
		out.print("<br>Pass: " + user.getUserpasswd());
		out.print("<br>Image:");
		String p1 = "<br><img id=\"imgPreview\" style=\"\" src=\"";
    	String p2 = picture;
    	String p3 = "\">";
    	
    	out.print(p1+p2+p3);
	} else {
		
		Cookie mailCookie = new Cookie("email", "");
		Cookie passCookie = new Cookie("pass", "");
		
		response.addCookie(mailCookie);
		response.addCookie(passCookie);
		
		out.print("Usuario não Encontrado.");
	}
	
%>