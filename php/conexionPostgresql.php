<?php

/************************************************************************
*									*
*  Archivo : conexionPostgresql.php					*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Clase para establecer las comunicaciones entre la DB
		 postgresql y los datos					*
*									*
************************************************************************/



	class Conexion {


		private $user = 'mmov';
		private $pass = 'mmov01';
		private $host = 'minutomovil.ddns.net';
		private $db   = 'prod_mmov';
		private $port = '5432';
		public $conex;
		public $error;

		/* FUNCTION PARA ESTABLECER LA CONEXION CON LA DB */

		private function conectar(){

			if (!isset($this->conex)) {
			$strCnx = "host=" . $this->host . " port=" . $this->port . " dbname=". $this->db ." user=" 
					 . $this->user . " password=" . $this->pass;
			return	$this->conex = pg_connect($strCnx) or die ("Error de conexion. ". pg_last_error());
			} else {
				return 2;
			}

		}

		/* FUNCTION PARA DESCONECTARSE DE LA DB POSTGRESQL */
		function desconectar(){
			pg_close($this->conex);
			unset($this->conex);
		}

		function liberarResult($res){

			if (isset($res)) $r = pg_free_result($res); else {
			 $this->error = "No ingreso Parametro";
			 return false;
			}
			if ($r){ return true; } else {  $this->error = "Error al liberar memoria"; return false; }
 
		}


		/* FUNCTION QUE EJECUTA LAS CONSULTAS DE LA DB */
		function consulta($sql){
			$this->conectar();

			//$query = "select idbancos, nombre_completo from bancos";

			$resultado = pg_query($sql) or die("Error en la Consulta SQL: " . pg_last_error($this->conex));

			$numReg = pg_num_rows($resultado);

			if($numReg>0){

			while ($fila=pg_fetch_array($resultado)) {
				$filas[] = $fila;
			}
			              
			}else{
			            return false;

			}

			$this->liberarResult($resultado);
			$this->desconectar();
			unset($numReg, $resultado, $fila);
			return $filas;
		}

		/* FUNCTION PARA EJECUTAR LOS QUERY PARA INGRESAR LOS NUEVOS DATOS */
		function insertar($sql){
			$this->conectar();

			//$query = "select idbancos, nombre_completo from bancos";

			$resultado = pg_query($sql) or die("Error en el insert SQL: " . pg_last_error($this->conex));

			//$numReg = pg_num_rows($resultado);

			if($resultado){
			//$this->liberarResult($resultado);
			$this->desconectar();
			unset($resultado);
			//return $filas;
			return true;
			              
			}else{
			            return $resultado;

			}

			


		}




	}


 ?>
