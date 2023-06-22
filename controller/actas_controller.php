<?php
require_once "model/actas_modelo.php";
class actas_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora-master");
        }
        $this->obj=new template();
    }
    public function index() {
        $id=$_SESSION["id"];
        $this->obj->actas = actas_modelo::lista($id);
        $this->obj->tabla = "";
        foreach ($this->obj->actas as $fila) {
            $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"]; 
            $codActa        = $fila["codActa"];
            $this->obj->tabla .= "<tr>";
            $this->obj->tabla .= "<td>".$nombreCompleto."</td>"; 
            $this->obj->tabla .= "<td>".$fila["actaFicha"]."</td>";
            $this->obj->tabla .= "<td>".$fila["actaFecha"]."</td>";
            $this->obj->tabla .= "<td>".$fila["actaMotivoRemision"]."</td>";
            $this->obj->tabla .= "<td>
                <a class='btn btn-secondary' href='?controller=actas&action=generarPDFActa&codActa=".$codActa."' target='_blank'>Descargar</a>
            </td>";
            $this->obj->tabla .= "</tr>";
        }
        $this->obj->loadTemplate("actas/index");
    }
    
    public function frmActas(){
        $this->obj-> loadTemplate("actas/frmRegistrar");
    }
    public function registrar(){
        extract($_POST);
        $data["fechaActa"] = $fechaActa;
        $data["idAprendiz"] = $idAprendiz;
        $data["nomAprendiz"] = $nomAprendiz;
        $data["apeAprendiz"] = $apeAprendiz;
        $data["telAprendiz"] = $telAprendiz;
        $data["corAprendiz"] = $corAprendiz;
        $data["fichaAprendiz"] = $fichaAprendiz;
        $data["descargoApre"] = $descargoApre;
        $data["motRemision"] = $motRemision;
        $data["compromiso"] = $compromiso;
        $data["recomendaciones"] = $recomendaciones;
        $data["idFuncionario"] = $_SESSION["id"];
        $r = actas_modelo::add($data);
        if ($r) {
            echo json_encode(array("mensaje" => "Se han registrado los datos correctamente", "estado" => 1));
        } else {
            echo json_encode(array("mensaje" => "ERROR: NO se han registrado los datos", "estado" => 2));
        }
    }
    public function generarPDFActa() {
            $codActa = $_GET['codActa'];
        //Datos
        $this->obj->actas = actas_modelo::datosActa($codActa);
        $actas          = $this->obj->actas[0];
        $fechaActa      = $actas["actaFecha"];
        $nombreAprendiz = $actas["Apre_Nom"]." ".$actas["Apre_Ape"];
        $especialidad   = $actas["Pro_Desc"];
        $fichaAprendiz  = $actas["actaFicha"];
        $nombreInst     = $actas["Fun_Nom"]." ".$actas["Fun_Ape"];
        $telAprendiz    = $actas["Apre_Tel"];
        $motRemision    = $actas["actaMotivoRemision"];
        $descargoApre   = $actas["actaDescargoAprendiz"];
        $compromisos    = $actas["actaCompromisos"];
        $recomendaciones= $actas["actaRecomendaciones"];

        //Librerías
        require_once('public/PDF/tcpdf.php');
        

        // Crear una instancia de TCPDF
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        
        // Establecer las propiedades del documento
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('SENA');
        $pdf->SetTitle('COMPROMISO');
        $pdf->SetSubject('ACTA COMPROMISO');
        $pdf->SetKeywords('Compromiso, SENA');
        
        // remove default header/footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);

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

        // set font
        $pdf->SetFont('Helvetica', 'B', 16);

        // add a page
        $pdf->AddPage();

        //Encabezado LogoSimbolo
        $pdf->SetY(10); // Ajusta el valor según tus necesidades
        $pdf->Image('public/img/LogosimboloNobg.jpg', 15, 10, 60, 0, '', '', 'T', false, 300, '', false, false, 0, false, false, false);
        $pdf->SetY(30);
        // set some text to print
        $txt = <<<EOD
        Acta de Compromiso

        EOD;
        $pdf->Cell(0, 10, $txt, 0, 1, 'C');
        $pdf->Write(0, " ", '', 0, 'C', true, 0, false, false, 0);
        // Establecer el contenido de la plantilla
        $pdf->SetFont('Helvetica', '', 12);
        $pdf->SetDrawColor(255, 255, 255);
        $pdf->SetTextColor(0, 0, 0);
        //Línea 1
        $left_column = '<b>Fecha: </b><span style="text-transform: capitalize">'.$fechaActa.'</span>';

        $right_column = '<b>Nombre Aprendiz: </b><span style="text-transform: capitalize">'.$nombreAprendiz.'</span>';

        // writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true
        // get current vertical position
        $y = $pdf->getY();
        // set color for background
        // set color for text
        // write the first column
        $pdf->writeHTMLCell(50, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        // write the second column
        $pdf->writeHTMLCell(110, '', '', '', $right_column, 0, 0, 0, true, 'J', true);
        //Linea 2
        $left_column = '<b>Especialidad: </b><span style="text-transform: capitalize">'.$especialidad.'</span>';
        $y +=10;
        // write the first column
        $pdf->writeHTMLCell(140, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        // write the second column
        
        $right_column = '<b>Ficha: </b><span style="text-transform: capitalize">'.$fichaAprendiz.'</span>';
        $pdf->writeHTMLCell(60, '', '', '', $right_column, 0, 0, 0, true, 'J', true);

        //Línea 3
        $left_column = '<b>Instructor que remite: </b><span style="text-transform: capitalize">'.$nombreInst.'</span>';
        $y +=10;
        $pdf->writeHTMLCell(160, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        //Línea 4
        $y +=10;
        $left_column = '<b>Teléfono Aprendiz: </b><span style="text-transform: capitalize">'.$telAprendiz.'</span>';
        $right_column = '<b>Dirección Aprendiz: </b><span style="text-transform: capitalize">'." ".'</span>';
        $pdf->writeHTMLCell(80, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        $pdf->writeHTMLCell(90, '', '', '', $right_column, 0, 0, 0, true, 'J', true);

        //Línea 5
        $y +=10;
        $left_column = '<b>Motivo de Remisión: </b><span style="text-transform: capitalize">'.$motRemision.'</span>';
        $pdf->writeHTMLCell(200, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        $y += $pdf->getLasth() + 10; 

       // Línea 6
        $left_column = '<b>Descargo Aprendiz: </b><br><span style="text-transform: capitalize">'.$descargoApre.'</span>';
        $pdf->writeHTMLCell(180, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        $y += $pdf->getLasth() + 10; // Incremento de 10

        // Línea 7
        $left_column = '<b>Compromisos Adquiridos: </b><br><span style="text-transform: capitalize">'.$compromisos.'</span>';
        $pdf->writeHTMLCell(180, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        $y += $pdf->getLasth() + 10;  // Incremento de 10

        // Línea 8
        $left_column = '<b>Recomendaciones: </b><br><span style="text-transform: capitalize">'.$recomendaciones.'</span>';
        $pdf->writeHTMLCell(180, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
        $y += $pdf->getLasth() + 10;  // Incremento de 10

        //Firmas
        // Establecer la posición vertical para el pie de página
        $pdf->SetY(-40); 
        // Agregar el texto de las firmas
        $pdf->Cell(60, 10, 'Firma del Instructor:', 0, 0, 'L');
        $pdf->Cell(60, 10, 'Firma del Aprendiz:', 0, 0, 'C');
        $pdf->Cell(60, 10, 'Firma Bienestar:', 0, 0, 'R');

        $y = $pdf->GetY();
        $pdf->SetDrawColor(0, 0, 0); // Color negro
        // Agregar líneas para las firmas
        $pdf->Line(15, $y - 1, 75, $y -1); // Línea para la firma del instructor
        $pdf->Line(80, $y -1, 140, $y - 1); // Línea para la firma del aprendiz
        $pdf->Line(145, $y -1, 205, $y -1); // Línea para la firma del bienestar

        // reset pointer to the last page
        $pdf->lastPage();

        // Descargar el PDF
        $pdf->Output('acta_compromiso.pdf', 'I');
      }
      
    
    
}
?>