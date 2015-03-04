function cargarItems(id){

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

		jQuery('#' + id).append(html);

	} else{
		alert('Error en la carga de los items');
	}





});

}

function agregarItem(){



var fila = jQuery('#tab_gastosCajaChica tbody tr').length;
fila = fila+1;

var fechaAct = fechaActual();

	var html = "";

	html += "<tr id=\"fil_" + fila + "\" >";
	html += "<td> " + fila + " </td>";
	html += "<td> <input type='text' name='dat_fecha[]' value='" + fechaAct + "' /> </td>";
	html += "<td> <input type='text' onblur=\"validarNota(this.value, 'fil_"+fila+"');\" name='tex_num_factura[]' required /> </td>";
	html += "<td> <input type='text' name='tex_concepto[]' required /> </td>";
	html += "<td> <input type='text' name='tex_monto[]' placeholder='0.00' onkeyUp=\"exento('false', 'fil_"+fila+"');\" required /> </td>";
	html += "<td> <input type='checkbox' name='che_exento[]' onclick=\"exento(this.checked, 'fil_"+fila+"'); validarNota('false', 'fil_"+fila+"');\"/> </td>";
	html += "<td> <input readonly value='0.00' type='text' name='tex_exento[]' /> </td>";
	html += "<td> <input readonly value='0.00' type='text' name='tex_base[]' /> </td>";
	html += "<td> <input readonly value='0.00' type='text' name='tex_iva[]' /> </td>";
	html += "<td> <select name='sel_item[]' id=\"sel_item_" + fila + "\"><option value='-1'>Seleccione...</option></select> </td>";
	html += "<td> <p onclick=\"eliminaItem('fil_" + fila + "')\" id='img_eliminar'></p> </td>";
	html += "</tr>";

	

	jQuery('#tab_gastosCajaChica').append(html);
	
	cargarItems("sel_item_" + fila);
	
	jQuery('input[name="tex_monto[]"]').numeric(".");
	jQuery('input[name="tex_num_factura[]"]').numeric(false);
	
	ultimaCajaChica(function(minFecha){

		jQuery('input[name="dat_fecha[]"]').datepicker({
minDate: minFecha , //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos

});

});






}


function ultimaCajaChica(respuesta){

jQuery.ajax({

	type : 'post',
	url : '../../php/reposicion_caja_chica.php',
	data : { ultimaCajaChica : 1 }


}).done(function(resp){
	//alert(resp);
	if( resp == '0' ){ 
		
		respuesta( "" );
		
	} else{

		respuesta( resp );
	};

});


}


function eliminaItem(id){
	//alert(id);
	jQuery('#' + id).remove();


	jQuery('#tab_gastosCajaChica tbody tr').each(function(index){
	var nuevoid = 'fil_' + (index+1);
		jQuery(this).attr('id', nuevoid );
		jQuery('#' + nuevoid + ' td:first').html( (index+1) );

	});
	
}


function validarNota(nota, fila){

//alert(jQuery('#'+fila+' input[name="che_exento"]:checked'));



if (nota == 'false'){ nota =  jQuery('#'+fila+' input[name="tex_num_factura[]"]').val(); }
//alert(nota);
if(jQuery('#'+fila+' input[name="che_exento[]"]').is(':checked')){

var tipo = "Nota_";

} else {

var tipo = "Fact_";

}
//alert(tipo);


if (nota == ""){

return;

}

jQuery.ajax({

	type : 'post',
	url : '../../php/reposicion_caja_chica.php',
	data : { validarNota : 1, nota : tipo+nota }


}).done(function(resp){
	//alert(resp);
	if( resp == '0' ){ 

		alert('Numero de Factura/Nota ya existente. Verifique.');
		jQuery('#'+fila+' input[name="tex_num_factura[]"]').attr("class", "alerta");
		return false;

	} else{

		jQuery('#'+fila+' input[name="tex_num_factura[]"]').removeAttr("class");
		validaNotaNuevas();

	}



});


}


function validaNotaNuevas(){



	jQuery('#tab_gastosCajaChica tbody tr').each(function(idx){

		
		var id_fila = jQuery(this).attr('id');
		//alert(id_fila);
		var valor_fila = jQuery('#'+id_fila+' input[name="tex_num_factura[]"]').val();

		//alert(valor_fila);
		
		jQuery('#tab_gastosCajaChica tbody tr').each(function(idx){
			
			var id = jQuery(this).attr('id');

			if (id != id_fila){
			//alert('no iguales id');
			if((jQuery('#'+id+' input[name="tex_num_factura[]"]').val() == valor_fila) && 
			(jQuery('#'+id+' input[name="che_exento[]"]').is(':checked') == jQuery('#'+id_fila+' input[name="che_exento[]"]').is(':checked'))){

			//alert('valores iguales');
			jQuery('#'+id+' input[name="tex_num_factura[]"]').attr('class','alerta');
			jQuery('#'+id_fila+' input[name="tex_num_factura[]"]').attr('class','alerta');
			
			return false;

			} else {
				jQuery('#'+id_fila+' input[name="tex_num_factura[]"]').removeAttr('class');


			}

			}	
		
		});
		
	

		
	});

		//jQuery('#'+fila+' input[name="tex_num_factura[]"]').removeAttr("mientras");


}



function exento(check, fila){

if (check == 'false'){

	check = jQuery('#'+fila+ ' input[name="che_exento[]"]').is(':checked');
//alert('entra');
}

//alert(check)

var monto = jQuery('#'+fila+ ' input[name="tex_monto[]"]').val();

if (monto == ""){ return; }

	if(check == true){

		//alert('exento');

	
	jQuery('#'+fila+ ' input[name="tex_exento[]"]').val(monto);
		jQuery('#'+fila+ ' input[name="tex_iva[]"]').val('0.00');
		jQuery('#'+fila+ ' input[name="tex_base[]"]').val('0.00');
	
	} else {
		//alert('no exento');

		var iva = calculoIva(jQuery('#'+fila+ ' input[name="tex_monto[]"]').val());

		jQuery('#'+fila+ ' input[name="tex_iva[]"]').val(iva.toFixed(2));
		jQuery('#'+fila+ ' input[name="tex_base[]"]').val((monto-iva).toFixed(2));
		jQuery('#'+fila+ ' input[name="tex_exento[]"]').val('0.00');


	}

}


function calculoIva(monto){

	//var base = monto/0.12;

	var iva = monto*0.12;

	return iva;

}


function validar(){


var fecha = jQuery('input[name="dat_fecha_repo"]').val();
//alert(fecha);


jQuery('select[name="sel_item[]"]').each(function (idx){

	if(jQuery(this).val() == -1){
	
		alert('Debe Seleccionar un item para el gasto.');
		jQuery(this).focus();
		jQuery(this).attr("class","alerta");
		return false;

	} else{
		jQuery(this).removeAttr("class");



	}
	


});


jQuery('form[name="form_cajaChica"] .alerta').each(function(idx){

	alert('Existen campos invalidos. Verifique');
	return false
});


if (fecha == NULL){

alert('Debe seleccionar la fecha');
return false;

} 

return true;

}



jQuery(document).ready(function(){

	jQuery("#img_agregar").click(function(){
		agregarItem();
		


	});
	
	//jQuery( "#dat_fecha_repo" ).datepicker();
	jQuery( "#dat_fecha_repo" ).val(fechaActual());

	jQuery('form[name="form_cajaChica"]').submit(function(){

	alert('submit');
	return validar();
	//return resp;


	});

	

});