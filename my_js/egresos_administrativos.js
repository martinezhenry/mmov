
var numeroTomado = false;

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

	} else{
		alert('Error en la carga de las cuentas');
	}





});

}


function cargarItems(){

//alert('cargarItems');

jQuery.ajax({

	type : 'post',
	data : {cargarItems:1},
	url  : '../../php/cargarDatos.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

			html += '<option value= "' + ar[i].idtipos_items + '">' + ar[i].item + '</option>';
		}

		jQuery('#sel_item').append(html);

	} else{
		alert('Error en la carga de los items');
	}





});

}


function validarSelect(){
var salida = true;

jQuery("select").each(function(index){


 //alert(jQuery(this).val());

if (jQuery(this).val() == '-1'){

jQuery(this).focus();
jQuery(this).attr('class', 'alerta');
salida = false;

} else {
	jQuery(this).removeAttr('class');
}



});

//alert(salida);
return salida;


}


function tomarTerminalCheque(cuenta){

//alert('tomar');
jQuery('#sel_cuenta').attr('disabled', 'disabled');
jQuery.ajax({


	type : 'post',
	data : { tomarTerminalCheque : 1, cuenta : cuenta },
	url : '../../php/egresos_administrativos.php'


}).done(function(resp){

	//alert(resp);
	if (resp == '-1') {

		alert('No existen chequeras activas.');
		jQuery('input[name="sub_guardar"]').attr('disabled','disabled');
	} else if (resp == '0'){
		alert('No existen numeros terminales para cheque disponible. Sin cheques disponibles.');
		jQuery('input[name="sub_guardar"]').attr('disabled','disabled');
	} else {

		jQuery('input[name="tex_post_num_cheque"]').val(resp);
		jQuery('input[name="tex_pre_num_cheque"]').attr('maxlength', 8-(parseInt(resp.length)));
		numeroTomado = true;
		jQuery('input[name="sub_guardar"]').removeAttr('disabled');

	}

	jQuery('#sel_cuenta').removeAttr('disabled');



});


}


function liberarTerminalCheque(num_terminal, cuenta, respuesta){

//alert('liberar');

jQuery('#sel_cuenta').attr('disabled', 'disabled');

jQuery.ajax({

	async : false,
	type : 'post',
	data : { liberarTerminalCheque : 1, terminal : num_terminal, cuenta : cuenta },
	url : '../../php/egresos_administrativos.php'


}).done(function(resp){

	numeroTomado = false;
	 if (resp == '0'){
		alert('Error al liberar numero de terminal. Contacte al Administrador.');
		//console.log('error al liberar numero');
	}

	jQuery('#sel_cuenta').removeAttr('disabled');
	return respuesta('1');
});


}


function calcularRetencionesIVA(){


var monto_fact = jQuery('input[name="tex_monto"]').val();
var porcentaje_iva = jQuery('input[name="tex_porcentaje_iva"]').val();
var porcentaje_iva_retenido = jQuery('input[name="tex_porcentaje_iva_retencion"]').val();
var monto_exento = jQuery('input[name="tex_compra_exenta"]').val();

if (monto_fact == ""){ monto_fact = 0.00; }

calculoBaseImponible();

var monto_iva = ((monto_fact-monto_exento)/1.12)*(porcentaje_iva/100);



//var base_imponible = (monto_fact-monto_exento) - monto_iva;

var iva_retenido = monto_iva*(porcentaje_iva_retenido/100);


jQuery('input[name="tex_imp_iva"]').val(monto_iva.toFixed(2));
jQuery('input[name="tex_iva_retenido"]').val(iva_retenido.toFixed(2));
//jQuery('input[name="tex_base_imponible"]').val(base_imponible.toFixed(2));

calculoRetencionesISLR();


}

function calculoBaseImponible(){

var monto_fact = jQuery('input[name="tex_monto"]').val();
var porcentaje_iva = jQuery('input[name="tex_porcentaje_iva"]').val();
//var porcentaje_iva_retenido = jQuery('input[name="tex_porcentaje_iva_retencion"]').val();
var monto_exento = jQuery('input[name="tex_compra_exenta"]').val();


if (jQuery('input[name="che_retencion_iva"]').is(':checked')){

var monto_iva = ((monto_fact-monto_exento)/1.12)*(porcentaje_iva/100);
var base_imponible = (monto_fact-monto_exento) - monto_iva;

} else {

//var monto_iva = ((monto_fact-monto_exento)/1.12)*(porcentaje_iva/100);
//alert(monto_fact);
var base_imponible = parseFloat(monto_fact);

}




jQuery('input[name="tex_base_imponible"]').val(base_imponible.toFixed(2));

}


function calculoRetencionesISLR(){


var porcentaje_islr = jQuery('input[name="tex_islr"]').val();
var base_imponible = jQuery('input[name="tex_base_imponible"]').val();
var islr_exento = jQuery('input[name="tex_monto_exento"]').val();


if (porcentaje_islr == "") { porcentaje_islr = 0.00; }
if (islr_exento == "") { islr_exento = 0.00; }

//alert(porcentaje_islr);

calculoBaseImponible();

var islr_retenido = (base_imponible * (porcentaje_islr/100)-islr_exento);



jQuery('input[name="tex_islr_retenido"]').val(islr_retenido.toFixed(2));


}


function reiniciarValores_iva(){

var monto = jQuery('input[name="tex_monto"]').val();

if (monto == ""){ monto = 0.00; } else { parseFloat(monto); }

//monto = monto.toFixed(2);

//jQuery('input[name="tex_monto_cheque"]').val(monto);

//jQuery('input[name="tex_islr"]').val('');
//jQuery('input[name="tex_islr_retenido"]').val('');
//jQuery('input[name="tex_proveedor"]').val('');
//jQuery('input[name="tex_rif_proveedor"]').val('');
jQuery('input[name="tex_imp_iva"]').val('');
//jQuery('input[name="tex_base_imponible"]').val('');
//jQuery('input[name="tex_numero_factura"]').val('');
//jQuery('input[name="tex_numero_control"]').val('');
jQuery('input[name="tex_iva_retenido"]').val('');


calculoMontoCheque();
}


function reiniciarValores_islr(){

var monto = jQuery('input[name="tex_monto"]').val();

if (monto == ""){ monto = 0.00; } else { parseFloat(monto); }

//monto = monto.toFixed(2);

//jQuery('input[name="tex_monto_cheque"]').val(monto);

jQuery('input[name="tex_islr"]').val('');
jQuery('input[name="tex_islr_retenido"]').val('');
//jQuery('input[name="tex_proveedor"]').val('');
//jQuery('input[name="tex_rif_proveedor"]').val('');
//jQuery('input[name="tex_imp_iva"]').val('');
//jQuery('input[name="tex_base_imponible"]').val('');
//jQuery('input[name="tex_numero_factura"]').val('');
//jQuery('input[name="tex_numero_control"]').val('');
//jQuery('input[name="tex_iva_retenido"]').val('');

calculoMontoCheque();

}


function calculoMontoCheque(){


	var monto = jQuery('input[name="tex_monto"]').val();
var islr_retenido = (jQuery('input[name="tex_islr_retenido"]').val() != "") ? parseFloat(jQuery('input[name="tex_islr_retenido"]').val()) : 0.00;
var iva_retenido = (jQuery('input[name="tex_iva_retenido"]').val() != "") ? parseFloat(jQuery('input[name="tex_iva_retenido"]').val()) : 0.00;
	
var reduccion = (islr_retenido) + (iva_retenido);

//alert(reduccion);



if (monto == ""){ monto = 0.00; } else { parseFloat(monto); }



var monto_cheque = monto - reduccion;

//alert(jQuery('input[name="tex_iva_retenido"]').val());

jQuery('input[name="tex_monto_cheque"]').val(monto_cheque.toFixed(2));


}


function cargarEdiciones(id){

jQuery.ajax({


	type : 'post',
	data : { cargarEdiciones : 1, id : id },
	url : '../../php/egresos_administrativos.php'


}).done(function(resp){

	//alert(resp);
	
	var r = JSON.parse(resp);
	
	//jQuery('input[name="sub_guardar"]').attr('type', 'button').attr('onclick', 'alert(\'editar\')');
	jQuery('#form_egresos').attr('action', jQuery('#form_egresos').attr('action')+'?id='+id);

	//alert(r['cuenta']);
	jQuery('#sel_cuenta').val(r['cuenta']).attr('disabled','disabled');
	jQuery('#sel_item').val(r['item']);
	jQuery('input[name="dat_fecha"]').val(r['fecha_egreso']);
	jQuery('input[name="tex_concepto"]').val(r['concepto']);
	jQuery('input[name="tex_pre_num_cheque"]').val((r['num_cheque']).substring(0, r['dig_seguridad'])).attr('maxlength', r['dig_seguridad']);
	jQuery('input[name="tex_post_num_cheque"]').val((r['num_cheque']).substring((parseInt(r['dig_seguridad']))));
	jQuery('input[name="tex_receptor"]').val(r['beneficiario']);
	jQuery('input[name="tex_monto"]').val((r['monto_egreso']));
	jQuery('input[name="tex_emisor"]').val((r['emisor']));

	//alert(r['estatus']);
	if (r['estatus'] == "A"){

		jQuery('input[name="che_anular"]').attr('disabled', 'disabled');
		jQuery('input[name="che_anular"]').attr('checked', 'checked');

	}


//alert((parseInt(r['dig_seguridad']))+1);
	
//	alert(r['che_retenciones']);

	if (r['che_retenciones'] == "1"){

		//alert('cargarRetenciones');

	jQuery('input[name="tex_num_factura"]').val(r['numero_factura']);
	jQuery('input[name="tex_num_control"]').val(r['numero_control']);
	jQuery('input[name="tex_proveedor"]').val(r['proveedor']);
	jQuery('input[name="tex_rif_proveedor"]').val(r['rif_proveedor']);
	jQuery('input[name="tex_islr"]').val(r['porc_islr']);
	jQuery('input[name="tex_fecha_factura"]').val(r['fecha_factura']);
	//jQuery('input[name="che_retencion"]').attr('checked', 'checked');
	jQuery('input[name="che_retencion"]').click();

	} else {

	//	alert('sin retenciones');
		calculoMontoCheque();
	}

	jQuery('input[name="tex_accion"]').val('editar');


});


}






jQuery(document).ready(function(){



	//cargarBancos();
	cargarCuentas();
	cargarItems();

	jQuery('input[name="tex_porcentaje_iva"]').numeric(false);
	jQuery('input[name="tex_compra_exenta"]').numeric(".");

	

	jQuery('#sel_cuenta').data('lastValue', jQuery('#sel_cuenta').val() ).change(function(){

		
			if (numeroTomado) {
			//alert(jQuery(this).data('lastValue'));
			liberarTerminalCheque(jQuery('input[name="tex_post_num_cheque"]').val(), jQuery(this).data('lastValue'),
			function(resp){
			//alert(resp);
			
			jQuery('#sel_cuenta').data('lastValue', jQuery('#sel_cuenta').val() );
			if(jQuery('#sel_cuenta').val() != "-1"){
				tomarTerminalCheque(jQuery('#sel_cuenta').val());
				
			} else {
				jQuery('input[name="tex_post_num_cheque"]').val('');
			}


			});
			} else {

		jQuery(this).data('lastValue', jQuery(this).val() );
				//alert(jQuery(this).data('lastValue'));
			if(jQuery(this).val() != "-1"){
				tomarTerminalCheque(jQuery(this).val());
				
			}
		


		}


			
	
	});


var fechaAct = fechaActual();
	jQuery('input[name="dat_fecha"]').datepicker({

minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos


});


	jQuery('input[name="tex_fecha_factura"]').datepicker({

minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos


});

	jQuery('input[name="tex_pre_num_cheque"]').numeric(false);
	jQuery('input[name="tex_monto"]').numeric('.');
	jQuery('input[name="tex_num_factura"]').numeric(false);
	//jQuery('input[name="tex_num_control"]').numeric(false);


	jQuery('#form_egresos').submit(function(event){
	//alert('sub');
	numeroTomado = false;
	var resp = validarSelect();
	if (resp == true){
	if(jQuery('input[name="dat_fecha"]').val() == "" ){
		alert('Debe ingresar la fecha');
		jQuery('input[name="dat_fecha"]').attr('class', 'alerta');
		return false;

	}

	return;
	} else {
	alert('Debe ingresar todos los campos');
	 event.preventDefault();
	}
	});



	jQuery(window).on('beforeunload', function ()
    {
	//liberarTerminalCheque(jQuery('input[name="tex_post_num_cheque"]').val());
	//alert('salir');
	if (numeroTomado){
        return  'Los datos no guardados se perderan';
	}
    });

	jQuery('input[name="Submit"]').click(function(){
		liberarTerminalCheque(jQuery('input[name="tex_post_num_cheque"]').val(), jQuery('select[name="sel_cuenta"]').val(), function(resp){

	return;

	});

	});

	jQuery(window).on('unload', function ()
    {

	liberarTerminalCheque(jQuery('input[name="tex_post_num_cheque"]').val(), jQuery('select[name="sel_cuenta"]').val(), function(resp){

	return;

	});
        //return '';
    });





	jQuery('#div_iva input').attr('disabled', 'disabled');
	jQuery('#div_islr input').attr('disabled', 'disabled');
	jQuery('input[name="tex_monto_cheque"]').removeAttr('disabled');



	jQuery('input[name="che_retencion_islr"]').click(function(){

		//alert('click');
		if (jQuery(this).is(':checked')) {
		//jQuery('#div_iva input').removeAttr('disabled');
		jQuery('#div_islr input').removeAttr('disabled');
		calculoRetencionesISLR();
		calculoMontoCheque();
		} else {
			//jQuery('#div_iva input').attr('disabled', 'disabled');
			jQuery('#div_islr input').attr('disabled', 'disabled');
			jQuery('input[name="tex_monto_cheque"]').removeAttr('disabled');
			
			reiniciarValores_islr();
			

		}

	});


	
	jQuery('input[name="che_retencion_iva"]').click(function(){

		//alert('click');
		if (jQuery(this).is(':checked')) {
		jQuery('#div_iva input').removeAttr('disabled');
		//jQuery('#div_islr input').removeAttr('disabled');
		calcularRetencionesIVA();
		calculoMontoCheque();
		} else {
			jQuery('#div_iva input').attr('disabled', 'disabled');
			//jQuery('#div_islr input').attr('disabled', 'disabled');
			jQuery('input[name="tex_monto_cheque"]').removeAttr('disabled');
			
			reiniciarValores_iva();
			

		}

	});


	jQuery('input[name="tex_monto"]').keyup(function(){

		if(jQuery('input[name="che_retencion_iva"]').is(':checked')){
			calcularRetencionesIVA();
			calculoMontoCheque();
		} else if(jQuery('input[name="che_retencion_islr"]').is(':checked')){
			calculoRetencionesISLR();
			calculoMontoCheque();
		} else {
			var monto = parseFloat(jQuery(this).val());
			jQuery('input[name="tex_monto_cheque"]').val(monto.toFixed(2));
	
		}
	});


		jQuery('input[name="tex_islr"]').keyup(function(){


		calculoRetencionesISLR();
		calculoMontoCheque();
	});


			jQuery('input[name="tex_monto_exento"]').keyup(function(){


		calculoRetencionesISLR();
		calculoMontoCheque();
	});


	
		jQuery('input[name="tex_porcentaje_iva"]').keyup(function(){

		calcularRetencionesIVA();
		calculoRetencionesISLR();
		calculoMontoCheque();
	});

		jQuery('input[name="tex_compra_exenta"]').keyup(function(){

		calcularRetencionesIVA();
		calculoRetencionesISLR();
		calculoMontoCheque();
	});


	jQuery('input[name="che_anular"]').click(function(){
	
	if (jQuery(this).is(':checked')){
		if (!confirm('Seguro que desea ANULAR el cheque?')){
			jQuery('input[name="che_anular"]').removeAttr('checked');
		}
	}

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