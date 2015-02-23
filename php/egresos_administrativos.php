<?php
	function guardarDatos($datos){

	foreach ($datos as $key => $value){

	if ($value == ""){

		return false;
	}


	if ($value == "-1"){

		return false;
	}
	
	}
		

		$sql = 'insert into egresos_administrativos (fecha, monto, emisor, a_nombre, cuentas_mmov_idcuentas_mmov,
		 tipos_items_idtipos_items, concepto, num_cheque)
		values (\'' .$datos['dat_fecha']. '\', \'' .$datos['num_monto']. '\', \'' .$datos['tex_emisor']. '\',
		 \'' .$datos['tex_receptor']. '\',
			\'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_item']. '\',
			 \'' .$datos['tex_concepto']. '\', \'' .$datos['num_cheque']. '\')';

//echo $sql;

		require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->insertar($sql);

		return $filas;


	}



if (isset($_POST['sel_cuenta'])){

	$r = guardarDatos($_POST);
	if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

}





 ?>