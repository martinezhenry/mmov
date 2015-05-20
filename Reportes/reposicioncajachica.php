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

require "../php/reposicion_caja_chica.php";



$gastos = cargarGastosReposicion($_GET['pag']);


$fecha = $_GET['f'];

if (!$gastos){

$cuerpo = "<tr><td style=\"text-align:center;\" colspan=\"8\">".base64_decode($_GET['pag'])."</td></tr>";
$t_monto = "";
$t_exento = "";
$t_base = "";
$t_iva = "";
$disponible = "";
$monto_asig = "";
	

} else {


require_once '../php/conexionPostgresql.php';

$psql = new Conexion();

$sql = "select * from caja_chica";

$filas = $psql->consulta($sql);

$cuerpo = "";
$i=0;
//$monto_asig = 10000;

$monto_asig = $filas[0]['cantidad_fondo'];

$t_monto = 0.00;
$t_exento = 0.00;
$t_base = 0.00;
$t_iva = 0.00;

foreach($gastos as $key => $value){
$i++;

$fact = str_replace('Fact_','',str_replace('Nota_','', $value['num_factura']));


$cuerpo .= "<tr>";
$cuerpo .= "<td width=\"5%\" style=\" border-right:1px solid black;\">".$i."</td>";
$cuerpo .= "<td width=\"10%\" style=\"border-right:1px solid black;\">".$value['fecha_gasto']."</td>";
$cuerpo .= "<td width=\"10%\" style=\"border-right:1px solid black;\">".$fact."</td>";
$cuerpo .= "<td width=\"30%\" style=\"border-right:1px solid black;\">".$value['concepto']."</td>";
$cuerpo .= "<td width=\"15%\" style=\"border-right:1px solid black;\">".number_format($value['monto'], 2, '.', ',')."</td>";
$cuerpo .= "<td width=\"10%\" style=\"border-right:1px solid black;\">".number_format($value['exento'], 2, '.', ',')."</td>";
$cuerpo .= "<td width=\"10%\" style=\"border-right:1px solid black;\">".number_format($value['base'], 2, '.', ',')."</td>";
$cuerpo .= "<td width=\"10%\" style=\"border-right:1px solid black;\">".number_format($value['iva'], 2, '.', ',')."</td>";
$cuerpo .= "</tr>";


$t_monto = $t_monto + $value['monto'];
$t_exento = $t_exento + $value['exento'];
$t_base = $t_base + $value['base'];
$t_iva = $t_iva + $value['iva'];


}

$disponible = $monto_asig - $t_monto;
$disponible = number_format($disponible, 2, '.', ',');
$monto_asig = number_format($monto_asig, 2, '.', ',');
$t_monto =  number_format($t_monto, 2, '.', ',');
$t_exento =  number_format($t_exento, 2, '.', ',');
$t_base =  number_format($t_base, 2, '.', ',');
$t_iva =  number_format($t_iva, 2, '.', ',');

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











.tabla {


border : 1px solid black;
text-align: center;
font-size : 10px;


}



.columna:odd {


background : red;


}





</style>






<h4 style="text-align:center;">Reposición de Fondo de la Caja Chica</h4>

<br/>

<label><b>Fecha:</b> $fecha</label> 

<br><br>

<table class="tabla" border="0"   cellspacing="0" cellpadding="0">
	<thead>
		<tr>
		<th width="5%" style="border-right:1px solid black; height:20px;" ><b>Item</b></th>
		<th width="10%" style="border-right:1px solid black;" ><b>Fecha</b></th>
		<th width="10%" style="border-right:1px solid black;"><b>N° Factura</b></th>
		<th width="30%" style="border-right:1px solid black;"><b>Concepto</b></th>
		<th width="15%" style="border-right:1px solid black;" ><b>Monto</b></th>
		<th width="10%" style="border-right:1px solid black;"><b>Exento</b></th>
		<th width="10%" style="border-right:1px solid black;" ><b>Base</b></th>
		<th width="10%" style="border-right:1px solid black;" ><b>IVA</b></th>


		</tr>
		
	</thead>
<tbody>
$cuerpo





</tbody>

</table>

<br><br>

<table class="tabla">



<tr>
<td width="55%" style="text-align: right; border-right:1px solid black;" colspan="4"><b>Totales </b></td>
<td width="15%" style="border-right:1px solid black;">$t_monto</td>
<td width="10%" rowspan="3" style="border-right:1px solid black;">$t_exento</td>
<td width="10%" rowspan="3" style="border-right:1px solid black;">$t_base</td>
<td width="10%" rowspan="3" style="border-right:1px solid black;">$t_iva</td>
</tr>
<tr>
<td style="text-align: right; border-right:1px solid black;" colspan="4"><b>Monto Asignado </b></td>
<td style="border-right:1px solid black;">$monto_asig</td>
</tr>

<tr>
<td width="55%" style="text-align: right; border-right:1px solid black;" colspan="4"><b>Disponible Actual </b></td>
<td style="border-right:1px solid black;" >$disponible</td>
</tr>


</table>


EOD;

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', utf8_encode($html), 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('reposicionCajaChica.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+