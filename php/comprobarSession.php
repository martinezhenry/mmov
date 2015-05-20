<?php
/************************************************************************
*									*
*  Archivo : comprobarSession.php					*
*  Desarrollador: Henry Martinez.					*
*  Fecha: Marzo 2015.							*
*  Contenido: obtencion del identificador del usuario conectado		*
*									*
************************************************************************/


// VERIFICA LA CONEXION DEL USUARIO Y DEVUELVE EL CODIGO DEL USUARIO EN CASO DE QUE EXISTA CONEXION

require_once('../session.php');
//$session = JFactory::getSession();
//$session->set('name', "value");
if (JFactory::getUser()->id == 0){
   echo "No puede acceder a esta página sin estar logueado";
	exit();
} else {
$user = JFactory::getUser();
$idUsuario = $user->id;
//var_dump(JFactory::getUser()->id);
}


?>