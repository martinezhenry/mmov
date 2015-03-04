

function cargarEmpleados(){

//alert('cargarEmpleados');

jQuery.ajax({

	type : 'post',
	data : {cargarEmpleados:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idempleados + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_empleado').append(html);

	} else{
		alert('Error en la carga de los empleados');
	}





});


}



jQuery(document).ready(function(){



	cargarEmpleados();

});