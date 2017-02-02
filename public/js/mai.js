
$(document).ready(function(){
	$("#ingresa").click(function(){
		var a = $("#usuario").val();
		var b = $("#contraseña").val();
		 if ((a  == "") || (b == ""))		 {
		 	alert("Debes llenar todos los campos");

		 }
		 
	});
});



$(document).ready(function(){
	$("#registro").click(function(){
		var a = $("#nombre").val();
		var b = $("#correo").val();
		var c = $("#usuario").val();
		var d = $("#contraseña").val();
		 if ((a  == "") || (b == "") || (c  == "") || (d   == "") )		 {
		 	alert("Debes llenar todos los campos");
		 	

		 }
		 
	});
});

$(document).ready(function(){
	$("#nuevatarea").click(function(){
		var a = $("#tarea").val();
		
		 if (a  == "") 	 {
		 	alert("Debes llenar todos los campos");
		 	
		 }
		 
	});
});

$(document).ready(function(){
	$("#eliminartarea").click(function(){
		var a = $("#eliminar").val();
		
		 if (a  == "") 	 {
		 	alert("Debes llenar todos los campos");
		 	
		 }
		 
	});
});

$(document).ready(function(){
	$("#actualizartarea").click(function(){
		var a = $("#actualizar").val();
		
		 if (a  == "") 	 {
		 	alert("Debes llenar todos los campos");
		 	
		 }
		 
	});
});
