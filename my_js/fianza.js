



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

	cargarDti();

});