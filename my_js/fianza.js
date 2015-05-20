



function cargarDti(){


jQuery.ajax({

	type : 'post',
	data : {cargarDtiFianza:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].iddti + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_dti').append(html);

	} else{
		alert('Error en la carga de los DTIs');
	}





});

}


jQuery(document).ready(function(){

	
	jQuery('input[name="dat_fecha_comision"]').datepicker({

changeMonth: true,
 changeYear: true,
 changeDay: false,
 showButtonPanel: true,
 dateFormat: 'mm/yy'	
	});

	jQuery('input[name="tex_monto"]').numeric('.');



	cargarDti();


	jQuery('#form_fianza').submit(function(){

		var salida = true;

	jQuery('select:enabled').each(function(idx){

		if (jQuery(this).val() == '-1'){
			alert('Debe Seleccionar todos los campos');
			jQuery(this).attr('class', 'alerta');
			salida = false;
			return false;
		} else {
			jQuery(this).removeAttr('class');
		}

		
	});
	return salida;

});



});