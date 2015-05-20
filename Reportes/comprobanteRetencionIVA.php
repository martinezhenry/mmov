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
require_once '../php/conexionPostgresql.php';

$psql = new Conexion();

$sql = "select * from empresas";


$filas = $psql->consulta($sql);



//$rif_agente = "J-29511634-9";
$rif_agente = $filas[0]['rif'];

//$agente_retencion = "MINUTO MOVIL, C.A.";

$agente_retencion = $filas[0]['nombre'];

//$direc_agente = "AV. ALIRIO UGARTE PELAYO, CC PETRORIENTE, OFICINA 01N05- MATURIN";


$direc_agente = $filas[0]['direccion_principal'];



//$tlf_agente = "0291-3275100";

$tlf_agente = $filas[0]['telefono_principal'];

if (isset($_GET['pag'])){

require "../php/egresos_administrativos.php";

if (isset($_GET['egre'])){
	$items = cargarRetencionesIVA(base64_decode($_GET['pag']), base64_decode($_GET['pag']));
} else{

$items = cargarRetencionesIVA(base64_decode($_GET['pag']));
}

//var_dump(base64_decode($_GET['pag']));


if (is_array($items)){
$i = 0;

$total = 0;


foreach ($items as $key => $value){
$i++;
	$cuerpo = "<tr>";
	$cuerpo .= "<td>".$i."</td>";
	$cuerpo .= "<td>".$value['fecha_fact']."</td>";
	$cuerpo .= "<td>".$value['num_factura']."</td>";
	$cuerpo .= "<td>".$value['num_control']."</td>";
	$cuerpo .= "<td></td>";
	$cuerpo .= "<td></td>";
	$cuerpo .= "<td></td>";
	$cuerpo .= "<td>".$value['monto_con_iva']."</td>";
	$cuerpo .= "<td>".$value['base_imponible']."</td>";
	$cuerpo .= "<td>".$value['monto_exencion']."</td>";
	$cuerpo .= "<td>".$value['porc_aplicado']."%</td>";
	$cuerpo .= "<td>".$value['iva']."</td>";
	$cuerpo .= "<td>".$value['porc_retencion']."%</td>";
	$cuerpo .= "<td>".$value['iva_retenido']."</td>";
	$cuerpo .= "</tr>";

$rif_proveedor = $value['rif_proveedor'];
$proveedor = $value['proveedor'];
$fecha_retencion = $value['fecha_retencion'];
$r = explode("/", $fecha_retencion);

$año = $r[2];
$mes = $r[1];
$num_comprobante = $año."-".$mes."-".$value['numero'];

$total = $total + ($value['iva_retenido']);

}
$total = number_format($total, 2, '.', ',');

} else {
	$cuerpo = "<tr><td style=\"text-align:center;\" colspan=\"14\">No hay Facturas</td></tr>";
$rif_proveedor = "";
$proveedor = "";
$fecha_retencion = "";
$año = "";
$mes = "";
$num_comprobante = "";
$total = '';
}

} else {


	$cuerpo = "<tr><td style=\"text-align:center;\" colspan=\"14\">No hay Facturas</td></tr>";
$rif_proveedor = "";
$proveedor = "";
$fecha_retencion = "";
$año = "";
$mes = "";
$num_comprobante = "";
$total = '';


}


// Include the main TCPDF library (search for installation path).
//require_once('../tcpdf/examples/tcpdf_include.php');
require_once('../tcpdf/tcpdf.php');

// create new PDF document
$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('Minuto Movil C.A.');
$pdf->SetAuthor('Minuto Movil C.A.');
$pdf->SetTitle('Comprobante de Pago');
$pdf->SetSubject('Comprobante de Pago ');
$pdf->SetKeywords('cheque, monto, beneficiario, comprobante, pago');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.'', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));



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
$pdf->SetFont('dejavusans', '', 9, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));




// Set some content to print
$html = <<<EOD

<!-- <h3 style="text-align:center;">Comprobante de Retención<br>Impuesto al Valor Agregado</h3> -->

<br/>
<label style="text-align:center;">COMPROBANTE DE RETENCIÓN IMPUESTO AL VALOR AGREGADO  I.V.A</label><br/>
<label style="font-size:9px;">
LEY DEL IVA ART. 11 " Serán Responsables del pago del Impuesto en calidad de Agente de Retención, los compradores o Adquirientes de determinados Bienes Muebles y Receptores de Ciertos Servicios a Quienes la Administración Designe como tal"</label>

<br/>
<br/>
<label style="text-align:right;">Nro Comprobante: <b>$num_comprobante</b></label><br>
<label style="text-align:right;">Periodo Fiscal:	Año: <b>$año</b>	Mes: <b>$mes</b></label><br>
<label style="text-align:right;">Fecha: <b>$fecha_retencion</b> </label>

<br>

<label>Nombre del Agente de Retención: <b>$agente_retencion</b> </label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<label>R.I.F: <b>$rif_agente</b></label>
<br>
<label>Dirección del Agente de Retención: <b>$direc_agente</b></label>
<br>
<label style="text-align:right;">Tlf: <b>$tlf_agente</b></label>
<br>
<label>Nombre del Proveedor: <b>$proveedor</b></label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 <label style="text-align:right;">R.I.F: <b>$rif_proveedor</b></label>
<br>
<br>
<br>


<table border="0" style="font-size:10px; text-align:center;">
	<thead>
		<tr  style="text-align:center; font-weight: bold;">
			<th style="border: 1px solid black;">Nro</th>
			<th style="border: 1px solid black;" colspan="3">Factura</th>
			<th style="border: 1px solid black;" rowspan="2">Nro Nota de Debito</th>
			<th style="border: 1px solid black;" rowspan="2">Nro Nota de Crédito</th>
			<th style="border: 1px solid black;" rowspan="2">Nro Factura Afectada</th>
			<th style="border: 1px solid black;" rowspan="2">Compras con IVA</th>
			<th style="border: 1px solid black;" rowspan="2">Base Imponible</th>
			<th style="border: 1px solid black;" rowspan="2">Compras Exentas</th>
			<th style="border: 1px solid black;" rowspan="2">% Aplic.</th>
			<th style="border: 1px solid black;" rowspan="2">Impuesto I.V.A.</th>
			<th style="border: 1px solid black;" rowspan="2">% Ret.</th>
			<th style="border: 1px solid black;" rowspan="2">I.V.A. Retenido</th>

		</tr>
		<tr  style="text-align:center; font-weight: bold;">
			<th style="border: 1px solid black;">Op.</th>
			<th style="border: 1px solid black;">Fecha</th>
			<th style="border: 1px solid black;">Numero</th>
			<th style="border: 1px solid black;">Nro. de Control</th>
		</tr>

	</thead>

<tbody>
$cuerpo
<tr><td colspan="13" style="text-align:right;"><b>Total Retenido: </b></td><td>$total</td></tr>
</tbody>

</table>





EOD;

$texto = '

<table style="text-align: center; margin: 0 auto;">
	<tr>
		<td>______________________________</td>
		<td>______________________________</td>

	</tr>
	<tr>
		<td>AGENTE DE RETENCIÓN<br>(SELLO, FECHA, FIRMA)</td>
		<td>RECIBIDO POR<br>(SELLO, FECHA, FIRMA)</td>
	</tr>
</table>
';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', utf8_encode($html), 0, 1, 0, true, '', true);

$pdf->SetXY(15, 170);

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', utf8_encode($texto), 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('comprobanteIVA', 'I');

//============================================================+
// END OF FILE
//============================================================+