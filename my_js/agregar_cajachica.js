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

var f = new Date();
//var oldscrollHeight = jQuery(".div_table").attr("scrollHeight") - 20; //La altura del scroll 

var mes =  (f.getMonth() +1);

if (mes < 10) {

	mes = '0' + mes;
}

var fechaAct = (f.getFullYear() + "-" + mes + "-" + f.getDate());

var fila = jQuery('#tab_gastosCajaChica tbody tr').length;
fila = fila+1;

	var html = "";

	html += "<tr id=\"fil_" + fila + "\" >";
	html += "<td> " + fila + " </td>";
	html += "<td> <input type='date' name='dat_fecha[]' value='" + fechaAct + "' /> </td>";
	html += "<td> <input type='text' name='tex_num_factura[]' /> </td>";
	html += "<td> <input type='text' name='tex_concepto[]' /> </td>";
	html += "<td> <input type='text' name='tex_monto[]' /> </td>";
	html += "<td> <input type='text' name='tex_exento[]' /> </td>";
	html += "<td> <input type='text' name='tex_base[]' /> </td>";
	html += "<td> <input type='text' name='tex_iva[]' /> </td>";
	html += "<td> <select name='sel_item[]' id=\"sel_item_" + fila + "\"><option value='-1'>Seleccione...</option></select> </td>";
	html += "<td> <p onclick=\"eliminaItem('fil_" + fila + "')\" id='img_eliminar'></p> </td>";
	html += "</tr>";

	

	jQuery('#tab_gastosCajaChica').append(html);

	cargarItems("sel_item_" + fila);
	


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



jQuery(document).ready(function(){

	jQuery("#img_agregar").click(function(){
		agregarItem();



	});

	

});