<?php

/************************************************************************
*									*
*  Archivo : cargar_datos.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para consultar datos para los procesos		*
*	      de MMOV							*
*									*
************************************************************************/

/* FUNCTION CARGAR LOS DATOS DE LOS BANCOS
	RETURN : ARRAY
 */

function cargarBancos(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idbancos, nombre_completo from bancos order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

/* FUNCTION CARGAR LOS DATOS DE LAS CUENTAS
	RETURN : ARRAY
 */

function cargarCuentas(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idcuentas_mmov, nombre from cuentas_mmov order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

/* FUNCTION CARGAR LOS DATOS DE LOS ITEMS
	RETURN : ARRAY
 */


function cargarItems(){


require_once 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idtipos_items, item from tipos_items where estatus='A' order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;

}

/* FUNCTION CARGAR LOS DATOS DE LOS PDVS
	RETURN : ARRAY
 */


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


/* FUNCTION CARGAR LOS DATOS DE LOS DTI
	RETURN : ARRAY
 */


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

/* FUNCTION CARGAR LOS DATOS DE LAS FORMAS DE PAGO
	RETURN : ARRAY
 */

function cargarFormasPago(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idformas_pago, forma_pago as forma from formas_pago where estatus = 'A' order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


/* FUNCTION CARGAR LOS DATOS DE LOS PRODUCTOS
	RETURN : ARRAY
 */


function cargarProductos(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idproductos, nombre from productos order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


/* FUNCTION CARGAR LOS DATOS DE LOS SUPERVISORES
	RETURN : ARRAY
 */


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


/* FUNCTION CARGAR LOS DATOS DE LAS RUTAS
	RETURN : ARRAY
 */


function cargarRutas(){


require 'conexionPostgresql.php';
$psql = new Conexion();



$query = "select idrutas, nombre from rutas
 	order by 2 asc";

$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


/* FUNCTION CARGAR LOS DATOS DE LOS EMPLEADOS
	RETURN : ARRAY
 */


function cargarEmpleados(){


require 'conexionPostgresql.php';
$psql = new Conexion();

//echo $query;

$query = "select a.idempleados || '*' || personas_idpersonas as idempleados, b.nombre || ' ' || b.apellido as nombre from empleados a, personas b where a.personas_idpersonas = b.idpersonas
 	order by 2 asc";



$filas = $psql->consulta($query);
//$filas = 1;
return $filas;


}


/* FUNCTION CARGAR LOS DATOS DE LOS PROCESOS
	RETURN : ARRAY
 */


function cargarProcesos($id = null){

if ($id == null){

	$sql = "select idarchivos, nombre from archivos";
	
} else {

	$sql = "select idarchivos, nombre from archivos where idarchivos = '".$id."'";

}


	require_once "conexionPostgresql.php";
	$psql = new Conexion();
$filas = $psql->consulta($sql);
//$filas = 1;
return $filas;


}



/* AREA DONDE SE SELECCIONA LA FUNCCION QUE SE EJECUTARA SEGUN LA SOLICITUD DEL USUARIO */

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
} else if (isset($_POST['cargarProcesos'])){

	$r = cargarProcesos();

	if (!$r){
	echo "-1";
	} else { echo json_encode($r); }

}



?>