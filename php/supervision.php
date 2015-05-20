<?php

/************************************************************************
*									*
*  Archivo : supervision.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de supervision MMOV					*
*									*
************************************************************************/



/* FUNCION QUE SE ENCARGA DE ALMACENAR LOS DATOS EN LA DB PRINCIPAL DEL SISTEMA 

	RETURN : BOOLEAN
*/

function guardarDatos($datos){


	$r = explode('*', $datos['sel_supervisor']);


	$id_empleado = $r[0];
	$id_persona = $r[1];
	$id_supervisor = $r[2];
	//$id = "id";
	require 'conexionPostgresql.php';
	$psql = new Conexion();
	
	$sql = "select nextval('supervision_idsupervision_seq') as id";
	$filas = $psql->consulta($sql);
	
	if(!$filas){ return false; }


	$id = $filas[0]['id'];

	$sql = "insert into supervision (idsupervision, supervisor_empleados_idempleados, supervisor_empleados_personas_idpersonas, supervisor_idsupervisor, rutas_idrutas,
		fecha, ciudad, sector) values 
		('" .$id. "', '" .$id_empleado. "', '" .$id_persona. "', '" .$id_supervisor. "', '" .$datos['sel_ruta']. "', '" .$datos['dat_fecha']. "',
		'" .$datos['tex_ciudad']. "', '" .$datos['tex_sector']. "')";

	$filas = $psql->insertar($sql);

	if(!$filas){ return false; }

	for ($i=0; $i < count($datos['sel_pdv']); $i++){
		

	$sql = "insert into pdvs_has_supervision (pdvs_idpdvs, supervision_idsupervision, fecha_ult_sup, fecha_ult_venta, monto_ult_venta)
		values ('" .$datos['sel_pdv'][$i]. "', '". $id ."', '" . $datos['dat_fecha_ult'][$i] . "', '" . $datos['dat_fecha_ult_venta'][$i] . "',
		 '" . $datos['tex_monto'][$i] . "')";




	$filas = $psql->insertar($sql);

	if(!$filas){ return false; }

	for ($x=0; $x < count($datos['productos_'.($i+1)]); $x++){

		$sql = "insert into disponibilidad_supervision (productos_idproductos, pdvs_has_supervision_supervision_idsupervision,
		pdvs_has_supervision_pdvs_idpdvs, cantidad) values 
		('". $datos['productos_'.($i+1).'_id'][$x] ."','" . $id . "','" .$datos['sel_pdv'][$i] . "', '".$datos['productos_'.($i+1)][$x]."')";

//echo $sql;
	$filas = $psql->insertar($sql);

	if(!$filas){ return false; }


	}


	}




return true;

	


}


/* FUNCION PARA LA CONSULTA DE LOS DATOS ALMACENADOS DE LA SUPERVISION

	RETURN : ARREGLO

 */

function cargarDatosSupervision($id = null){

	if ($id == null){
			$sql = "select a.fecha_ult_sup, a.fecha_ult_venta as fecha_ult_ven, a.monto_ult_venta as monto_ult_ven,
			a.supervision_idsupervision as idsup,
		a.pdvs_idpdvs as idpdv,
		b.nombre as pdv
		from pdvs_has_supervision a, pdvs b where a.pdvs_idpdvs = b.idpdvs";

	} else {

	$sql = "select a.fecha_ult_sup, a.fecha_ult_venta as fecha_ult_ven, a.monto_ult_venta as monto_ult_ven, a.supervision_idsupervision as idsup,
		a.pdvs_idpdvs as idpdv,
		b.nombre as pdv
		from pdvs_has_supervision a, pdvs b where a.supervision_idsupervision = '$id'
		and a.pdvs_idpdvs = b.idpdvs";

	}

	require_once "conexionPostgresql.php";
	$psql = new Conexion();
	$filas = $psql->consulta($sql);
	return $filas;



}


/* FUNCION PARA LA CONSULTA DE LOS DATOS DE LOS PDVS A LOS QUE SE LE REALIZO LA SUPERVISION

	RETURN : ARREGLO

 */

function cargarSupervisiones($id = null){

	if ($id == null){

	$sql = "select a.idsupervision as id, a.fecha, a.ciudad, a.sector, b.nombre as ruta, c.nombre || ' ' || c.apellido as supervisor
	 from supervision a, rutas b, personas c where a.rutas_idrutas = b.idrutas
	 and a.supervisor_empleados_personas_idpersonas = c.idpersonas";

	} else {

		$sql = "select a.idsupervision as id, a.fecha, a.ciudad, a.sector, b.nombre as ruta, c.nombre || ' ' || c.apellido as supervisor
	 from supervision a, rutas b, personas c where a.rutas_idrutas = b.idrutas
	 and a.supervisor_empleados_personas_idpersonas = c.idpersonas and a.idsupervision = '$id'";
	

	}
	
	require_once "conexionPostgresql.php";
	$psql = new Conexion();
	$filas = $psql->consulta($sql);
	return $filas;


}


/* FUNCION PARA LA CONSULTA DE LA DISPONIBILIDAD DE LOS PRODUCTOS DE LA SUPERVISION

	RETURN : ARREGLO

 */
function cargarProductosSupervision($idSup = null, $idPdv = null){

	if ($idSup == null && $idPdv == null){

	$sql = "select a.cantidad, b.nombre as producto from disponibilidad_supervision a
	right join productos b 
	on a.productos_idproductos = b.idproductos";

	} else {

	$sql = "select a.cantidad, b.nombre as producto from disponibilidad_supervision a
	right join productos b 
	on pdvs_has_supervision_pdvs_idpdvs = '$idPdv' and pdvs_has_supervision_supervision_idsupervision = '$idSup'
	and a.productos_idproductos = b.idproductos";
	

	}
	
	require_once "conexionPostgresql.php";
	$psql = new Conexion();
	$filas = $psql->consulta($sql);
	return $filas;


}




/* AREA DONDE SE VERIFICAN LAS SOLICITUDES DEL CLIENTE VIA POST PARA CONOCER LAS FUNCIONES A EJECUTAR  */


if (isset($_POST['tex_accion'])){

	if($_POST['tex_accion'] == "guardar"){
	$r = guardarDatos($_POST);
	} else{
	$r = editarDatos($_POST);

	}

	if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

	

} else if(isset($_POST['cargarDatosSupervision'])){

	$r = cargarDatosSupervision($_POST['id']);

		if (!$r){ echo "-1"; } else {
		echo json_encode($r);
	}

} else if(isset($_POST['cargarSupervisiones'])){

	$r = cargarSupervisiones();

		if (!$r){ echo "-1"; } else {
		echo json_encode($r);
	}

} else if (isset($_POST['cargarProductosSupervision'])){

	$r =  cargarProductosSupervision($_POST['idsup'], $_POST['idpdv']);
		if (!$r){ echo "-1"; } else {
		echo json_encode($r);
	}

}



 ?>