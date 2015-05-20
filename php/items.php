<?php
/************************************************************************
*									*
*  Archivo : items.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de categorias MMOV					*
*									*
************************************************************************/


/* FUNCTION PARA ALMACENAMIENTO DE LOS DATOS EN LA BASE DE DATOS
	RETURN : BOOLEAN
 */
function guardar($item, $descrip){

	
	$sql = "insert into tipos_items (item, descripcion, estatus) values ('$item', '$descrip', 'A')";

	require_once "conexionPostgresql.php";

	$psql = new Conexion();
	
	$filas = $psql->insertar($sql);


	return $filas;


}

/* FUNCTION PARA CONSULTAR LAS CATEGORIAS ALMACENADAS
	RETURN : ARRAY
 */

function cargarCategorias($id = null){


	if($id == null){

		$sql = "select idtipos_items as id, item as nombre, descripcion as descrip,
			  CASE WHEN estatus='A' THEN 'Activo' ELSE 'Inactivo' END as estatus from tipos_items";
	} else {

		$sql = "select idtipos_items as id, item as nombre, descripcion as descrip, estatus from tipos_items
			where idtipos_items = '$id'";
	}

	require_once "conexionPostgresql.php";
	
	$psql = new Conexion();
	$filas = $psql->consulta($sql);

	return $filas;



}


/* FUNCTION PARA ELIMINAR UNA CATEGORIA
	RETURN : BOOLEAN
 */

function EliminarCategoria($id){

	$sql = "delete from tipos_items where idtipos_items = '$id'";

	require_once "conexionPostgresql.php";

	$psql = new Conexion();

	$filas = $psql->insertar($sql);

	return $filas;


}


/* FUNCTION PARA CAMBIAR EL ESTATUS DE UNA CATEGORIA
	RETURN : BOOLEAN
 */

function cambiarEstatus($id, $estatus){


	$sql = "update tipos_items set estatus = '$estatus' where idtipos_items = '$id'";

	require_once "conexionPostgresql.php";
	$psql = new Conexion();
	$filas = $psql->insertar($sql);
	return $filas;


}


/* AREA PARA LA SELECCION DE LAS FUNCIONES A EJECUTAR SEGUN LAS SOLICITUDES DEL USUARIO */

if(isset($_POST['tex_categoria'])){



	for ($i=0; $i < count($_POST['tex_categoria']); $i++) {

		if ($_POST['tex_categoria'][$i] != ""){

		$r = guardar($_POST['tex_categoria'][$i], $_POST['tex_descrip'][$i]);
		if (!$r){
			
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');

			exit();
		}

		} 	
	}


		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');


			


} else if (isset($_POST['cargarCategorias'])){


	$r = cargarCategorias();

	if (!$r){

		echo "-1";
	} else {

		echo json_encode($r);
	}


} else if (isset($_POST['eliminarCategoria'])){

	$r = eliminarCategoria($_POST['id'], $_POST['estatus']);

	if (!$r){ echo "-1"; } else { echo "1"; }

} else if (isset($_POST['cambiarEstatus'])){

	$r = cambiarEstatus($_POST['id'], $_POST['estatus']);

	if (!$r){
		echo "-1";
	} else {
		echo "1";
	}


}



?>