<?php

$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
echo $hostname;


echo "<br>";

$nombres_sistema = posix_uname();
foreach ($nombres_sistema as $id => $nombre)
echo "

$id : $nombre

";



echo "<br>";
$uid = posix_getuid();
$info_usuario = posix_getpwuid ($uid);
foreach ($info_usuario as $id => $usuario)
echo "

$id : $usuario

";

echo "<br>";


$ip = $_SERVER['REMOTE_ADDR'];
echo $ip;


echo "<br>";


$navigator = $_SERVER['HTTP_USER_AGENT'];
echo $navigator;


echo "<br>";
echo $_SERVER['HTTP_USER_AGENT'] . "\n\n";
$navegador = get_browser(null, true);
print_r($navegador);

?>