<?php 

//	echo "hola";

//var_dump($_POST);


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

		if($datos['tex_exento'][$i] == '0.00'){
			$num_fact = 'Fact_' . $datos['tex_num_factura'][$i];
		} else {
			$num_fact = 'Nota_' . $datos['tex_num_factura'][$i];

		}

		$sql = "insert into gastos_caja_chica (reposicion_caja_chica_idreposicion_caja_chica, tipos_items_idtipos_items,
			fecha, num_factura, concepto, monto, exento, base, iva) values 
			('" .$id. "', '" .$datos['sel_item'][$i]. "', '" .$datos['dat_fecha'][$i]. "', '" .$num_fact. "',
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
	


	function validarNota($nota){

	$sql = "select idgastos_caja_chica from gastos_caja_chica where num_factura = '".$nota."'";

	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);

	if(!$filas){
		return 1;

	} else {
		return 0;
	}


	}


	function ultimaCajaChica(){
	$sql = "select to_char(fecha,'DD/MM/YYYY') as fecha from reposicion_caja_chica order by idreposicion_caja_chica desc limit 1";


	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);

	if(!$filas){
		return 0;

	} else {
		return $filas[0]['fecha'];
	}


	}



	


	if (isset($_POST['dat_fecha_repo']))
	{
		$result = guardar($_POST);

		if (!$result){
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
		
		} else {
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');

		}
	} else if(isset($_POST['validarNota'])){

		$resp = validarNota($_POST['nota']);

		if($resp){ echo "1"; } else { echo "0"; };
		

	} else if(isset($_POST['ultimaCajaChica'])){

		$resp = ultimaCajaChica();

		if(!$resp){ echo "0"; } else { echo $resp; };
		

	}





?>