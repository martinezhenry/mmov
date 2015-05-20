

function agregarItem(){


if (jQuery('#sel_ruta').val() == '-1'){
	alert('Debe Seleccionar la ruta primero');
	jQuery('#sel_ruta').attr('class', 'alerta');
	return false;	
} else {
	jQuery('#sel_ruta').removeAttr('class');	
}

var f = new Date();
//var oldscrollHeight = jQuery(".div_table").attr("scrollHeight") - 20; //La altura del scroll 

var mes =  (f.getMonth() +1);

if (mes < 10) {

	mes = '0' + mes;
}

var fechaAct = (f.getFullYear() + "-" + mes + "-" + f.getDate());

var fila = jQuery('#tab_supervisiones tbody tr').length;
fila = fila+1;

	var html = "";

	html += "<tr id=\"fil_" + fila + "\" >";
	html += "<td> " + fila + " </td>";
	html += "<td> <select id=\"sel_pdv_" +fila+ "\" name=\"sel_pdv[]\"><option value='-1'>Seleccione...</option></select> </td>";
	html += "<td> <input type='text' required name='dat_fecha_ult[]' /> </td>";
	html += "<td> <input type='text' required name='dat_fecha_ult_venta[]' /> </td>";
	html += "<td> <input type='text' name='tex_monto[]' required placeholder='0.00'/> </td>";
	html += "<td> <div style='display: flex; font-size: 10px;' id=\"productos_" + fila + "\"></div> </td>";
	//html += "<td> <select id=\"productos_" + fila + "\" class='SlectBox' multiple='multiple'></select> </td>";
	html += "<td> <p onclick=\"eliminaItem('fil_" + fila + "')\" id='img_eliminar'></p> </td>";
	html += "</tr>";

	

	jQuery('#tab_supervisiones').append(html);

var fechaAct = fechaActual();
	
	jQuery('input[name="dat_fecha_ult[]"]').datepicker({

minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos




});
	jQuery('input[name="dat_fecha_ult_venta[]"]').datepicker({


minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos




});
	jQuery('input[name="tex_monto[]"]').numeric('.');

	jQuery('input[name="sub_guardar"]').removeAttr('disabled');

	cargarProductos("productos_"+fila);

	cargarPdvs(jQuery('#sel_ruta').val(), 'sel_pdv_'+fila);
	


}


function eliminaItem(id){
	//alert(id);
	jQuery('#' + id).remove();


	jQuery('#tab_supervisiones tbody tr').each(function(index){
	var nuevoid = 'fil_' + (index+1);
		jQuery(this).attr('id', nuevoid );
		jQuery('#' + nuevoid + ' td #img_eliminar').attr('onclick', 'eliminaItem(\''+nuevoid+'\');' );

		jQuery('#' + nuevoid + ' td:first').html( (index+1) );

	});

	if (jQuery('#tab_supervisiones tbody tr').length == 0){
		jQuery('input[name="sub_guardar"]').attr('disabled', 'disabled');
	}
}




function cargarProductos(id){



	jQuery.ajax(
		{
			type : 'post',
			url : '../../php/cargarDatos.php',
			data : { cargarProductos : 1 },
			success : function(r){
				
				var html ="";
				var resp = JSON.parse(r);
				var par;
//alert(resp);
				for (var i = 0; i < resp.length; i++){

					//alert('f');
					if(((i+1) % 2) == 0){

						par = "<br>";
					} else {
						par = "";
					}
					html += "<div style='max-height: 45px; min-width: 90px; border-right: 1px solid gray;'>" + resp[i].nombre + "<input type='hidden' value='" + resp[i].idproductos +"' name='" +id+ "_id[]'/> <input class='cero-uno' maxlength='1' name='" +id+ "[]' style='width:25px' type='text' />" + "</div>";
					//html += "<option value='1'>selec</option>";
				}

jQuery('#div_repo input, #div_repo select').attr('disabled', 'disabled');

//alert(html);
				jQuery('#'+id).html(html);
				jQuery('input[name="' +id+ '[]"]').numeric(false);
	 
				jQuery('input[name="' +id+ '[]"]').keyup(function () {
  					this.value = this.value.replace(/[^0-1]/g,''); 
				});

				 
			}


		}

		).done(function(){

			//window.asd = jQuery('.SlectBox').SumoSelect({ csvDispCount: 3 });
		});


}



function cargarSupervisores(){



	jQuery.ajax(
		{
			type : 'post',
			url : '../../php/cargarDatos.php',
			data : { cargarSupervisor : 1 },
			success : function(r){
				
				var html ="";
				var resp = JSON.parse(r);
				var par;

				for (var i = 0; i < resp.length; i++){

					//alert('f');
					if(((i+1) % 2) == 0){

						par = "<br>";
					} else {
						par = "";
					}
					//html += "<div style='max-height: 45px; min-width: 90px; border-right: 1px solid gray;'>" + resp[i].nombre + " <input name='productos[]' type='checkbox' value='" + resp[i].idproductos + "'/>" + "</div>";
					html += "<option value='" + resp[i].supervisor + "'>" + resp[i].nombre + "</option>";
				}
	//alert(html);
				jQuery('#sel_supervisor').append(html);

	 
				 
			}


		}

		);


}


function cargarPdvs(ruta, id){



	jQuery.ajax(
		{
			type : 'post',
			url : '../../php/cargarDatos.php',
			data : { cargarPdvs_ruta : 1, ruta : ruta },
			success : function(r){
				
				var html ="";
				var resp = JSON.parse(r);
				var par;

				for (var i = 0; i < resp.length; i++){

					//alert('f');
					if(((i+1) % 2) == 0){

						par = "<br>";
					} else {
						par = "";
					}
					//html += "<div style='max-height: 45px; min-width: 90px; border-right: 1px solid gray;'>" + resp[i].nombre + " <input name='productos[]' type='checkbox' value='" + resp[i].idproductos + "'/>" + "</div>";
					html += "<option value='" + resp[i].idpdvs + "'>" + resp[i].nombre + "</option>";
				}
	//alert(html);
				jQuery('#'+id).append(html);

	 
				 
			}


		}

		);


}


function cargarRutas(){



	jQuery.ajax(
		{
			type : 'post',
			url : '../../php/cargarDatos.php',
			data : { cargarRutas : 1 },
			success : function(r){
				//alert(r);
				var html ="";
				var resp = JSON.parse(r);
				var par;

				for (var i = 0; i < resp.length; i++){

					//alert('f');
					if(((i+1) % 2) == 0){

						par = "<br>";
					} else {
						par = "";
					}
					//html += "<div style='max-height: 45px; min-width: 90px; border-right: 1px solid gray;'>" + resp[i].nombre + " <input name='productos[]' type='checkbox' value='" + resp[i].idproductos + "'/>" + "</div>";
					html += "<option value='" + resp[i].idrutas + "'>" + resp[i].nombre + "</option>";
				}
	//alert(html);
				jQuery('#sel_ruta').append(html);

	 
				 
			}


		}

		);


}


jQuery(document).ready(function(){


var fechaAct = fechaActual();
	jQuery('input[name="dat_fecha"]').datepicker({


minDate: "", //Pone la fecha mínima como el día siguiente
 maxDate: fechaAct, //Pone la fecha máxima como 10 días a partir de hoy
 dateFormat: "dd/mm/yy", //el formato de fecha es día/mes/año (ej.: 23/10/2012)
 constrainInput: true, //La entrada debe cumplir con el formato
// beforeShowDay: noFinesDeSemanaNiFestivos //nuestra función que identifica fines de semana y festivos


});
	cargarSupervisores();
	cargarRutas();
	

	jQuery("#img_agregar").click(function(){
		
		if (jQuery('#sel_ruta').val() == "-1"){
			alert('Seleccione la ruta.');
			jQuery('#sel_ruta').attr('class', 'alerta');
		} else{
			agregarItem();
			jQuery('#sel_ruta').removeAttr('class');
		}
		

		
		
	

	});


	jQuery('#sel_ruta').change(function(){

		if (jQuery('#tab_supervisiones tbody tr').length > 0){
			if(confirm('Seguro que desea Cambiar de Ruta? Se perderán los datos de la supervisión actualmente cargados')){
				jQuery('#tab_supervisiones tbody').html('');
			}
		}		

	});



	jQuery('#form_supervision').submit(function(){
		
		var salida=true;
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