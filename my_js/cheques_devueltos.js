
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



jQuery(document).ready(function(){

	cargarBancos();
	cargarPdvs();



});

