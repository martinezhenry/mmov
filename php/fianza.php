<?php 

/************************************************************************
*									*
*  Archivo : fianza.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de fianza MMOV					*
*									*
************************************************************************/

/* FUNCTION PARA ALMACENAR LOS DATOS ENVIADOS DEL FORMULARIO */

function guardarDatos($datos){




	$sql = "select idfianza from fianza where dti_iddti='". $datos['sel_dti'] ."'";

	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

	if(!$filas){ return false; };
	
	$fianza = $filas[0]['idfianza'];

	$sql = "insert into comision_fianza (fianza_idfianza, fecha, comision) values
		('" . $fianza . "', '01/". $datos['dat_fecha_comision'] . "', '". $datos['tex_monto'] ."')";

		$filas = $psql->insertar($sql);

	if(!$filas){ return false; } else { return $filas; }
		


	



}


/* AREA PARA SELECCIONAR LA FUNCION A EJECUTAR SEGUN LA SOLICITUD DEL USUARIO */

if(isset($_POST['sel_dti'])){

	$r = guardarDatos($_POST);

			if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

}




?>