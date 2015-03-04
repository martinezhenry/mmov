

function cargarProcesos(){

//alert('cargarEmpleados');

jQuery.ajax({

	type : 'post',
	data : {cargarProcesos:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idprocesos + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_proceso').append(html);

	} else{
		alert('Error en la carga de los procesos');
	}





});


}



jQuery(document).ready(function(){



	cargarProcesos();

});