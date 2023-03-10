<%@page import="classes.User"%>
<%@page import="classes.Chirp"%>
<%@page import="multitools.RandomCode"%>
<%@page import="classes.FileManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	String chirp = request.getParameter("chirp");
	String image = request.getParameter("image");
	
	out.print("Colheu.<br>");
	
	//FileManager file = new FileManager();
	
	out.print("Instancious<br>");
	
	//String filename = file.create(image);
	
	//----
	
	Cookie[] cookies = request.getCookies();
	
	String email = "";
	String senha = "";
	
	for (int i = 0; i < cookies.length; i++) {
        Cookie cookie = null;
		cookie = cookies[i];
		String name = cookie.getName();
		if (name.equals("email")) {
			email = cookie.getValue();
		}
		if (name.equals("pass")) {
	        senha = cookie.getValue();
		}
     }
	
	//----
	
	User user = new User(email, senha);
	
	int userID = user.returnID();
	
	Chirp newChirp = new Chirp(userID, chirp);
	
	/*if (!image.equals("") || image != null) {
		newChirp.setChirpimagecontent(filename);
	}*/
	
	newChirp.save();
	
	out.print("criou<br>");
	
%>