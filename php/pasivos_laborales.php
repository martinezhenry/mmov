<?php
/************************************************************************
*									*
*  Archivo : pasivos_laborales.php					*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar y consultar datos para el proceso	*
*	      de pasivos laborales MMOV					*
*									*
************************************************************************/


/* FUNCTION PARA ALAMCENAR LOS DATOS INGRESADOS POR EL USUARIO EN LA DB
	RETURN : BOOLEAN	 
*/
function guardarDatos($datos){




		require "conexionPostgresql.php";
		$psql = new Conexion();

		$r = explode('*', $datos['sel_empleado']);

		$empleado = $r[0];
		$persona = $r[1];
	
		$sql = 'insert into pasivos_laborales (empleados_idempleados, empleados_personas_idpersonas, fecha, sueldos,
			comisiones, bono_vacacional, utilidades, dias_salario)
		values (\'' .$empleado. '\', \'' .$persona. '\', \'01/' .$datos['dat_mes']. '\',
		 \'' .$datos['tex_sueldo']. '\',
			\'' .$datos['tex_comision']. '\', \'' .$datos['tex_vacacional']. '\', \'' .$datos['tex_utilidades']. '\', \'' .$datos['tex_dias']. '\')';


echo $sql;
		$filas = $psql->insertar($sql);

		if(!$filas){
			return false;
		}

		return $filas;


}

/* FUNCTION PARA CONSULTAR LOS PASIVOS LABORALES ALMACENADOS 
	RETURN : ARRAY
*/
function cargarPasivos($id = null){

	if ($id == null){

		$sql = "select to_char(a.fecha, 'MM/YYYY') as mes, a.sueldos as salario, a.comisiones as comision, a.bono_vacacional as bono,
	a.utilidades as utilidades, a.dias_salario as dias, b.nombre || ' ' || b.apellido as empleado
	from pasivos_laborales a, personas b where a.empleados_personas_idpersonas = b.idpersonas";

	} else{
		$sql = "select to_char(a.fecha, 'MM/YYYY') as mes, a.sueldos as salario, a.comisiones as comision, a.bono_vacacional as bono,
		a.utilidades as utilidades, a.dias_salario as dias, b.nombre || ' ' || b.apellido as empleado
		from pasivos_laborales a, personas b where a.empleados_personas_idpersonas = b.idpersonas and idpasivos_laborales = '$id'";

	}

	require "conexionPostgresql.php";
		$psql = new Conexion();
	$filas = $psql->consulta($sql);
	return $filas;



}

	
/* AREA QUE VERIFICA LAS SOLICITUDES DEL USUARIO PARA EJECUTAR LAS ACCIONES. */

	if ( isset($_POST['tex_accion']) ) {

		if ($_POST['tex_accion'] == "guardar"){
	
		$r = guardarDatos($_POST);

		} else {
		$r = editarDatos($_POST);

		}
		
		if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}


	} else if (isset($_POST['cargarPasivos'])){

		
	$r = cargarPasivos();
	
	if (!$r){ echo "-1"; } else { echo json_encode($r); }



	}

?>