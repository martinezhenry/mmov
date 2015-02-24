



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
salida = false;

}



});

//alert(salida);
return salida;


}




jQuery(document).ready(function(){

	//cargarBancos();
	cargarCuentas();
	cargarItems();

	jQuery('#form_egresos').submit(function(event){
	//alert('sub');
	var resp = validarSelect();
	if (resp == true){
	return;
	} else {
	alert('Debe ingresar todos los campos');
	 event.preventDefault();
	}
	});


	  
       

});