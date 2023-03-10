<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  
  $(document).ready(function() {
		$("#send").click(function() {
			var frmData = $("#loginForm").serialize();
			$("#msg").html("Enviou:" + frmData);
			$.ajax({
				url: "responseScript/updateResponse.jsp",
				data: frmData,
				type: "POST",
				success: function( data ) {
					$("#msg").html( $("#msg").html()+"<br>Retornou:" + data);
				}
			});
		});
	});
  
  </script>
</head>
<body>
Testador de Atualização de Conta

<form id="loginForm" action="POST">

	<input type="email" class="form-control" id="email" placeholder="Email..." name="email">
    <input type="password" class="form-control" id="oldpass" placeholder="Senha..." name="oldpass">
    <input type="password" class="form-control" id="newpass" placeholder="Nova Senha..." name="newpass">

</form>

<button type="button"  id="send" class="btn btn-primary">Enviar</button>

<div id="msg"></div>

</body>
</html>