<?php
require_once('public/PDF/tcpdf.php');

// Crear una instancia de TCPDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// Establecer las propiedades del documento
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('SENA');
$pdf->SetTitle('COMPROMISO');
$pdf->SetSubject('ACTA COMPROMISO');
$pdf->SetKeywords('Compromiso, SENA');

// Agregar una página
$pdf->AddPage();

// Establecer el contenido de la plantilla
$contenido = 'COMPROMISO

Fecha: ' . $data["fechaActa"] . '
Aprendiz: ' . $data["nomAprendiz"] . ' ' . $data["apeAprendiz"] . '
Especialidad: ' . $data["especialidad"] . '
Ficha: ' . $data["ficha"] . '
Instructor que remite: ' . $data["instructor"] . '
Teléfono: ' . $data["telefono"] . '
Dirección de residencia: ' . $data["direccion"] . '

Motivo remisión: ' . $data["motRemision"] . '

Descargo del Aprendiz: ' . $data["descargoApre"] . '

Compromisos Adquiridos: ' . $data["compromiso"] . '

Recomendaciones: ' . $data["recomendaciones"] . '

Firma del Instructor';

// Agregar el contenido al documento
$pdf->writeHTML($contenido, true, false, true, false, '');

// Mostrar el PDF en el navegador
$pdf->Output('acta_compromiso.pdf', 'I');
