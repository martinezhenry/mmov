<?php

var_dump($_POST);
function guardarDatos($datos){




		require "conexionPostgresql.php";
		$psql = new Conexion();

		$r = explode('*', $datos['sel_empleado']);

		$empleado = $r[0];
		$persona = $r[1];
	
		$sql = 'insert into pasivos_laborales (empleados_idempleados, empleados_personas_idpersonas, fecha, sueldos,
			comisiones, bono_vacacional, utilidades, dias_salario)
		values (\'' .$empleado. '\', \'' .$persona. '\', \'' .$datos['dat_mes']. '-01\',
		 \'' .$datos['tex_sueldo']. '\',
			\'' .$datos['tex_comision']. '\', \'' .$datos['tex_vacacional']. '\', \'' .$datos['tex_utilidades']. '\', \'' .$datos['tex_dias']. '\')';


echo $sql;
		$filas = $psql->insertar($sql);

		if(!$filas){
			return false;
		}

		return $filas;


}


	
	if ( isset($_POST['tex_sueldo']) ) {
	
		$r = guardarDatos($_POST);
		
		if ($r){
		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');
	} else {
	//exit();
			header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=8');
	}


	}

?>