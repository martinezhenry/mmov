

<hr class="my_line" />
<h3 style="color: #154d71; border-bottom: 3px solid #1f73a8;">Datos del Cheque</h3>
<form class="my_form" action="#" method="POST">
<p class="my_p"><label>Fecha Devolución</label></p>
<input class="my_input" required="" type="date" /><br />
<p class="my_p"><label>Banco Emisor</label></p>
<input class="my_input" required="" type="text" /><br />
<p class="my_p"><label>Numero de Cheque</label></p>
<input class="my_input" required="" type="number" /><br />
<p class="my_p"><label>Monto</label></p>
<input class="my_input" required="" step="0.01" type="number" /><br />
<p class="my_p"><label>PDV</label></p>
<select onchange="cambio();" class="my_input" required="">
<option value="-1">Seleccione...</option>
<option value="1">1</option>
<option value="2">2</option>
</select><br />
<p class="my_p"><label>Vendedor</label></p>
<select class="my_input" required="">
<option value="-1">Seleccione...</option>
<option value="1">1</option>
<option value="2">2</option>
</select><br />
<h3 style="color: #154d71; border-bottom: 3px solid #1f73a8;">Datos de Reposición</h3>
<p class="my_p"><label>Banco</label></p>
<input class="my_input" type="text" /><br />
<p class="my_p"><label>Forma de Pago</label></p>
<select class="my_input">
<option>Efectivo</option>
<option>Transferencia</option>
<option>Cheque</option>
<option>Debito</option>
<option>Credito</option>
</select><br />
<p class="my_p"><label>Numero de Cheque</label></p>
<input class="my_input" type="number" /><br />
<p class="my_p"><label>Numero de Voucher</label></p>
<input class="my_input" type="number" /><br />
<p class="my_p"><label>Monto</label></p>
<input class="my_input" step="0.01" type="number" /><br />
<p class="my_p"><label>Fecha</label></p>
<input class="my_input" type="date" /><br /><hr class="my_line" />
<input style="color: #b6e3ff; background: url('templates/travelagent/images/menu.gif') center;" type="submit" value="Guardar" />
</form>

<script>

function cambio(){
	alert('cambio');
}

</script>

<?php 



?>


<?php 

function cargarPDV(){

	$array = ["hola", "hola2"];
	return $array;

}

echo "<select class='my_input'>";
$arr = cargarPDV();
foreach ($arr as $key => $value) {
 	echo "<option>".$value."</option>";
 }
 echo "</select>";

?>

