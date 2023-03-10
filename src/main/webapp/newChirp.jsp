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
			var frmData = $("#newChirpForm").serialize();
			//$("#msg").html("Enviou:" + frmData);
			$.ajax({
				url: "responseScript/chirpResponse.jsp",
				data: frmData,
				type: "POST",
				success: function( data ) {
					$("#msg").html( $("#msg").html()+"<br>Retornou:" + data);
				}
			});
		});
		
		$("#imgPreview").click(function () {
  			$("#inputFile").trigger('click');
  		});
		
		$("#inputFile").change(function (event) {
  	  		var file = event.target.files[0];
  	  		var reader = new FileReader();
  	  		reader.readAsDataURL(file);
  	  		reader.onload = function () {
  	  			var imgBase64 = reader.result;
  	  			console.log(imgBase64);
  	  			$("#imgPreview").attr("src", imgBase64);
  	  			$("#image").val(imgBase64);
  	  			uploadFile();
  	  		};
  	  		reader.onerror = function (error) {
  	  			console.log("Error: ", error);
  	  		};
  	  	});
		
	});
  
  </script>
</head>
<body>
<form id="newChirpForm" action="POST">

    <input type="text" class="form-control" id="chirp" placeholder="Chirp Away..." name="chirp">
    
    <img id="imgPreview" alt="Carregar Imagem" src="">
	<br>
	<input type="hidden" id="image" name="image" value="">

</form>
<input type="file" id="inputFile" name="inputFile" style="display: none;">
<button type="button"  id="send" class="btn btn-primary">Enviar</button>

<div id="msg"></div>
</body>
</html>