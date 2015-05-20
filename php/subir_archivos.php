<?php

/************************************************************************
*									*
*  Archivo : subir_archivos.php						*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: Metodos para almacenar los archivos en el servidor	*
*									*
************************************************************************/


// SE CAPTURA LOS DATOS ENVIADO POR EL FORMULARIO

$nombre_archivo = $_FILES['userfile']['name']; 
$tipo_archivo = $_FILES['userfile']['type']; 
$tamano_archivo = $_FILES['userfile']['size']; 
$id = $_POST['sel_proceso'];

	// SE CONECTA A LA BD

	require_once('conexionPostgresql.php');

	$psql = new Conexion();

	$sql = "select ubicacion_web, extension, prefijo, nombre from archivos where idarchivos = '".$id."'";

	// SE EJECUTA LA CONSULTA
	$filas = $psql->consulta($sql);
	
	if (!$filas){
		echo "ERROR al consultar los datos del proceso";
		exit();
	} else {

		$ubicacion = $filas[0]['ubicacion_web'];
		$prefijo = $filas[0]['prefijo'];
		$extension = $filas[0]['extension'];
		$nombre = $filas[0]['nombre'];

	}
		
// SE PREPARA EL NOMBRE DEL ARCHIVO
$nombre_asignado = $prefijo.date('d-m-Y').'_'.$nombre.'.'.$extension;

	

//compruebo si las características del archivo son las que se desean

if (!($tamano_archivo < 1000000)) { 
   	echo "La extensión o el tamaño de los archivos no es correcta. <br><br><table><tr><td>se permiten archivos de 1 MB máximo.</td></tr></table>"; 
}else{ 

	

	// SE ALMACENA EL ARCHIVO A LA UBICACION DESTINADA
   	if (move_uploaded_file($_FILES['userfile']['tmp_name'], $ubicacion.$nombre_asignado)){ 
      	echo "El archivo ha sido cargado correctamente."; 
	// SE CREA UN REGISTRO DE LA CARGA DEL ARCHIVO
	$sql = "insert into archivos_subidos (nombre_original, nombre_asignado, archivos_idarchivos, extension) values 
		('".$nombre_archivo."', '".$nombre_asignado."', '".$id."', '".$tipo_archivo."')";

	$filas = $psql->insertar($sql);
	
	if (!filas){
		echo "ERROR al ingresar los datos del archivos";
		exit();
	} else {

		header ('location: ' . $_SERVER['HTTP_REFERER'] . '?view=article&id=7');

	}

	
   	}else{ 
      	echo "Ocurrió algún error al subir el fichero. No pudo guardarse."; 
   	} 
} 





?>