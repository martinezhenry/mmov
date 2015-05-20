<?php

	 function conectar(){
		 $user = 'mmov';
		 $pass = 'mmov01';
		$host = '190.77.112.85';
		 $db   = 'mmov';
		$port = '5432';
		 $conex;
		 $error;


			$strCnx = "host=" . $host . " port=" . $port . " dbname=". $db ." user=" 
					 . $user . " password=" . $pass;
			return pg_connect($strCnx) or die ("Error de conexion. ". pg_last_error());
			
		}


	echo "inicia prueba";


	$conex = conectar();

	if(!$conex){
	echo "no se establecio la conexion.";
} else {
	echo "conectado";
	pg_close($conex);


}


?>