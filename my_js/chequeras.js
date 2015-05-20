

function comprobarChequera(estatus, cuenta){
var salida;
	jQuery.ajax({


	type : 'post',
	async : false,
	url : '../../php/chequeras.php',
	data : { comprobarChequera : 1 , estatus : estatus, cuenta : cuenta },
	success : function (resp){
		//alert(resp);
		if (resp == "1"){
			salida = true;
		} else {
				alert('La cuenta seleccionada ya posee una chequera activa. Cambie de estatus para poder ingresar la chequera.');
				jQuery('select[name="sel_estatus"]').attr('class', 'alerta');
		salida = false;
					
		}

	}

});

return salida;

}




function cargarCuentas(){

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
		//jQuery('#sel_cuentaCheque').append(html);

	} else{
		alert('Error en la carga de las cuentas');
	}





});

}



function cargarChequeras(){


jQuery.ajax({

	type : 'post',
	data : {cargarChequeras:1},
	url  : '../../php/chequeras.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp != 1){
		var ar = JSON.parse(resp);
		var html = '';

		for (var i = 0; i < ar.length; i++){

		if (ar[i].estatus == "Activa"){
			var texto_accion = "icon-blue";
			var accion = "T";
		} else if (ar[i].estatus == "Inactiva"){
			var texto_accion = "icon-red";
			var accion = "A";
		}  else {
			var texto_accion = "icon-blue";
			var accion = "T";
			}

			html += '<tr>';
			html += '<td>' + ar[i].cuenta + '</td>';
			html += '<td>' + ar[i].chequera + '</td>';
			html += '<td>' + ar[i].inicial + '</td>';
			html += '<td>' + ar[i].final + '</td>';
			html += '<td>' + ar[i].ultimo + '</td>';
			html += '<td>' + ar[i].seguridad + '</td>';
			html += '<td>' + ar[i].estatus + '</td>';
			html += "<td><p id='img_eliminar' onclick=\"eliminarChequera('" + ar[i].id + "')\"></p><p class='icon-power-outline " + texto_accion + "' onclick=\"cambiarEstatus('" + ar[i].id + "', '" + accion + "')\"></p></td>";

			html += '</tr>';

		}

		jQuery('#tab_chequeras tbody').html(html);
		//jQuery('#sel_cuentaCheque').append(html);

	} else{
		alert('Error en la carga de las chequeras');
	}





});



}


function eliminarChequera(id){

jQuery.ajax({

	type : 'post',
	data : {eliminarChequera:1, id:id},
	url  : '../../php/chequeras.php',
	

}).done(function(resp){


	
		//alert(resp);
		if (resp == 1){
		cargarChequeras();
	} else{
		alert('Error al eliminar Chequera');
	}





});




}

function cambiarEstatus(id, accion){





jQuery.ajax({

	type : 'post',
	data : {cambiarEstatus:1, id:id, accion:accion},
	url  : '../../php/chequeras.php',
	

}).done(function(resp){


	
		alert(resp);
		if (resp == 1){
		cargarChequeras();
	} else{
		alert('Error al cambiar Estatus');
	}





});




}




jQuery(document).ready(function(){


	jQuery('#form_chequera').submit(function(){

	var salida2 = true;


		if (salida2){
			var salida = true;
			jQuery('select:enabled').each(function(idx){

				if (jQuery(this).val() == "-1"){
					alert('Debe Seleccionar todos los campos');
					jQuery(this).attr('class', 'alerta');
					salida = false;
					return false;
				} else {
					jQuery(this).removeAttr('class');
				}
			
			});
			salida2 = salida;

	}

		if (salida2){

			var resp = comprobarChequera(jQuery('select[name="sel_estatus"]').val(), jQuery('select[name="sel_cuenta"]').val());
		
			salida2 = resp;

	}	

	return salida2;
	
	});

	cargarCuentas();

	jQuery('input[name="tex_num_chequera"]').numeric(false);
	jQuery('input[name="tex_secu_inicial"]').numeric(false);
	jQuery('input[name="tex_secu_final"]').numeric(false);

	cargarChequeras();


});