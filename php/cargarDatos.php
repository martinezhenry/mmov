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

function cargarPdvs($ruta = null){


require 'conexionPostgresql.php';
$psql = new Conexion();

if ($ruta == null){

$query = "select idpdvs, nombre from pdvs order by 2 asc";
} else {
$query = "select idpdvs, nombre from pdvs where rutas_idrutas = '".$ruta."' order by 2 asc";


}

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

function cargarDti($ruta = null){


require 'conexionPostgresql.php';
$psql = new Conexion();

if ($ruta == null){

$query = "select a.iddti, b.nombre || ' ' || b.apellido as nombre from dti a, personas b, fianza c where a.personas_idpersonas = b.idpersonas
	and c.dti_iddti = a.iddti
	 order by 2 asc";


} else {

$query = "select a.iddti, b.nombre || ' ' || b.apellido as nombre from dti a, personas b, rutas c where personas_idpersonas = idpersonas 
	and c.idrutas= '$ruta'
	and a.personas_idpersonas = c.dti_personas_idpersonas
	and a.iddti = c.dti_iddti  order by 2 asc";
}

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}


function cargarFormasPago(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idformas_pago, forma_pago as forma from formas_pago where estatus = 'A' order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


function cargarProductos(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idproductos, nombre from productos order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


function cargarSupervisor(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select a.empleados_idempleados || '*' || a.empleados_personas_idpersonas || '*' || a.idsupervisor as supervisor,
	 b.nombre from supervisor a, personas b
	where
 	a.empleados_personas_idpersonas = b.idpersonas
 	order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


function cargarRutas(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idrutas, nombre from rutas
 	order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}



function cargarEmpleados(){


require 'conexionPostgresql.php';
$psql = new Conexion();

echo $query;

$query = "select a.idempleados || '*' || personas_idpersonas as idempleados, b.nombre || ' ' || b.apellido as nombre from empleados a, personas b where a.personas_idpersonas = b.idpersonas
 	order by 2 asc";



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



} else if (isset($_POST['cargarFormas'])){


	$bancos = cargarFormasPago();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarProductos'])){


	$bancos = cargarProductos();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarSupervisor'])){


	$bancos = cargarsupervisor();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}



} else if (isset($_POST['cargarRutas'])){


	$bancos = cargarRutas();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}


} else if (isset($_POST['cargarPdvs_ruta'])){


	$bancos = cargarPdvs($_POST['ruta']);

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}
} else if (isset($_POST['cargarDtiFianza'])){


	$bancos = cargarDti();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}
}  else if (isset($_POST['cargarEmpleados'])){


	$bancos = cargarEmpleados();

	if (is_array($bancos)){
		echo json_encode($bancos);
	} else {

		echo "1";

	}
}



?>