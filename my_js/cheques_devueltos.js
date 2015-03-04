
function cargarBancos(){

//alert('cargarBancos');

jQuery.ajax({

	type : 'post',
	data : {cargarBancos:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idbancos + '">' + ar[i].nombre_completo + '</option>';
		}

		jQuery('#sel_banco').append(html);

		jQuery('#sel_bancoCheque').append(html);

	} else{
		alert('Error en la carga de los bancos');
	}





});

}


function cargarPdvs(){

//alert('cargarPDVs');

jQuery.ajax({

	type : 'post',
	data : {cargarPdvs:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idpdvs + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_pdv').append(html);

	} else{
		alert('Error en la carga de los PDVs');
	}





});

}




function cargarDti(pdvruta){

//alert('cargarPDVs');

var r = pdvruta.split('*');

var ruta=r[1];
var pdv=r[0];
//alert(ruta);
jQuery.ajax({

	type : 'post',
	data : {cargarDti:1, ruta: ruta},
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



function cargarCuentas(){

//alert('cargarCuentas');

jQuery.ajax({

	type : 'post',
	data : {cargarCuentas:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idcuentas_mmov + '">' + ar[i].nombre + '</option>';
		}

		jQuery('#sel_cuenta').append(html);
		jQuery('#sel_cuentaCheque').append(html);

	} else{
		alert('Error en la carga de las cuentas');
	}





});

}


function cargarFormasPago(){

//alert('cargarFormas');

jQuery.ajax({

	type : 'post',
	data : {cargarFormas:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idformas_pago + '">' + ar[i].forma + '</option>';
		}

		jQuery('#sel_forma').append(html);
		
	} else{
		alert('Error en la carga de las formas de pago');
	}





});

}



jQuery(document).ready(function(){

	cargarBancos();
	cargarPdvs();
	cargarCuentas();
	cargarFormasPago();

	jQuery('#sel_forma').change(function(){

	if(jQuery(this).val() == '4'){
		jQuery('input[name="num_numChequeRepo"]').removeAttr('disabled');
	} else {
		jQuery('input[name="num_numChequeRepo"]').attr('disabled', 'disabled');
		jQuery('input[name="num_numChequeRepo"]').val('');

	}

	});



});

