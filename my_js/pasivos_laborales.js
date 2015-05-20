

function cargarEmpleados(){

//alert('cargarEmpleados');

jQuery.ajax({

	type : 'post',
	data : {cargarEmpleados:1},
	url  : '../../php/cargarDatos.php'
	

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




function cargarPasivos(){

	jQuery.ajax({

	type : 'post',
	url : '../../php/pasivos_laborales.php',
	data : { cargarPasivos : 1 },
	success : function(resp){

		
		alert(resp);
		if (resp == "-1"){
			var html = "<tr><td colspan='8'>No existen datos</td></tr>";
		} else {
		
		var r = JSON.parse(resp, function(k,v){

			return (v == null) ? "":v;
		});

		var html = "";
		for (var i=0; i < r.length; i++){
			html += "<tr>";
		
			html += "<td>" + r[i].empleado + "</td>";
			html += "<td>" + r[i].mes + "</td>";
			html += "<td>" + r[i].salario + "</td>";
			html += "<td>" + r[i].comision + "</td>";
			html += "<td>" + r[i].utilidades + "</td>";
			html += "<td>" + r[i].bono + "</td>";
			html += "<td>" + r[i].dias + "</td>";
			html += "<td><a href='#'><img src='../../images/my_img/file_edit.png' width='13px' height='13px' /></a></td>";
			html += "</tr>";

		}
		
	
	}

	jQuery('#tab_pasivos tbody').html(html);


	}


});

}




jQuery(document).ready(function(){

	jQuery('input[name="dat_mes"]').datepicker({

changeMonth: true,
 changeYear: true,
 changeDay: false,
 showButtonPanel: true,
 dateFormat: 'mm/yy'	
	});

		jQuery('input[name="tex_sueldo"]').numeric('.');

jQuery('input[name="tex_comision"]').numeric('.');
jQuery('input[name="tex_vacacional"]').numeric('.');
jQuery('input[name="tex_utilidades"]').numeric('.');
jQuery('input[name="tex_dias"]').numeric(false);


	cargarEmpleados();


	jQuery('#form_pasivos').submit(function(){

	var salida = true;

		jQuery('select:enabled').each(function(idx){
		//alert(jQuery(this).val())
			if (jQuery(this).val() == '-1'){
				alert('Debe Seleccionar todos los campos');
				jQuery(this).attr('class', 'alerta');
				salida = false;
				return false;
			} else {
				jQuery(this).removeAttr('class');

			}
		});

		if (jQuery('input[name="dat_mes"]').val() == ""){
			alert('Debe Seleccionar el mes a cargar');
			jQuery('input[name="dat_mes').attr('class', 'alerta');
			salida = false;
		} else {
			jQuery('input[name="dat_mes').removeAttr('class');

		}

		return salida;
	});




});