<?php

/************************************************************************
*									*
*  Archivo : cheques_devueltos.php					*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de cheques devueltos MMOV					*
*									*
************************************************************************/
// SE CARGA EL ARCHIVO PARA COMPROVAR LA CONEXION

require_once ('comprobarSession.php');

/* FUNCTION PARA ALMACENAR LOS DATOS ENVIADOS POR EL USUARIO
	RETURN : BOOLEAN
 */


		function guardarDatos($datos){
		global $idUsuario;

		
		$sql = "select nextval('cheques_devueltos_idcheques_devueltos_seq') as id";

		require "conexionPostgresql.php";
		$psql = new Conexion();
	
		$filas = $psql->consulta($sql);

		$id=$filas[0]['id'];
		
		unset($filas);
		$sql = 'insert into cheques_devueltos (idcheques_devueltos, cuentas_mmov_idcuentas_mmov, pdvs_idpdvs, bancos_idbancos, fecha_devolucion, num_cheque,
			monto, usuario_ingreso)
		values (\'' . $id . '\', \'' .$datos['sel_cuentaCheque']. '\', \'' .$datos['sel_pdv']. '\', \'' .$datos['sel_bancoCheque']. '\',
		 \'' .$datos['dat_fechaCheque']. '\',
			\'' .$datos['num_numCheque']. '\', \'' .$datos['num_montoCheque']. '\', \''.$idUsuario.'\' )';



		$filas = $psql->insertar($sql);

		if(!$filas){
			return false;
		}


		if ($datos['che_repo']){
		
		if (isset($datos['num_numChequeRepo'])){
			$num_cheque = $datos['num_numChequeRepo'];
		} else {
			$num_cheque = "";
		}

		

		if($num_cheque == ""){
			$num_cheque = 'null';
		}

		
		$sql = 'insert into reposicion_cheques (formas_pago_idformas_pago, cuentas_mmov_idcuentas_mmov, bancos_idbancos,
			 cheques_devueltos_idcheques_devueltos, fecha_recuperacion, monto, referencia, num_cheque_repo, usuario_ingreso)
		values (\'' .$datos['sel_forma']. '\', \'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_banco']. '\',
		 \'' .$id. '\',
			\'' .$datos['dat_fechaRepo']. '\', \'' .$datos['num_montoRepo']. '\', \'' .$datos['num_voucher']. '\',
		 '.$num_cheque.', \''.$idUsuario.'\')';
		
		echo $sql;
		$filas = $psql->insertar($sql);
		unset($sql);

		return $filas;

		} else {
			return $filas;
		}


	}



/* FUNCTION PARA ACTUALIZAR LOS DATOS DE UN CHEQUE DEVUELTO
	RETURN : BOOLEAN
 */
		function editarDatos($datos, $id){

		global $idUsuario;
		
		//$sql = "select nextval('cheques_devueltos_idcheques_devueltos_seq') as id";

		require "conexionPostgresql.php";
		$psql = new Conexion();
	
		//$filas = $psql->consulta($sql);

		//$id=$filas[0]['id'];
		
		//unset($filas);
		$sql = 'update cheques_devueltos set cuentas_mmov_idcuentas_mmov = \'' .$datos['sel_cuentaCheque']. '\',
			 pdvs_idpdvs = \'' .$datos['sel_pdv']. '\',
			 bancos_idbancos = \'' .$datos['sel_bancoCheque']. '\',
			 fecha_devolucion = \'' .$datos['dat_fechaCheque']. '\',
			 num_cheque = \'' .$datos['num_numCheque']. '\' ,
			monto = \'' .$datos['num_montoCheque']. '\',
			usuario_ingreso = \''.$idUsuario.'\'
			where idcheques_devueltos = \''.$id.'\'
			';



		$filas = $psql->insertar($sql);

		if(!$filas){
			return false;
		}


		if ($datos['che_repo']){
		
		if (isset($datos['num_numChequeRepo'])){
			$num_cheque = $datos['num_numChequeRepo'];
		} else {
			$num_cheque = "";
		}

		

		if($num_cheque == ""){
			$num_cheque = 'null';
		}

		$sql = "select idrecuperacion_cheques from reposicion_cheques where cheques_devueltos_idcheques_devueltos = '$id'";

		$filas = $psql->consulta($sql);

		if (!$filas){

		$sql = 'insert into reposicion_cheques (formas_pago_idformas_pago, cuentas_mmov_idcuentas_mmov, bancos_idbancos,
			 cheques_devueltos_idcheques_devueltos, fecha_recuperacion, monto, referencia, num_cheque_repo, usuario_ingreso)
		values (\'' .$datos['sel_forma']. '\', \'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_banco']. '\',
		 \'' .$id. '\',
			\'' .$datos['dat_fechaRepo']. '\', \'' .$datos['num_montoRepo']. '\', \'' .$datos['num_voucher']. '\',
		 '.$num_cheque.', \''.$idUsuario.'\')';
		
		//echo $sql;
		$filas = $psql->insertar($sql);
		unset($sql);

		return $filas;

		} else {

			$sql = 'update reposicion_cheques set formas_pago_idformas_pago = \'' .$datos['sel_forma']. '\',
				 cuentas_mmov_idcuentas_mmov = \'' .$datos['sel_cuenta']. '\',
				 bancos_idbancos = \'' .$datos['sel_banco']. '\',
			 	 fecha_recuperacion = \'' .$datos['dat_fechaRepo']. '\',
				 monto =  \'' .$datos['num_montoRepo']. '\', 
				 referencia = \'' .$datos['num_voucher']. '\',
				 num_cheque_repo = '.$num_cheque.',
				 usuario_ingreso = \''.$idUsuario.'\'
					where cheques_devueltos_idcheques_devueltos = \''.$id.'\'
				 ';
	
		
		//echo $sql;
		$filas = $psql->insertar($sql);
		unset($sql);

		return $filas;

		}
		
		

		} else {
			return $filas;
		}


	}


/* FUNCTION PARA CARGAR LOS DATOS DE LOS CHEQUES DEVUELTOS ALMACENADOS
	RETURN : ARRAY
 */

	function cargarCheques($id = null){


		if ($id == null) {
		
		$sql = "select a.id, to_char(a.fecha,'DD/MM/YYYY') as fecha, a.num_cheque, to_char(a.monto, '999,999.99') as monto, a.cuenta, a.pdv, a.banco,
			 to_char(b.fecha_repo,'DD/MM/YYYY') as fecha_repo, to_char(b.monto_repo, '999,999.99') as monto_repo,
			 b.referencia, b.num_cheque_repo, b.banco_repo, 
	b.forma_pago, b.cuenta, a.dti from
	(select a.idcheques_devueltos as id, a.fecha_devolucion as fecha, a.num_cheque, a.monto,
		 c.nombre as cuenta, d.nombre as pdv, e.nombre_completo as banco, h.nombre || ' ' || h.apellido as dti
		from cheques_devueltos a, cuentas_mmov c, pdvs d, bancos e, rutas g, personas h
		where a.cuentas_mmov_idcuentas_mmov = c.idcuentas_mmov and a.pdvs_idpdvs = d.idpdvs 
		and a.bancos_idbancos = e.idbancos
		and d.rutas_idrutas = g.idrutas and g.dti_personas_idpersonas = h.idpersonas
		) a
		left join
	(select b.cheques_devueltos_idcheques_devueltos as idche, b.fecha_recuperacion as fecha_repo, b.monto as monto_repo, b.referencia,
		b.num_cheque_repo, a.nombre_completo as banco_repo, c.forma_pago, d.nombre as cuenta
		  from reposicion_cheques b, bancos a, formas_pago c, cuentas_mmov d
		where b.bancos_idbancos = a.idbancos
		and b.formas_pago_idformas_pago = c.idformas_pago
		and b.cuentas_mmov_idcuentas_mmov = d.idcuentas_mmov
		) b
		on a.id = b.idche";


		} else {

				$sql = "select a.id, to_char(a.fecha, 'DD/MM/YYYY') as fecha, a.num_cheque, a.monto, a.cuenta, a.pdv, a.banco,
					 to_char(b.fecha_repo, 'DD/MM/YYYY') as fecha_repo, b.monto_repo, b.referencia, b.num_cheque_repo, b.banco_repo, 
	b.forma_pago, b.cuenta, a.dti, a.idbanco, a.idcuenta, b.idbanco_repo, b.idcuenta_repo,
				b.idpago, a.idpdv from
	(select a.idcheques_devueltos as id, a.fecha_devolucion as fecha, a.num_cheque, a.monto,
		 c.nombre as cuenta, d.nombre as pdv, e.nombre_completo as banco, h.nombre || ' ' || h.apellido as dti, a.bancos_idbancos as idbanco,
		 a.cuentas_mmov_idcuentas_mmov as idcuenta, a.pdvs_idpdvs as idpdv
		from cheques_devueltos a, cuentas_mmov c, pdvs d, bancos e, rutas g, personas h
		where a.cuentas_mmov_idcuentas_mmov = c.idcuentas_mmov and a.pdvs_idpdvs = d.idpdvs 
		and a.bancos_idbancos = e.idbancos
		and d.rutas_idrutas = g.idrutas and g.dti_personas_idpersonas = h.idpersonas
		and a.idcheques_devueltos = '$id'
		) a
		left join
	(select b.cheques_devueltos_idcheques_devueltos as idche, b.fecha_recuperacion as fecha_repo, b.monto as monto_repo, b.referencia,
		b.num_cheque_repo, a.nombre_completo as banco_repo, c.forma_pago, d.nombre as cuenta, b.bancos_idbancos as idbanco_repo,
		b.cuentas_mmov_idcuentas_mmov as idcuenta_repo, b.formas_pago_idformas_pago as idpago
		  from reposicion_cheques b, bancos a, formas_pago c, cuentas_mmov d
		where b.bancos_idbancos = a.idbancos
		and b.formas_pago_idformas_pago = c.idformas_pago
		and b.cuentas_mmov_idcuentas_mmov = d.idcuentas_mmov
		and b.cheques_devueltos_idcheques_devueltos = '$id'
		) b
		on a.id = b.idche";


		}

		require_once "conexionPostgresql.php";

		$psql = new Conexion();

		$filas = $psql->consulta($sql);

		return $filas;


	}	

	
/* AREA PARA LA SELECCION DE LAS FUNCIONES A EJECUTAR SEGUN LAS SOLICITUDES DEL USUARIO */

	if ( isset($_POST['tex_accion']) ) {

		if ($_POST['tex_accion'] == "guardar"){
			$r = guardarDatos($_POST);
		} else {
			$r = editarDatos($_POST, $_GET['id']);
		}
		
		if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}


	} else if (isset($_POST['cargarCheques'])){
		
		$r = cargarCheques();
			//$r = false;
		if (!$r){ echo "-1"; } else {


			echo json_encode($r);
		}


	} else if (isset($_POST['cargarEdiciones'])){

		$r = cargarCheques($_POST['id']);


		if (!$r){ echo "-1"; } else {
			echo json_encode($r);
		}


	}



?>