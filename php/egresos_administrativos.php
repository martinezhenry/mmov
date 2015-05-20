<?php

/************************************************************************
*									*
*  Archivo : egresos_administrativos.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de egresos administrativos MMOV					*
*									*
************************************************************************/


// SE CARGA EL ARCHIVO QUE COMPRUEBA LA CONEXION

require_once "comprobarSession.php";

// VARIABLES GLOBALES

$g_id = "";
$id_islr = "";
$id_iva = "";


/* FUNCTION PARA ALMACENAR LOS DATOS DEL FORMULARIO
	RETURN : BOOLEAN
 */

	function guardarDatos($datos){
	global $g_id;
	global $id_islr;
	global $id_iva;
	global $idUsuario;

//var_dump($datos);

/*	foreach ($datos as $key => $value){

	if ($value == ""){

		return false;
	}


	if ($value == "-1"){

		return false;
	}
	
	}
*/
	if (isset($datos['che_anular'])){

		$sql = "SELECT nextval('egresos_administrativos_idegresos_administrativos_seq') as id";
		
	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		$id = $filas[0]['id'];
		$g_id = $id;

				$sql = 'insert into egresos_administrativos (idegresos_administrativos, fecha, monto, emisor, a_nombre, cuentas_mmov_idcuentas_mmov,
		 tipos_items_idtipos_items, concepto, num_cheque, estatus, usuario_ingreso)
		values (\''.$id.'\', \'' .$datos['dat_fecha']. '\', \'' .$datos['tex_monto_cheque']. '\', \'' .$datos['tex_emisor']. '\',
		 \'' .$datos['tex_receptor']. '\',
			\'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_item']. '\',
			 \'' .$datos['tex_concepto']. '\', \'' .trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque']). '\', \'A\', \''.$idUsuario.'\')';
		//$sql;
		
		$filas = $psql->insertar($sql);


		if (!$filas){ return false; }

		$sql = "select * from sp_anularcheque('".trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
		$filas = $psql->insertar($sql);

		if (!$filas){ return false; }

		$sql = "select * from sp_procesarTerminalCheque('".trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
		$filas = $psql->insertar($sql);

		if(!$filas) { return false; }

		
		return $filas;

	} else {

		$sql = "SELECT nextval('egresos_administrativos_idegresos_administrativos_seq') as id";
		
	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		$id = $filas[0]['id'];
		$g_id = $id;
		
		$sql = 'insert into egresos_administrativos (idegresos_administrativos, fecha, monto, emisor, a_nombre, cuentas_mmov_idcuentas_mmov,
		 tipos_items_idtipos_items, concepto, num_cheque, usuario_ingreso)
		values (\''.$id.'\',\'' .$datos['dat_fecha']. '\', \'' .$datos['tex_monto_cheque']. '\', \'' .$datos['tex_emisor']. '\',
		 \'' .$datos['tex_receptor']. '\',
			\'' .$datos['sel_cuenta']. '\', \'' .$datos['sel_item']. '\',
			 \'' .$datos['tex_concepto']. '\', \'' .trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque']). '\', \''.$idUsuario.'\')';
		
		//require "conexionPostgresql.php";
		//$psql = new Conexion();
		$filas = $psql->insertar($sql);

		if (!$filas){ return false; }
		$sql = "select * from sp_procesarTerminalCheque('".trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
		$filas = $psql->insertar($sql);


//============== RETENCION ============================

		if (isset($datos['che_retencion_islr'])){

			$sql = "SELECT nextval('retenciones_islr_idretenciones_islr_seq') as id";

			$filas = $psql->consulta($sql);

			$id_islr = $filas[0]['id'];

			$sql = "select * from SP_TOMAR_SECUENCIA_ISLR() as num_islr";

			$filas = $psql->consulta($sql);

			$num_islr = $filas[0]['num_islr'];

			if ($num_islr == '-1') { return false; } 


			$sql = "insert into retenciones_islr (idretenciones_islr, egresos_administrativos_idegresos_administrativos, numero, fecha, proveedor,
				rif_proveedor, usuario_ingreso) values 
				('".$id_islr."', '".$id."', '".$num_islr."', '".$datos['dat_fecha']."', '".$datos['tex_proveedor']."', '".$datos['tex_rif_proveedor']."', '".$idUsuario."')";
			
			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }

			if ($datos['tex_num_factura'] == ""){ $datos['tex_num_factura'] = 'null'; }
			if ($datos['tex_num_control'] == ""){ $datos['tex_num_control'] = 'null'; }
			if ($datos['tex_fecha_factura'] == ""){ $datos['tex_fecha_factura'] = 'null'; } 
			else { $datos['tex_fecha_factura'] = "'".$datos['tex_fecha_factura'] ."'"; }


			$sql = "insert into items_retenciones_islr (retenciones_islr_idretenciones_islr, fecha, numero_factura, numero_control, codigo_concepto,
				base_imponible, porcentaje_aplicado, monto_retenido, usuario_ingreso, monto_exento) values 
				('".$id_islr."', ".$datos['tex_fecha_factura'].", ".$datos['tex_num_factura'].", ".$datos['tex_num_control'].", NULL,
				'".$datos['tex_base_imponible']."', '".$datos['tex_islr']."', '".$datos['tex_islr_retenido']."', '".$idUsuario."', '".$datos['tex_monto_exento']."')";

			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }

			}

			//======== SE INGRESA LAS RETENCIONES DEL IVA ================================
			if (isset($datos['che_retencion_iva'])){


			$sql = "SELECT nextval('retenciones_iva_idretenciones_iva_seq') as id";

			$filas = $psql->consulta($sql);

			$id_iva = $filas[0]['id'];

			$sql = "select * from SP_TOMAR_SECUENCIA_IVA() as num_iva";

			$filas = $psql->consulta($sql);

			$num_iva = $filas[0]['num_iva'];

			if ($num_iva == '-1') { return false; } 

			
			$sql = "insert into retenciones_iva (idretenciones_iva,egresos_administrativos_idegresos_administrativos, numero, fecha, proveedor, rif_proveedor, usuario_ingreso) values
				('".$id_iva."', '".$id."', '".$num_iva."', '".$datos['dat_fecha']."', '".$datos['tex_proveedor']."', '".$datos['tex_rif_proveedor']."', '".$idUsuario."')";



			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }
			
			$sql = "insert into items_retenciones_iva (retenciones_iva_idretenciones_iva, fecha, numero_factura, numero_control, 
				monto_con_iva, base_imponible, monto_exencion, porcentaje_aplicado, iva, porcentaje_retencion, iva_retenido, usuario_ingreso) values
				('".$id_iva."', ".$datos['tex_fecha_factura'].", ".$datos['tex_num_factura'].", ".$datos['tex_num_control'].",
				'".$datos['tex_monto']."', '".$datos['tex_base_imponible']."', '".$datos['tex_compra_exenta']."', '".$datos['tex_porcentaje_iva']."',
				 '".$datos['tex_imp_iva']."', '".$datos['tex_porcentaje_iva_retencion']."', '".$datos['tex_iva_retenido']."', '".$idUsuario."')";

			$filas = $psql->insertar($sql);

			

		
		} // ========= FIN RETENCION IVA ========================




		return $filas;

	}

//echo $sql;

	


	}


/* FUNCTION PARA OBTENER EL NUMERO TERMINAL DEL CHEQUE QUE SE EMPLEARA
	RETURN : ARRAY
 */

function tomarTerminalCheque($cuenta){

	
	$sql = "select * from SP_TomarNumeroCheque('".$cuenta."') as numero";

	//echo $sql;

	//return;
	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		return $filas;

}


/* FUNCTION PARA LIBERAR EL NUMERO TERMINAL TOMADO, EN CASO DE TERMINAR CON LA TRANSACCION
	RETURN : ARRAY
*/

function liberarTerminalCheque($terminal, $cuenta){

	
	$sql = "select * from SP_LiberarTerminalCheque($terminal, '".$cuenta."') as numero";

	//echo $sql;

	//return;
	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		return $filas;

}


/* FUNCTION PARA CONSULTAR LOS EGRESOS QUE HAN SIDO ALAMACENADOS
	RETURN : ARRAY
 */

function cargarEgresos($id = null){


if ($id != null){

	$sql = "select b.numero as cuenta, to_char(a.fecha,'DD/MM/YYYY') as fecha, to_char(a.monto,'9,999,999.99') as monto, a.concepto, a.num_cheque, a.a_nombre as receptor, a.emisor as emisor, a.estatus,
		c.item as categoria, a.idegresos_administrativos as id, d.nombre_completo as banco, a.estatus, 
		case when a.estatus = 'A' then 'ANULADO' when a.estatus = 'P' then 'PROCESADO'
		else 'INACTIVO' end as estatus_texto
		from egresos_administrativos a, cuentas_mmov b, tipos_items c, bancos d
		 where a.cuentas_mmov_idcuentas_mmov = b.idcuentas_mmov
			and a.tipos_items_idtipos_items = c.idtipos_items and idegresos_administrativos = '".$id."'
			and b.bancos_idbancos = d.idbancos order by a.fecha desc";

} else {
	
	$sql = "select b.numero as cuenta,  to_char(a.fecha,'DD/MM/YYYY') as fecha, to_char(a.monto,'9,999,999.99') as monto, a.concepto, a.num_cheque, a.a_nombre as receptor, a.emisor as emisor, a.estatus,
		c.item as categoria, a.idegresos_administrativos as id, a.estatus, 
		case when a.estatus = 'A' then 'ANULADO' when a.estatus = 'P' then 'PROCESADO'
		else 'INACTIVO' end as estatus_texto
		from egresos_administrativos a, cuentas_mmov b, tipos_items c
		 where a.cuentas_mmov_idcuentas_mmov = b.idcuentas_mmov
			and a.tipos_items_idtipos_items = c.idtipos_items order by a.fecha desc";

}
	//echo $sql;

	//return;
	require "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		return $filas;



}


/* FUNCTION PARA CARGAR LAS RETENCIONES DE ISLR APLICADAS A LOS EGRESOS 
	RETURN : ARRAY
*/

function cargarRetencionesISLR($id = null, $id_egreso = null){


	if ($id == null){

		$sql = "select a.numero, to_char(a.fecha,'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor,
	to_char(b.fecha,'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control,
	b.codigo_concepto as cod_concepto, to_char(b.base_imponible, '999,999.99') as base_imponible, b.porcentaje_aplicado as porc_aplicado,
	to_char(b.monto_retenido, '999,999.99') as islr_retenido
 	from retenciones_islr a, items_retenciones_islr b where a.idretenciones_islr = b.retenciones_islr_idretenciones_islr
	";

	} else {


		if ($id_egreso != null){

		$sql = "select a.numero, to_char(a.fecha,'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor,
	to_char(b.fecha, 'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control,
	b.codigo_concepto as cod_concepto, to_char(b.base_imponible, '999,999.99') as base_imponible, b.porcentaje_aplicado as porc_aplicado,
	to_char(b.monto_retenido, '999,999.99') as islr_retenido
 	from retenciones_islr a, items_retenciones_islr b where a.idretenciones_islr = b.retenciones_islr_idretenciones_islr
	and a.egresos_administrativos_idegresos_administrativos = '".$id_egreso."'";
	} else {

		$sql = "select a.numero, to_char(a.fecha,'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor,
	to_char(b.fecha, 'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control,
	b.codigo_concepto as cod_concepto, to_char(b.base_imponible, '999,999.99') as base_imponible, b.porcentaje_aplicado as porc_aplicado,
	to_char(b.monto_retenido, '999,999.99') as islr_retenido
 	from retenciones_islr a, items_retenciones_islr b where a.idretenciones_islr = b.retenciones_islr_idretenciones_islr
	and a.idretenciones_islr = '".$id."'";
	}	


	}

		require_once "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		return $filas;


}


/* FUNCTION PARA CARGAR LAS RETENCIONES DE IVA APLICADO A LOS EGRESOS
	RETRUN : ARRAY
 */

function cargarRetencionesIVA($id = null, $id_egreso = null){


	if ($id == null){

		$sql = "select a.numero, to_char(a.fecha, 'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor, 
to_char(b.fecha, 'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control, 
to_char(b.monto_con_iva, '999,999.99') as monto_con_iva, to_char(b.base_imponible, '999,999.99') as base_imponible,
 to_char(b.monto_exencion, '999,999.99') as monto_exencion, b.porcentaje_aplicado as porc_aplicado, to_char(b.iva, '999,999.99') as iva,
b.porcentaje_retencion as porc_retencion, to_char(iva_retenido, '999,999.99') as iva_retenido
from retenciones_iva a, items_retenciones_iva b 
where a.idretenciones_iva = b.retenciones_iva_idretenciones_iva
	";

	} else {

	if($id_egreso != null){

		$sql = "select a.numero, to_char(a.fecha, 'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor, 
to_char(b.fecha, 'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control, 
to_char(b.monto_con_iva, '999,999.99') as monto_con_iva, to_char(b.base_imponible, '999,999.99') as base_imponible,
 to_char(b.monto_exencion, '999,999.99') as monto_exencion, b.porcentaje_aplicado as porc_aplicado, to_char(b.iva, '999,999.99') as iva,
b.porcentaje_retencion as porc_retencion, to_char(iva_retenido, '999,999.99') as iva_retenido
from retenciones_iva a, items_retenciones_iva b 
where a.idretenciones_iva = b.retenciones_iva_idretenciones_iva and a.egresos_administrativos_idegresos_administrativos = '".$id_egreso."'";

	} else {

		$sql = "select a.numero, to_char(a.fecha, 'DD/MM/YYYY') as fecha_retencion, a.proveedor, a.rif_proveedor, 
to_char(b.fecha, 'DD/MM/YYYY') as fecha_fact, b.numero_factura as num_factura, b.numero_control as num_control, 
to_char(b.monto_con_iva, '999,999.99') as monto_con_iva, to_char(b.base_imponible, '999,999.99') as base_imponible,
 to_char(b.monto_exencion, '999,999.99') as monto_exencion, b.porcentaje_aplicado as porc_aplicado, to_char(b.iva, '999,999.99') as iva,
b.porcentaje_retencion as porc_retencion, to_char(iva_retenido, '999,999.99') as iva_retenido
from retenciones_iva a, items_retenciones_iva b 
where a.idretenciones_iva = b.retenciones_iva_idretenciones_iva and a.idretenciones_iva = '".$id."'";
	}

	}

		require_once "conexionPostgresql.php";
		$psql = new Conexion();
		$filas = $psql->consulta($sql);

		return $filas;


}



/* FUNCTION PARA CARGAR LOS DATOS DE UN EGRESOS QUE SE DESEA MODIFICAR
	RETURN : ARRAY
 */
function cargarEdiciones($id){

	$sql = "select cuentas_mmov_idcuentas_mmov, tipos_items_idtipos_items, to_char(fecha,'DD/MM/YYYY') as fecha,
		monto, concepto, num_cheque, a_nombre, emisor, estatus
		 from egresos_administrativos where idegresos_administrativos = '$id'";	

	require_once "conexionPostgresql.php";
		$psql = new Conexion();
		$egreso = $psql->consulta($sql);

	if (!$egreso) { return false; }

	$sql = "select * from retenciones_islr a, items_retenciones_islr b where a.idretenciones_islr = b.retenciones_islr_idretenciones_islr
		and a.egresos_administrativos_idegresos_administrativos = '$id'";

		$retenciones_islr = $psql->consulta($sql);

	$sql = "select digitos_seguridad from chequeras where cuentas_mmov_idcuentas_mmov = '".$egreso[0]['cuentas_mmov_idcuentas_mmov']."'
		and estatus = 'A'";

	$digitos_seguridad = $psql->consulta($sql);



	if(!$retenciones_islr) {
	
	$monto =  $egreso[0]['monto'];


	
		$datos = array('cuenta' => $egreso[0]['cuentas_mmov_idcuentas_mmov'],
				'item' => $egreso[0]['tipos_items_idtipos_items'],
				'fecha_egreso' => $egreso[0]['fecha'],
				'monto_egreso' => $monto,
				'concepto' => $egreso[0]['concepto'],
				'num_cheque' => $egreso[0]['num_cheque'],
				'beneficiario' => $egreso[0]['a_nombre'],
				'emisor' => $egreso[0]['emisor'],
				'dig_seguridad' => $digitos_seguridad[0]['digitos_seguridad'],
				'estatus' => $egreso[0]['estatus']
				);
	

		return $datos;

	} else {

	$sql = "select to_char(b.fecha,'DD/MM/YYYY') as fecha_factura, b.iva_retenido from retenciones_iva a
left join
 items_retenciones_iva b
on a.idretenciones_iva = b.retenciones_iva_idretenciones_iva
  where 
 a.egresos_administrativos_idegresos_administrativos = '$id'";

		$retenciones_iva = $psql->consulta($sql);


	
	$monto =  $egreso[0]['monto']+$retenciones_islr[0]['monto_retenido']+$retenciones_iva[0]['iva_retenido'];
	
		$datos = array('cuenta' => $egreso[0]['cuentas_mmov_idcuentas_mmov'],
				'item' => $egreso[0]['tipos_items_idtipos_items'],
				'fecha_egreso' => $egreso[0]['fecha'],
				'monto_egreso' => $monto,
				'concepto' => $egreso[0]['concepto'],
				'num_cheque' => $egreso[0]['num_cheque'],
				'beneficiario' => $egreso[0]['a_nombre'],
				'emisor' => $egreso[0]['emisor'],
				'estatus' => $egreso[0]['estatus'],
				'numero_factura' => $retenciones_islr[0]['numero_factura'],
				'fecha_factura' => $retenciones_iva[0]['fecha_factura'],
				'proveedor' => $retenciones_islr[0]['proveedor'],
				'rif_proveedor' => $retenciones_islr[0]['rif_proveedor'],
				'numero_control' => $retenciones_islr[0]['numero_control'],
				'porc_islr' => $retenciones_islr[0]['porcentaje_aplicado'],
				'dig_seguridad' => $digitos_seguridad[0]['digitos_seguridad'],
				'che_retenciones' => '1');

		return $datos;

}

}

/* FUNCTION PARA ACTUALIZAR LOS DATOS DE UN EGRESOS 
	RETURN : BOOLEAN
*/

function guardarEdicion($datos, $id){
	global $g_id;
	global $id_islr;
	global $id_iva;

//var_dump($datos);

/*	foreach ($datos as $key => $value){

	if ($value == ""){

		return false;
	}


	if ($value == "-1"){

		return false;
	}
	
	}
*/
	if (isset($datos['che_anular'])){

		//$sql = "SELECT nextval('egresos_administrativos_idegresos_administrativos_seq') as id";
		
	require "conexionPostgresql.php";
		$psql = new Conexion();
	//	$filas = $psql->consulta($sql);

	//	$id = $filas[0]['id'];
		$g_id = $id;


				$sql = 'update egresos_administrativos set fecha = \'' .$datos['dat_fecha']. '\',
					 monto = \'' .$datos['tex_monto_cheque']. '\',
					 emisor = \'' .$datos['tex_emisor']. '\',
					 a_nombre =  \'' .$datos['tex_receptor']. '\', 
					 tipos_items_idtipos_items = \'' .$datos['sel_item']. '\',
					 concepto = \'' .$datos['tex_concepto']. '\',
					 num_cheque = \'' .trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque']). '\',
					 estatus = \'A\' where idegresos_administrativos = \''.$id.'\'';
				//$sql;
		
		$filas = $psql->insertar($sql);


		if (!$filas){ return false; }

		$sql = "select * from sp_anularcheque('".trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
		$filas = $psql->insertar($sql);

		if (!$filas){ return false; }

		//$sql = "select * from sp_procesarTerminalCheque('".trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
		//$filas = $psql->insertar($sql);

		//if(!$filas) { return false; }

		
		return $filas;

	} else {

		//$sql = "SELECT nextval('egresos_administrativos_idegresos_administrativos_seq') as id";
		
	require "conexionPostgresql.php";
		$psql = new Conexion();
	//	$filas = $psql->consulta($sql);

	//	$id = $filas[0]['id'];
		$g_id = $id;
		
				$sql = 'update egresos_administrativos set fecha = \'' .$datos['dat_fecha']. '\',
					 monto = \'' .$datos['tex_monto_cheque']. '\',
					 emisor = \'' .$datos['tex_emisor']. '\',
					 a_nombre =  \'' .$datos['tex_receptor']. '\', 
					 tipos_items_idtipos_items = \'' .$datos['sel_item']. '\',
					 concepto = \'' .$datos['tex_concepto']. '\',
					 num_cheque = \'' .trim($datos['tex_pre_num_cheque']).trim($datos['tex_post_num_cheque']). '\',
					 estatus = \'P\' where idegresos_administrativos = \''.$id.'\'';
		
		//require "conexionPostgresql.php";
		//$psql = new Conexion();
		$filas = $psql->insertar($sql);

		if (!$filas){ return false; }
	//	$sql = "select * from sp_procesarTerminalCheque('".trim($datos['tex_post_num_cheque'])."', '".$datos['sel_cuenta']."')";
	//	$filas = $psql->insertar($sql);


//============== RETENCION ============================

		if (isset($datos['che_retencion_islr'])){

		//	$sql = "SELECT nextval('retenciones_islr_idretenciones_islr_seq') as id";

		//	$filas = $psql->consulta($sql);

		//	$id_islr = $filas[0]['id'];

		//	$sql = "select * from SP_TOMAR_SECUENCIA_ISLR() as num_islr";

		//	$filas = $psql->consulta($sql);

		//	$num_islr = $filas[0]['num_islr'];

		//	if ($num_islr == '-1') { return false; } 


			$sql = "update retenciones_islr set fecha = '".$datos['dat_fecha']."', proveedor = '".$datos['tex_proveedor']."',
				rif_proveedor = '".$datos['tex_rif_proveedor']."'
				where egresos_administrativos_idegresos_administrativos = '".$id."'";
			
			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }

			if ($datos['tex_num_factura'] == ""){ $datos['tex_num_factura'] = 'null'; }
			if ($datos['tex_num_control'] == ""){ $datos['tex_num_control'] = 'null'; }
			if ($datos['tex_fecha_factura'] == ""){ $datos['tex_fecha_factura'] = 'null'; } 
			else { $datos['tex_fecha_factura'] = "'".$datos['tex_fecha_factura'] ."'"; }

			$sql = "select idretenciones_islr as id from retenciones_islr where egresos_administrativos_idegresos_administrativos = '".$id."'";
			
			$filas = $psql->consulta($sql);
			$id_islr = $filas[0]['id'];

			$sql = "update items_retenciones_islr set fecha = ".$datos['tex_fecha_factura'].",
				 numero_factura = ".$datos['tex_num_factura'].",
				 numero_control = ".$datos['tex_num_control'].",
				 base_imponible = '".$datos['tex_base_imponible']."',
				 porcentaje_aplicado = '".$datos['tex_islr']."',
				 monto_retenido = '".$datos['tex_islr_retenido']."'
				where retenciones_islr_idretenciones_islr = '".$id_islr."'";

			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }

			}

			//======== SE INGRESA LAS RETENCIONES DEL IVA ================================
			
		if (isset($datos['che_retencion_iva'])){


			//$sql = "SELECT nextval('retenciones_iva_idretenciones_iva_seq') as id";

			//$filas = $psql->consulta($sql);

			//$id_iva = $filas[0]['id'];

			//$sql = "select * from SP_TOMAR_SECUENCIA_IVA() as num_iva";

			//$filas = $psql->consulta($sql);

			//$num_iva = $filas[0]['num_iva'];

			//if ($num_iva == '-1') { return false; } 

			
			$sql = "update retenciones_iva set fecha = '".$datos['dat_fecha']."', proveedor = '".$datos['tex_proveedor']."',
				 rif_proveedor = '".$datos['tex_rif_proveedor']."'
				where egresos_administrativos_idegresos_administrativos = '".$id."'";



			$filas = $psql->insertar($sql);

			if(!$filas) { return false; }

			$sql = "select idretenciones_iva as id from retenciones_iva where egresos_administrativos_idegresos_administrativos = '".$id."'";
			
			$filas = $psql->consulta($sql);
			$id_iva = $filas[0]['id'];

			
			$sql = "update items_retenciones_iva set fecha = ".$datos['tex_fecha_factura'].",
				 numero_factura = ".$datos['tex_num_factura'].",
				 numero_control =  ".$datos['tex_num_control'].", 
				 monto_con_iva = '".$datos['tex_monto']."',
				 base_imponible = '".$datos['tex_base_imponible']."',
				 porcentaje_aplicado = '".$datos['tex_porcentaje_iva']."', 
				 iva = '".$datos['tex_imp_iva']."',
				 porcentaje_retencion = '".$datos['tex_porcentaje_iva_retencion']."',
				 iva_retenido = '".$datos['tex_iva_retenido']."'
				where retenciones_iva_idretenciones_iva = '".$id_iva."'";

			$filas = $psql->insertar($sql);

			

		
		} // ========= FIN RETENCION ========================




		return $filas;

	}

//echo $sql;

	


	}


/* AREA PARA SELECCIONAR LAS FUNCIONES A EJECUTAR SEGUN LAS SOLICITUDES DEL USUARIO */

if (isset($_POST['tex_accion'])){

	if ($_POST['tex_accion'] == "guardar") {
		

		$r = guardarDatos($_POST);

	} else{
		$r = guardarEdicion($_POST, $_GET['id']);
		$_SERVER['HTTP_REFERER'] = str_replace('?pag='.$_GET['id'],'',$_SERVER['HTTP_REFERER']);
	}


	if ($r){
		//header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7&new_new=15');
		//echo "<script> window.open('../Reportes/ComprobanteDePago.php?pag=".$g_id."'); 
		// window.location='".$_SERVER['HTTP_REFERER'] ."?view=article&id=7&new_new=15' </script>";
		
echo "<script> var reporte = window.open('../Reportes/ComprobanteDePago.php?pag=".base64_encode($g_id)."', 'Pago'); ";

if ($id_islr != ""){

 echo " var islr = window.open('../Reportes/comprobanteRetencionISLR.php?pag=".base64_encode($id_islr)."', 'ISLR'); ";
}

if ($id_iva != ""){

 echo " var iva = window.open('../Reportes/comprobanteRetencionIVA.php?pag=".base64_encode($id_iva)."', 'IVA'); ";
}

//echo "alert('".$_SERVER['HTTP_REFERER'] ."?view=article&id=7&new_new=15');";

echo "  window.location='".$_SERVER['HTTP_REFERER'] ."?view=article&id=7&new_new=15'; 		</script>";
		

	} else {
	//exit();
			//header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}

} else if (isset($_POST['tomarTerminalCheque'])){

	$resp = tomarTerminalCheque($_POST['cuenta']);
	//$resp = 0;

	//var_dump($_POST);
	if ($resp[0]['numero'] == "-1"){
		echo "-1";
	} else if ($resp[0]['numero'] == "0"){
		echo "0";
	} else {
		echo $resp[0]['numero'];
	}

} else if (isset($_POST['liberarTerminalCheque'])){

	$resp = liberarTerminalCheque($_POST['terminal'], $_POST['cuenta']);
	//$resp = 0;

	//var_dump($resp);
	if ($resp[0]['numero'] == "-1"){
		echo "-1";
	} else if ($resp[0]['numero'] == "0"){
		echo "0";
	} else {
		echo $resp[0]['numero'];
	}

} else if (isset($_POST['cargarEgresos'])){



$egresos = cargarEgresos();


if (is_array($egresos)){

foreach ($egresos as $key => $value) {


$cuenta = preg_replace('/[0-9]/','*',substr($value['cuenta'], 0, -4)) . substr($value['cuenta'], -4);
if ($value['estatus'] == "A"){

$d = "disabled";

} else { $d = ""; }

echo "<tr>";
echo "<td>".$value['fecha']."</td>";
echo "<td>".$cuenta."</td>";
echo "<td>".$value['num_cheque']."</td>";
echo "<td>".$value['receptor']."</td>";
echo "<td>".$value['monto']."</td>";
echo "<td>".$value['concepto']."</td>";
echo "<td>".$value['emisor']."</td>";
echo "<td>".$value['categoria']."</td>";
echo "<td>".$value['estatus_texto']."</td>";
//echo "<td>
//<a href='../cargar-datos/egresos-administrativos?pag=".$value['id']."'><img src='../../images/my_img/file_edit.png' width="10px" heigth="10px"/></a>
//</td>";
echo "<td><input type='radio' ".$d." name='radio_b' value='".base64_encode($value['id'])."'/> 
<a href='../cargar-datos/egresos-administrativos?pag=".$value['id']."'><img src='../../images/my_img/file_edit.png' width='13px' heigth='13px'/></a></td>";


echo "</tr>";
}

} else {

echo "<tr><td colspan='9'>No hay datos</td></tr>";

}



} else if (isset($_POST['cargarEdiciones'])){


$datos = cargarEdiciones($_POST['id']);


echo json_encode($datos);


} 





 ?>