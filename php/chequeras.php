<?php

/************************************************************************
*									*
*  Archivo : chequeras.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de chequeras MMOV						*
*									*
************************************************************************/


/* FUNCTION PARA ALMACENAR LOS DATOS ENVIADOS POR EL USUARIO
	RETURN : BOOLEAN
 */
function guardarChequera($datos){


	$resp =	comprobarChequera($datos['sel_estatus'], $datos['sel_cuenta']);

	if (!$resp){
		return false;
	}

	$sql = "insert into chequeras (cuentas_mmov_idcuentas_mmov, chequera, inicial, final, ultimo_utilizado, estatus, digitos_seguridad) 
		values ('".$datos['sel_cuenta']."', '".$datos['tex_num_chequera']."', '".$datos['tex_secu_inicial']."', '".$datos['tex_secu_final']."',
		null, '".$datos['sel_estatus']."', '".$datos['tex_seguridad']."')";
	//echo $sql;
	require_once "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->insertar($sql);

		return $filas;



}


/* FUNCTION PARA VERIFICAR LAS CHEQUERAS ACTIVAS EN LA CUENTA
	RETURN : BOOLEAN
 */

function comprobarChequera($estatus, $cuenta){

	if ($estatus == 'A'){
	$sql = "select 1 as r from chequeras where cuentas_mmov_idcuentas_mmov = '".$cuenta."' and estatus = 'A'";

		require_once "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->consulta($sql);

		if (!$filas){
			return true;
		} else {
			return false;
		}
	} else{
		return true;
	}



}



function cargarChequeras($id=null){

if ($id != null){

$sql = "
select a.idchequeras as id, b.nombre, a.chequera, a.inicial, a.final, a.ultimo_utilizado as ultimo, a.digitos_seguridad as seguridad,
case when a.estatus = 'A' then
'Activa'
when a.estatus = 'I' then
'Inactiva'
else
'Terminada'
end as estatus
from chequeras a, cuentas_mmov b
where 
a.cuentas_mmov_idcuentas_mmov = b.idcuentas_mmov and idchequeras = '$id'
order by 2";


} else {

$sql = "
select a.idchequeras as id, b.nombre as cuenta, a.chequera, a.inicial, a.final, a.ultimo_utilizado as ultimo, a.digitos_seguridad as seguridad,
case when a.estatus = 'A' then
'Activa'
when a.estatus = 'I' then
'Inactiva'
else
'Terminada'
end as estatus
from chequeras a, cuentas_mmov b
where 
a.cuentas_mmov_idcuentas_mmov = b.idcuentas_mmov
order by 2";

}


require_once "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->consulta($sql);

		if (!$filas){
			return false;
		} else {
			return $filas;
		}
	


}



function eliminarChequera($id){



$sql = "delete from chequeras where idchequeras = '$id'";


require_once "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->insertar($sql);

		if (!$filas){
			return false;
		} else {
			return true;
		}


}



function cambiarEstatus($id, $accion){

if ($accion == "A"){

$sql = "select cuentas_mmov_idcuentas_mmov from chequeras where idchequeras = '$id'";
require_once "conexionPostgresql.php";
		$psql = new Conexion();

$filas = $psql->consulta($sql);

$cuenta = $filas[0]['cuentas_mmov_idcuentas_mmov'];

$r = comprobarChequera($accion, $cuenta);


if ($r){

$sql = "update chequeras set estatus = '$accion' where idchequeras = '$id' ";


	
		$filas = $psql->insertar($sql);

		if (!$filas){
			return false;
		} else {
			return true;
		}

} else {


	return false;

}

} else {

$sql = "update chequeras set estatus = '$accion' where idchequeras = '$id' ";
require_once "conexionPostgresql.php";
		$psql = new Conexion();

	
		$filas = $psql->insertar($sql);

		if (!$filas){
			return false;
		} else {
			return true;
		}

}

}



	/* AREA PARA LA SELECCION DE LAS FUNCCIONES A EJECUTAR SEGUN LAS SOLICITUDES DEL USUARIO */

if (isset($_POST['tex_num_chequera'])){


	$r = guardarChequera($_POST);
	
	 if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

	

} else if (isset($_POST['comprobarChequera'])){

	$r = comprobarChequera($_POST['estatus'], $_POST['cuenta']);

	if (!$r){
		echo "0";
	} else {
		echo "1";
	}

}  else if (isset($_POST['cargarChequeras'])){

	$r = cargarChequeras();

	if (!$r){
		echo "1";
	} else {
		echo json_encode($r);
	}

}  else if (isset($_POST['eliminarChequera'])){

	$r = eliminarChequera($_POST['id']);

	if ($r){
		echo "1";
	} else {
		echo "0";
	}

}  else if (isset($_POST['cambiarEstatus'])){

	$r = cambiarEstatus($_POST['id'], $_POST['accion']);

	if ($r){
		echo "1";
	} else {
		echo "0";
	}

} 




?>