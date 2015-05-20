<?php 

/************************************************************************
*									*
*  Archivo : reposicion_caja_chia.php					*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de caja chica MMOV					*
*									*
************************************************************************/







/* FUNCION PARA GUARDAR LOS DATOS ENVIADOS A LA BASE DE DATOS
	RETURN : BOOLEAN
 */

	function guardar($datos){

	$sql = "SELECT nextval('gastos_caja_chica_idgastos_caja_chica_seq') as id";

	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);


	$id = $filas[0]['id'];
	
	$sql = "insert into reposicion_caja_chica (idreposicion_caja_chica, fecha, estatus, caja_chica_idcaja_chica) values

		('" .$id. "', '".$datos['dat_fecha_repo']."', 'A', '2')";

	

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
	

/* FUNCTION QUE VERIFICA SI EL NUMERO DE NOTA O FACTURA YA EXISTE
	RETURN : BOOLEAN
 */

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

/* FUNCTION QUE OBTINE LA FECHA DE LA ULTIMA CAJA CHICA CARGADA
	RETURN : ARRAY
 */
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

/* FUNCTION PARA LOS PRODUCTOS CARGADOS EN LA REPOSICION DE CAJA CHICA
	RETURN : ARRAY
 */
	function cargarGastosReposicion($id = null){

		if($id == null){

		$sql = "select to_char(b.fecha,'DD/MM/YYYY') as fecha_gasto, b.idgastos_caja_chica as id,
			b.num_factura, b.concepto, b.monto as monto, b.exento as exento,
			 b.base as base, b.iva as iva, c.item, b.tipos_items_idtipos_items as iditem
		 from gastos_caja_chica b, tipos_items c
		 where c.idtipos_items = b.tipos_items_idtipos_items";

		} else {

		$sql = "select to_char(b.fecha,'DD/MM/YYYY') as fecha_gasto, b.idgastos_caja_chica as id,
			b.num_factura, b.concepto, b.monto as monto, b.exento as exento,
			 b.base as base, b.iva as iva, c.item, b.tipos_items_idtipos_items as iditem
		 from gastos_caja_chica b, tipos_items c
		 where c.idtipos_items = b.tipos_items_idtipos_items and b.reposicion_caja_chica_idreposicion_caja_chica = '$id'";

	}

	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);
	
	return $filas;


	}
	

/* FUNCCION PARA OBTENER LOS DATOS DE LAS REPOSICIONES ALMACENADAS 

	RETURN : ARRAY
*/
	function cargarReposiciones($id = null){

		if($id == null){

		$sql = "select a.idreposicion_caja_chica as id, to_char(a.fecha,'DD/MM/YYYY') as fecha_reposicion from reposicion_caja_chica a";

		} else {

		$sql = "select a.idreposicion_caja_chica as id, to_char(a.fecha,'DD/MM/YYYY') as fecha_reposicion from reposicion_caja_chica a
			where a.idreposicion_caja_chica = '$id'";


	}

	require_once "conexionPostgresql.php";
	
	$psql = new Conexion();
	
	$filas = $psql->consulta($sql);
	
	return $filas;


	}

/* FUNCTION PARA ACTURALIZAR LOS DATOS DE UNA REPOSICION
	RETURN : BOOLEAN
 */

function editar($datos, $id){

	//$sql = "SELECT nextval('gastos_caja_chica_idgastos_caja_chica_seq') as id";

	require "conexionPostgresql.php";
	
	$psql = new Conexion();
	
//	$filas = $psql->consulta($sql);


//	$id = $filas[0]['id'];
	
	$sql = "update reposicion_caja_chica set fecha = '".$datos['dat_fecha_repo']."' where idreposicion_caja_chica = '$id'";
		
	

	$result = $psql->insertar($sql);

	if (!$result){

		return false;

	}

	
	unset($filas, $result);
	
	
	$ediciones = count($datos['id_gasto']);


	for ($i=0; $i < $ediciones; $i++){

		if($datos['accion_e'][$i] == '1'){
		$sql = "delete gastos_caja_chica
			where idgastos_caja_chica = '".$datos['id_gasto'][$i]."'";

		//echo $sql;

		$result = $psql->insertar($sql);

		if(!$result){

			return false;
		}
	
		} else {
		
		
		if(($datos['tex_exento_e'][$i] == '0.00') || ($datos['tex_exento_e'][$i] == '.00')){
			$num_fact = 'Fact_' . $datos['tex_num_factura_e'][$i];
		} else {
			$num_fact = 'Nota_' . $datos['tex_num_factura_e'][$i];

		}

		$sql = "update gastos_caja_chica set tipos_items_idtipos_items = '".$datos['sel_item_e'][$i]."',
			fecha = '".$datos['dat_fecha_e'][$i]."',
			 num_factura = '".$num_fact."', concepto = '" .$datos['tex_concepto_e'][$i]. "',
			 monto =  '" .$datos['tex_monto_e'][$i]. "', exento = '" .$datos['tex_exento_e'][$i]. "',
			 base = '" .$datos['tex_base_e'][$i]. "', iva = '" .$datos['tex_iva_e'][$i]. "'
			where idgastos_caja_chica = '".$datos['id_gasto'][$i]."'";

		//echo $sql;

		$result = $psql->insertar($sql);

		if(!$result){

			return false;
		}

		}

	}



	$filas = count($datos['dat_fecha']);


	for ($i=0; $i < $filas; $i++){
	
		if($datos['tex_exento'][$i] == '0.00' || $datos['tex_exento'][$i] == '.00'){
			$num_fact = 'Fact_' . $datos['tex_num_factura'][$i];
		} else {
			$num_fact = 'Nota_' . $datos['tex_num_factura'][$i];

		}

		$sql = "insert into gastos_caja_chica (reposicion_caja_chica_idreposicion_caja_chica, tipos_items_idtipos_items,
			fecha, num_factura, concepto, monto, exento, base, iva) values 
			('" .$id. "', '" .$datos['sel_item'][$i]. "', '" .$datos['dat_fecha'][$i]. "', '" .$num_fact. "',
			'" .$datos['tex_concepto'][$i]. "', '" .$datos['tex_monto'][$i]. "', '" .$datos['tex_exento'][$i]. "',
			'" .$datos['tex_base'][$i]. "', '" .$datos['tex_iva'][$i]. "')";

		//echo $sql;

		$result = $psql->insertar($sql);

		if(!$result){

			return false;
		}

	}

	return true;
	
	}


/* AREA DONDE SE VERIFICAN LAS SOLICITUDES DEL CLIENTE PARA EJECUTAR LAS FUNCCIONES */


	if (isset($_POST['tex_accion']))
	{		
		if($_POST['tex_accion'] == "guardar") { 
		$result = guardar($_POST);
		} else {

			$result = editar($_POST, $_GET['id']);
		}

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
		

	} else if (isset($_POST['cargarGastosReposicion'])){

		$r = cargarGastosReposicion($_POST['id']);


		

		if(!$r){
			echo "<tr><td colspan='9'>No hay datos</td></tr>";
		} else {
			
			foreach($r as $key => $value){

			$fact = str_replace('Fact_','', str_replace('Nota_','', trim($value['num_factura'])));
				
				echo "<tr>";
				echo "<td>".trim($value['fecha_gasto'])."</td>";
				echo "<td>".$fact."</td>";
				echo "<td>".trim($value['concepto'])."</td>";
				echo "<td>".trim($value['monto'])."</td>";
				echo "<td>".trim($value['exento'])."</td>";
				echo "<td>".trim($value['base'])."</td>";
				echo "<td>".trim($value['iva'])."</td>";
				echo "<td>".trim($value['item'])."</td>";
				echo "<td><input type='radio' value='".base64_encode(trim($value['id']))."' name='rad_id'/>
					</td>";
				echo "</tr>";
			}
			//echo "";			

		}

	} else if (isset($_POST['cargarReposiciones'])){

		$r = cargarReposiciones();

		if(!$r){
			echo "<option value='-1'>No hay datos</option>";
		} else {
			
			foreach($r as $key => $value){
				echo "<option value='".$value['id']."'>".$value['fecha_reposicion']."</option>";			
	
			}
			//echo "";			

		}

	} else if (isset($_POST['cargarEdiciones'])){


		//echo "Ediciones";
		$r = cargarGastosReposicion($_POST['id']);
		require_once "cargarDatos.php";
		$items = cargarItems();
		

	

		$sel_items = "<select id='sel_item_##' name='sel_item_e[]'><option value='-1'>Seleccione...</option>";

		foreach($items as $key => $value){

		$sel_items .= "<option value='".$value['idtipos_items']."'>".$value['item']."</option>";
		}
		$sel_items .= "</select>";

		
		if(!$r){
			echo "<option value='-1'>No hay datos</option>";
		} else {
			$i=0;
			foreach($r as $key => $value){
			$i++;	

			$sel_items = str_replace('##', $i, $sel_items);

			if (trim($value['exento']) != '.00'){
				$che_exento = "checked";

			} else {
				$che_exento = "";

				}


			$fact = str_replace('Fact_','', str_replace('Nota_', '', trim($value['num_factura'])));
			
			echo "<tr id='fil_".$i."'>";
				echo "<td>$i<input type='hidden' name='id_gasto[]' value='".$value['id']."' />
					<input type='hidden' name='accion_e[]' value='0' /></td>";
				echo "<td><input value='".trim($value['fecha_gasto'])."' type='tex' name='dat_fecha_e[]'/></td>";
				echo "<td><input onblur=\"validarNota(this.value, 'fil_".$i."');\" value='".$fact."' type='text' name='tex_num_factura_e[]'/></td>";
				echo "<td><input value='".trim($value['concepto'])."' type='text' name='tex_concepto_e[]' /></td>";
				echo "<td><input placeholder='0.00' onkeyup=\"exento_e('false', 'fil_".$i."');\" required value='".trim($value['monto'])."' type='text' name='tex_monto_e[]'/></td>";
				echo "<td><input ".$che_exento." type='checkbox' name='che_exento_e[]' onclick=\"exento_e(this.checked, 'fil_".$i."'); validarNota('false', 'fil".$i."');\"></td>";
				echo "<td><input value='".trim($value['exento'])."' readonly type='text' name='tex_exento_e[]' /></td>";
				echo "<td><input value='".trim($value['base'])."' readonly type='text' name='tex_base_e[]' /></td>";
				echo "<td><input value='".trim($value['iva'])."' readonly type='text' name='tex_iva_e[]'</td>";
				echo "<td>".$sel_items."<input type='hidden' name='iditem' id='iditem_".$i."' value='".$value['iditem']."'/></td>";
				echo "<td><p onclick=\"eliminaItem_e('fil_".$i."')\" id='img_eliminar'></p>
					</td>";
				echo "</tr>";		


			}
			echo "***";

			$reposicion = cargarReposiciones($_POST['id']);

			echo $reposicion[0]['fecha_reposicion'];	
		


		}



	}





?>