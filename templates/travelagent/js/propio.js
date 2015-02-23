function cargarDTI(idPdv){
  //alert('cambio');


  $.ajax({

  	url : "../php/functions.php",
  	type : "POST",
  	data : {'idPdv': idPdv,
  			 'cargarDTI' : '1'
  		   },
  	success : function(resp){
  	

  	var r = JSON.parse(resp);
  	var html = "<option value='-1'>Seleccione...</option>";
  		
  	for (var i = 0; i < r.length; i++){
  		html += "<option value='" + r[i].idDTI + "'>" + r[i].nombre + "</option>";

  		
  	}

  	
  	$('#sel_dti').html(html);

  	}


  });


}


function cargarPDV(){
 // alert('cambio2');


  $.ajax({

  	url : "../php/functions.php",
  	type : "POST",
  		data : {
  			 'cargarPDV' : '1'
  		   },
  	success : function(resp2){
  	
  	//	alert(resp2);
  	var r = JSON.parse(resp2);
  	var html = "<option value='-1'>Seleccione...</option>";
  		
  	for (var i = 0; i < r.length; i++){
  		html += "<option value='" + r[i].ruta_idruta + "'>" + r[i].nombre + "</option>";

  		
  	}

  	
  	$('#sel_pdv').html(html);

  	}


  });


}



$(document).ready(function(){


	cargarPDV();

});



