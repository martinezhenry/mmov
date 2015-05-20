<?php

/************************************************************************
*									*
*  Archivo : empleados.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de los empleados MMOV					*
*									*
************************************************************************/


/* FUNCTION PARA ALMACENAR LOS DATOS DE LOS EMPLEADOS */

function guardar($datos){

	$sql = "select nextval('personas_idpersonas_seq') as id";
	
	require_once "conexionPostgresql.php";
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);

	if (!$filas) { return false; }	

	$id = $filas[0]['id'];
	

	$sql = "insert into personas (idpersonas, nombre, apellido, cedula, rif, sexo, nacionalidad, direccion, telefono) values
		('".$id."', '".$datos['tex_nombre']."', '".$datos['tex_apellido']."', '".$datos['tex_cedula']."', '".$datos['tex_rif']."',
		'".$datos['tex_sexo']."', '".$datos['tex_nacionalidad']."', '".$datos['tex_direccion']."', '".$datos['tex_telefono']."')";

	
	$filas = $psql->insertar($sql);
	
	if (!$filas) { return false; }
	
	$sql = "insert into empleados (personas_idpersonas, cargo, fecha_ingreso, salario_mensual) values
		('".$id."', '".$datos['tex_cargo']."', '".$datos['tex_fecha_ingreso']."', '".$datos['tex_sueldo']."')";

	//require_once "conexionPostgresql.php";
	//$psql = new Conexion();
	
	$filas = $psql->insertar($sql);
	return $filas;



}


/* AREA DONDE SE SELECCIONAN LAS FUNCIONES A EJECUTAR SEGUN LAS SOLICITUDES DEL USUARIO */

if(isset($_POST['tex_accion'])){


	if ($_POST['tex_accion'] == "guardar"){

		$r = guardar($_POST);
			
		if ($r){
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
		} else {

			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
		}


	}


}


?>