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



}


?>