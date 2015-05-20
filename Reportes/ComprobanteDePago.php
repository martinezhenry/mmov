<?php
//============================================================+
// File name   : example_001.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 001 for TCPDF class
//               Default Header and Footer
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Default Header and Footer
 * @author Nicola Asuni
 * @since 2008-03-04
 */


if (isset($_GET['pag'])){

require "../php/egresos_administrativos.php";

$egresos = cargarEgresos(base64_decode($_GET['pag']));


if (!$egresos){

$v_fecha = "";
$v_monto = "";
$v_beneficiario = "";
$v_cuenta = "";
$v_num_cheque = "";
$v_unidad = "";
$v_banco = "";
$v_tipo_gastos = "";
$v_concepto = "";
$v_elaborado = "";

	

} else {

foreach($egresos as $key => $value){

$v_fecha = $value['fecha'];
$v_monto = $value['monto'];
$v_beneficiario = $value['receptor'];
$v_cuenta = $value['cuenta'];
$v_num_cheque = $value['num_cheque'];
$v_unidad = "";
$v_banco = $value['banco'];
$v_tipo_gastos = $value['categoria'];
$v_concepto = $value['concepto'];
$v_elaborado = $value['emisor'];

}


}



}

/*
$v_fecha = (isset($_POST['f'])) ? $_POST['f']:"";
$v_monto = (isset($_POST['m'])) ? $_POST['m']:"";
$v_beneficiario = (isset($_POST['b'])) ? $_POST['b']:"";
$v_cuenta = (isset($_POST['c'])) ? $_POST['c']:"";
$v_num_cheque = (isset($_POST['nc'])) ? $_POST['nc']:"";
$v_unidad = (isset($_POST['u'])) ? $_POST['u']:"";
$v_banco = (isset($_POST['ba'])) ? $_POST['ba']:"";
$v_tipo_gastos = (isset($_POST['g'])) ? $_POST['g']:"";
$v_concepto = (isset($_POST['co'])) ? $_POST['co']:"";
*/


// Include the main TCPDF library (search for installation path).
//require_once('../tcpdf/examples/tcpdf_include.php');
require_once('../tcpdf/tcpdf.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('Minuto Movil C.A.');
$pdf->SetAuthor('Minuto Movil C.A.');
$pdf->SetTitle('Comprobante de Pago');
$pdf->SetSubject('Comprobante de Pago');
$pdf->SetKeywords('cheque, monto, beneficiario, comprobante, pago');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.'', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
//$pdf->SetHeaderData('', '', 'Corporación Estelio C.A', '');

//$pdf->


$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 14, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));







/*




*/



// Set some content to print
$html = <<<EOD

<style>

.piso {

border-bottom: 1px solid black;

}

table {
font-size:10px;
width:100%;

}



table tr td {

 padding:0px;

 margin :0;



}


.otra {

width: 10px;
border-bottom: 1px solid black;
margin : 0;
padding : 10;
height : 25px;
margin-right: 10px;

}



</style>






<h4 style="text-align:center;">Comprobante de Pago</h4>

<br/>
<table border="0" width="100%"  cellspacing="2" cellpadding="2">
	<tr>
		<td valign="bottom"  width="15%" ><b>Fecha: </b></td> <td width="35%" class="piso">$v_fecha</td>
		<td width="20%" align="right" ><b>Monto: </b></td> <td width="30%" class="piso">$v_monto</td>
	</tr>
	<tr><td colspan="4"></td></tr>
	<tr>
		<td ><b>Benefeciario: </b></td> <td colspan="3" class="piso">$v_beneficiario</td>
	</tr>
	<tr><td colspan="4"></td></tr>
	<tr>
		<td ><b>Num. Cuenta: </b></td> <td class="piso">$v_cuenta</td>
		<td align="right" ><b>Num. Cheque/Trans: </b></td> <td class="piso">$v_num_cheque</td>
	</tr>
	<tr><td colspan="4"></td></tr>
	<tr>
		<td ><b>Unidad: </b></td> <td class="piso">$v_unidad</td>
		<td align="right"><b>Banco: </b></td> <td class="piso">$v_banco</td>
	</tr>
	<tr><td colspan="4"></td></tr>
	<tr>
		<td ><b>Tipos de Gastos: </b></td> <td colspan="3" class="piso">$v_tipo_gastos</td>

	</tr>
	<tr><td colspan="4"></td></tr>
	<tr>
		<td ><b>Concepto: </b></td> <td colspan="3" class="piso">$v_concepto</td>
	</tr>

</table>

<br>
<div style="width: 100%; height: 25%; border: 1px solid black; ">
<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<br>

<table border="1">
	<tr bgcolor="#939393">
		<td colspan="4"><b>Recibido Por: </b></td>
	</tr>
	<tr bgcolor="#E8E8E8">
		<td ><b>Fecha</b></td>
		<td><b>Nombre y Apellido</b></td>
		<td><b>Cedula de Identidad</b></td>
		<td><b>Firma</b></td>
	</tr>
	<tr>
		<td style="height:30px;"></td>
		<td style="height:30px;"></td>
		<td style="height:30px;"></td>
		<td style="height:30px;"></td>

	</tr>
</table>
<br><br>
<table border="1">

	<tr bgcolor="#939393">

		<td ><b>Elaborado Por: </b></td>
		<td ><b>Fecha</b></td>
		<td ><b>Solicitado Por: </b></td>
		<td ><b>Aprobado Por:</b></td>
	</tr>
	<tr >
		<td style="height:30px;"><b>$v_elaborado</b></td>
		<td style="height:30px;"><b>$v_fecha</b></td>
		<td style="height:30px;"></td>
		<td style="height:30px;"></td>

	</tr>
</table>


EOD;

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('example_001.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+