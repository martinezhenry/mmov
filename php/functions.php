<?php




if (isset($_POST['cargarDTI'])){
$arr = cargarDTI($_POST['idPdv']);

echo json_encode($arr);
exit();
}
else if (isset($_POST['cargarPDV']) )
{
	$arr2 = cargarPDV();

	//print_r($arr2);

	//$a  = array('hola' => 1);


	$salida = json_encode($arr2);

	//var_dump($salida);

	if ($salida){
	echo  $salida;

	} else{
		echo "error json";
	}
	exit();
}



function conexion(){

	$conex = mysql_connect("localhost","mmov","12345");
	if(!$conex){
		return false;
	} else {
		mysql_set_charset('utf8',$conex);
		$bd = mysql_select_db("mmov_dw");
		return $conex;
	}

}


function desconectar($conn){
	mysql_close($conn);
}


function cargarDTI($idruta){

	$sql = "select idDTI, nombre from dti where ruta_idruta= '". $idruta . "'";

	$conex = conexion();

	$st = mysql_query($sql, $conex);

	while($fila = mysql_fetch_array($st)){
		$filas[] = $fila;
	}
	desconectar($conex);
	unset($st);
	return $filas;

}

function cargarPDV(){

	$sql2 = "select ruta_idruta, nombre from pdv";

	
	$conex2 = conexion();

	$st2 = mysql_query($sql2, $conex2);

	while($fila2 = mysql_fetch_array($st2)){
		$filas2[] = $fila2;
	}
	mysql_close($conex2);
	unset($st2);
	return $filas2;


}





?>