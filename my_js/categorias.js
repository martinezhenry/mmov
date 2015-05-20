function cargarCategorias(){


jQuery.ajax({

type : 'post',
url : '../../php/items.php',
data : { cargarCategorias : 1 },
success : function(resp){

	//alert(resp);
	if (resp == "-1"){
		var html = "<tr><td colspan='2'>No hay Categorias</td></tr>";	
	} else {
		var r = JSON.parse(resp);
		var html = "";
		for (var i=0; i < r.length; i++){

		if (r[i].estatus == "Activo"){
			var texto_accion = "icon-red";
			var accion = "I";
		} else {
			var texto_accion = "icon-gray";
			var accion = "A";
			}

			html += "<tr id='fil_"+r[i].id+"'>";
			//html += "<td>" + r[i].id + "</td>";
			html += "<td>" + r[i].nombre + "</td>";
			html += "<td>" + r[i].descrip + "</td>";
			html += "<td>" + r[i].estatus + "</td>";
			html += "<td><p id='img_eliminar' onclick=\"eliminarCategoria('" + r[i].id + "')\"></p><p class='icon-power-outline " + texto_accion + "' onclick=\"cambiarEstatus('" + r[i].id + "', '" + accion + "')\"></p></td>";
		}
	jQuery("#tab_categorias tbody").html(html);
	}
}



});



}


function eliminarCategoria(id){


if (confirm('Seguro que desea Eliminar esta categoria?')){


jQuery.ajax({


type : 'post',
url : '../../php/items.php',
data : { eliminarCategoria : 1, id : id },
success : function(resp){

	if (resp == "-1"){
		alert('Error al intentar eliminar categoria');
	} else{
		alert('Categoria Eliminada');
		jQuery('#tab_categorias tbody #fil_'+id).remove();
	}

} 


});

}


}


function cambiarEstatus(id, estatus){

jQuery.ajax({


type : 'post',
url : '../../php/items.php',
data : { cambiarEstatus : 1, id : id, estatus : estatus },
success : function(resp){
//alert(resp);
	if(resp == "-1"){
		alert('Error al intentar cambiar el estatus');
	} else {
		cargarCategorias();
	}


}


});



}


jQuery(document).ready(function(){

	cargarCategorias();


});