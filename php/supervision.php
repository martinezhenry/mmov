<?php


//echo "supervision";

//var_dump ($_POST);




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
		pdvs_has_supervision_pdvs_idpdvs) values 
		('". $datos['productos_'.($i+1)][$x] ."','" . $id . "','" .$datos['sel_pdv'][$i] . "')";

//echo $sql;
	$filas = $psql->insertar($sql);

	if(!$filas){ return false; }


	}


	}




return true;

	


}

if (isset($_POST['sel_supervisor'])){
	$r = guardarDatos($_POST);

	if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

	

}


 ?>