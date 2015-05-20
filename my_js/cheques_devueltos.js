
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


function cargarEdiciones(id){


jQuery.ajax({

type : 'post',
url : '../../php/cheques_devueltos.php',
data : { cargarEdiciones : 1, id : id },
success : function(resp){


//alert(resp);



if (resp == "-1") {

	alert("Error al cargar los datos a editar");

} else {

	var r = JSON.parse(resp, function(k, v){
		
		return (v == null) ? "" : v;
		
	
	});
		
	for (var i=0; i < r.length; i++){

		//alert(r[i].idpago);
		jQuery('input[name="dat_fechaCheque"]').val(r[i].fecha);
		jQuery('#sel_bancoCheque').val(r[i].idbanco);
		jQuery('input[name="num_numCheque"]').val(r[i].num_cheque);
		jQuery('input[name="num_montoCheque"]').val(r[i].monto);
		jQuery('#sel_pdv').val(r[i].idpdv);
		jQuery('#sel_cuentaCheque').val(r[i].idcuenta);

	if (r[i].idbanco_repo == ""){
		//alert('no reposicion');
	} else {

		jQuery('#sel_banco').val(r[i].idbanco_repo);
		jQuery('#sel_forma').val(r[i].idpago);
		jQuery('input[name="num_numChequeRepo').val(r[i].num_cheque_repo);
		jQuery('input[name="num_voucher').val(r[i].referencia);
		jQuery('input[name="num_montoRepo').val(r[i].monto_repo);
		jQuery('input[name="dat_fechaRepo').val(r[i].fecha_repo);
		jQuery('#sel_cuenta').val(r[i].idcuenta_repo);
		jQuery('input[name="che_repo"]').click();
		
	}



	}
	jQuery('input[name="tex_accion"]').val("editar");
	jQuery('#form_cheques_devueltos').attr('action', '../../php/cheques_devueltos.php?id='+id);

}




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

 var fechaAct = fechaActual();

	jQuery('input[name="dat_fechaCheque"]').datepicker({

minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos

}
	);
	jQuery('input[name="dat_fechaRepo"]').datepicker({


minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos


}

);

	jQuery('input[name="num_numCheque"]').numeric(false);
	jQuery('input[name="num_montoCheque"]').numeric('.');
	jQuery('input[name="num_numChequeRepo"]').numeric(false);
	jQuery('input[name="num_voucher"]').numeric(false);
	jQuery('input[name="num_montoRepo"]').numeric('.');
	jQuery('#div_repo input, #div_repo select').attr('disabled', 'disabled');



	jQuery('input[name="che_repo"]').click(function(){
		if (jQuery(this).is(':checked')) {
			jQuery('#div_repo input, #div_repo select').removeAttr('disabled');
		} else {
			
			jQuery('#div_repo input, #div_repo select').attr('disabled', 'disabled');
		}

	});


	jQuery('form[name="form_chequesDevueltos"]').submit(function(){
	//alert('submit');
	var salida = true;
		jQuery('select:enabled').each(function(){

			if (jQuery(this).val() == "-1"){
				alert('Debe seleccionar todos los campos');
				jQuery(this).attr('class', 'alerta');
				salida = false;
				return false;	
			} else {
				jQuery(this).removeAttr('class');	
			}
		});
	return salida;

	});

	
		var get = getGET();

	if (typeof(get['pag']) != "undefined"){

		//alert('editar');
		//alert(get['pag']);
	
		cargarEdiciones(get['pag']);


	} else{
		//alert('no editar');
	}


});

