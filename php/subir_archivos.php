<?php
var_dump($_FILES);
//tomo el valor de un elemento de tipo texto del formulario 
$cadenatexto = $_POST["cadenatexto"]; 
echo "Escribi� en el campo de texto: " . $cadenatexto . "<br><br>"; 

//datos del arhivo 
$nombre_archivo = $_FILES['userfile']['name']; 
$tipo_archivo = $_FILES['userfile']['type']; 
$tamano_archivo = $_FILES['userfile']['size']; 
//compruebo si las caracter�sticas del archivo son las que deseo 
if (!($tamano_archivo < 100000)) { 
   	echo "La extensi�n o el tama�o de los archivos no es correcta. <br><br><table><tr><td><li>Se permiten archivos .gif o .jpg<br><li>se permiten archivos de 100 Kb m�ximo.</td></tr></table>"; 
}else{ 

	//echo $_FILES['userfile']['tmp_name'];
   	if (move_uploaded_file($_FILES['userfile']['tmp_name'], '/var/www/html/mmov/uploads/'.$nombre_archivo)){ 
      	echo "El archivo ha sido cargado correctamente."; 
   	}else{ 
      	echo "Ocurri� alg�n error al subir el fichero. No pudo guardarse."; 
   	} 
} 


?>