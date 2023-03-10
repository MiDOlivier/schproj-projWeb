<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	//String email = request.getParameter("email");
	//String senhavelha = request.getParameter("oldpass");
	String senhanova = request.getParameter("newpass");
	
	Cookie[] cookies = request.getCookies();
	
	String email = "";
	String senhavelha = "";
	
	for (int i = 0; i < cookies.length; i++) {
        Cookie cookie = null;
		cookie = cookies[i];
		String name = cookie.getName();
		if (name.equals("email")) {
			email = cookie.getValue();
		}
		if (name.equals("pass")) {
	        senhavelha = cookie.getValue();
		}
     }
	
	out.print(email + "<br>");
	out.print(senhavelha + "<br>");
	
	User user = new User(email, senhavelha);
	
	out.print("Instancious<br>");
	
	boolean retorno = user.checkUser();
	
	out.print("retornou<br>");
	
	if (retorno == true) {
		user.fillfromEmailAndPass();
		out.print("Usuario encontrado.<br>");
		int id = user.returnID();
		user.setUserid(id);
		String nick = user.returnNickname();
		out.print(nick+ "<br>");
		user.setUsernickname(nick);
		out.print("Nova senha do commit: " + senhanova + "<br>");
		user.setUserpasswd(senhanova);
		user.save();
		
		Cookie mailCookie = new Cookie("email", email);
		Cookie passCookie = new Cookie("pass", senhanova);
		
		response.addCookie(mailCookie);
		response.addCookie(passCookie);
		
		out.print("Usuario Atualizado;");
	} else {
		out.print("Usuario não Encontrado.");
	}
	
%>