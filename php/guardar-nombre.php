<?php

if (isset($_POST['txt_name']))

{

echo $_POST['txt_name'];

echo "//<script>  setTimeout('location.href=../index.php/cargar-datos', 5000); alert('v');
	
 </script>

<META HTTP-EQUIV='Refresh' CONTENT='5; URL=../index.php/cargar-datos'> 

 ";

} else

{

echo "no tiene variable";

var_dump($_POST);

}

?>