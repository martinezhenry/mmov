<?php


function cargarBancos(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idbancos, nombre_completo from bancos order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}


function cargarCuentas(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idcuentas_mmov, nombre from cuentas_mmov order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}


function cargarItems(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idtipos_items, item from tipos_items order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

function cargarPdvs(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idpdvs || '*' || rutas_idrutas as idpdvs, nombre from pdvs order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

function cargarDti($ruta){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select a.iddti, b.nombre || ' ' || b.apellido as nombre from dti a, personas b, rutas c where personas_idpersonas = idpersonas 
	and c.idrutas= '$ruta'
	and a.personas_idpersonas = c.dti_personas_idpersonas
	and a.iddti = c.dti_iddti  order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}


if (isset($_POST['cargarBancos'])){


	$bancos = cargarBancos();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarCuentas'])){


	$bancos = cargarCuentas();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarItems'])){


	$bancos = cargarItems();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarPdvs'])){


	$bancos = cargarPdvs();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarDti'])){


	$bancos = cargarDti($_POST['ruta']);

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



}



?>