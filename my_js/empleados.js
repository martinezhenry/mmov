



jQuery(document).ready(function(){


	var fechaAct = fechaActual();


	jQuery('input[name="tex_fecha_ingreso"]').datepicker({


minDate: '' , //Pone la fecha m�nima como el d�a siguiente
 maxDate: fechaAct, //Pone la fecha m�xima como 10 d�as a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es d�a/mes/a�o (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra funci�n que identifica fines de semana y festivos


});



jQuery('input[name="tex_cedula"], input[name="tex_rif"], input[name="tex_telefono"]').numeric(false);


jQuery('input[name="tex_nombre"]').keypress(function(tecla){


		this.value.replace(/[^0-9]/,'');
	
		
});


jQuery('#form_empleados').submit(function(){


if (jQuery('input[name="tex_fecha_ingreso"]').val() == ""){

	jQuery('input[name="tex_fecha_ingreso"]').attr('class', 'alerta');
	alert('Debe seleccionar una fecha de ingreso');
	return false;

} else {

	jQuery('input[name="tex_fecha_ingreso"]').removeAttr('class');


}


});

});