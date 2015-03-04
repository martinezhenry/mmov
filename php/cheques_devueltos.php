<?php

		function guardarDatos($datos){


		
		$sql = "select nextval('cheques_devueltos_idcheques_devueltos_seq') as id";

		require "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->consulta($sql);

		$id=$filas[0]['id'];
		
		unset($filas);
		$sql = 'insert into cheques_devueltos (idcheques_devueltos, cuentas_mmov_idcuentas_mmov, pdvs_idpdvs, bancos_idbancos, fecha_devolucion, num_cheque,
			monto)
		values (\'' . $id . '\', \'' .$datos['sel_cuentaCheque']. '\', \'' .$datos['sel_pdv']. '\', \'' .$datos['sel_bancoCheque']. '\',
		 \'' .$datos['dat_fechaCheque']. '\',
			\'' .$datos['num_numCheque']. '\', \'' .$datos['num_montoCheque']. '\')';



		$filas = $psql->insertar($sql);

		if(!$filas){
			return false;
		}

		$num_cheque = $datos['num_numChequeRepo'];

		if($num_cheque == ""){
			$num_cheque = 'null';
		}

		
		$sql = 'insert into reposicion_cheques (formas_pago_idformas_pago, cuentas_mmov_idcuentas_mmov, bancos_idbancos,
			 cheques_devueltos_idcheques_devueltos, fecha_recuperacion, monto, referencia, num_cheque_repo)
		values (\'' .$datos['sel_forma']. '\', \'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_banco']. '\',
		 \'' .$id. '\',
			\'' .$datos['dat_fechaRepo']. '\', \'' .$datos['num_montoRepo']. '\', \'' .$datos['num_voucher']. '\',
		 '.$num_cheque.')';
		
		echo $sql;
		$filas = $psql->insertar($sql);
		unset($sql);

		return $filas;


	}




	
	if ( isset($_POST['dat_fechaCheque']) ) {
	
		$r = guardarDatos($_POST);
		
		if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}


	}




?>