

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

			html += '<option value= "' + ar[i].idarchivos + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_proceso').append(html);

	} else{
		alert('Error en la carga de los procesos');
	}





});


}



jQuery(document).ready(function(){



	cargarProcesos();

	jQuery('#sel_proceso').change(function(){

		if (jQuery(this).val() == "-1"){
			jQuery('input[name="userfile"]').attr('disabled', 'disabled');
		} else {
			jQuery('input[name="userfile"]').removeAttr('disabled');

		}

	});



	jQuery('input[name=userfile]').change(function(){

		//alert(jQuery(this).val());
		if (jQuery(this).val() != ""){
			jQuery('input[name="sub_guardar"]').removeAttr('disabled');
		} else {

			jQuery('input[name="sub_guardar"]').attr('disabled', 'disabled');

		}
	});

});