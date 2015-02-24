<?php 

//	echo "hola";


	function guardar($datos){

	$sql = "SELECT nextval('gastos_caja_chica_idgastos_caja_chica_seq') as id";

	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);


	$id = $filas[0]['id'];
	
	$sql = "insert into reposicion_caja_chica (idreposicion_caja_chica, fecha, estatus) values

		('" .$id. "', '01/01/2015', 'A')";

	

	$result = $psql->insertar($sql);

	if (!$result){

		return false;

	}

	
	unset($filas, $result);
	
	

	$filas = count($datos['dat_fecha']);


	for ($i=0; $i < $filas; $i++){
	
		//$sql = "insertar " . $i . ": dat_fecha = " . $datos['dat_fecha'][$i];

		$sql = "insert into gastos_caja_chica (reposicion_caja_chica_idreposicion_caja_chica, tipos_items_idtipos_items,
			fecha, num_factura, concepto, monto, exento, base, iva) values 
			('" .$id. "', '" .$datos['sel_item'][$i]. "', '" .$datos['dat_fecha'][$i]. "', '" .$datos['tex_num_factura'][$i]. "',
			'" .$datos['tex_concepto'][$i]. "', '" .$datos['tex_monto'][$i]. "', '" .$datos['tex_exento'][$i]. "',
			'" .$datos['tex_base'][$i]. "', '" .$datos['tex_iva'][$i]. "')";

		echo $sql;

		$result = $psql->insertar($sql);

		if(!$result){

			return false;
		}

	}

	return true;
	
	}
	


	if (isset($_POST['dat_fecha_repo']))
	{
		$result = guardar($_POST);

		if (!$result){
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
		
		} else {
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');

		}
	}

?>