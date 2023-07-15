<?php
require 'vendor/autoload.php';
require_once "model/Atencion_modelo.php";
use Carbon\Carbon;
class Atencion_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $id=$_SESSION["id"];
        $this->obj->llamadosAtencion = Atencion_modelo::lista($id);
        $this->obj->tabla = "";
        foreach ($this->obj->llamadosAtencion as $fila) {
            $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"]; 
            $codLlamado        = $fila["codLlamado"];
            $this->obj->tabla .= "<tr>";
            $this->obj->tabla .= "<td>".$nombreCompleto."</td>"; 
            $this->obj->tabla .= "<td>".$fila["atencionFecha"]."</td>";
            $this->obj->tabla .= "<td>".$fila["llamadoFicha"]."</td>";
            $this->obj->tabla .= "<td>".$fila["llamadoMotivo"]."</td>";
            $this->obj->tabla .= "<td>
                <a class='btn btn-secondary' href='?controller=Atencion&action=generarPDFAtencion&codLlamado=".$codLlamado."' target='_blank'>Descargar</a>
            </td>";
            $this->obj->tabla .= "</tr>";
        }
        $this->obj-> loadTemplate("Llamados/index");
    }
    
    public function frmRegistrar(){
        $this->obj-> loadTemplate("Llamados/frmRegistro");
    }
    public function registrar(){
      extract($_POST);
      $data["fechaLlamado"] = $fechaLlamado;
      $data["idAprendiz"] = $idAprendiz;
      $data["nomAprendiz"] = $nomAprendiz;
      $data["apeAprendiz"] = $apeAprendiz;
      $data["telAprendiz"] = $telAprendiz;
      $data["corAprendiz"] = $corAprendiz;
      $data["fichaAprendiz"] = $fichaAprendiz;
      $data["accionTomada"] = $accionTomada;
      $data["motRemision"] = $motRemision;
      $data["idFuncionario"] = $_SESSION["id"];
      $r = Atencion_modelo::add($data);
      if ($r) {
          echo json_encode(array("mensaje" => "Se han registrado los datos correctamente", "estado" => 1));
      } else {
          echo json_encode(array("mensaje" => "ERROR: NO se han registrado los datos", "estado" => 2));
      }
  }
    public function generarPDFAtencion() {
        $codLlamado = $_GET['codLlamado'];
    //Datos
    $this->obj->llamado = Atencion_modelo::datosLlamado($codLlamado);
    setlocale(LC_ALL, 'es_ES');
    $llamados          = $this->obj->llamado[0];
    date_default_timezone_set('America/Bogota');
    $fechaActual       = date('d-m-Y');
    $fechaEmiCarbon = Carbon::createFromFormat('d-m-Y', $fechaActual);
    $fechaEmiCarbon->setLocale('es');
    $fechaEmision = $fechaEmiCarbon->isoFormat('D [de] MMMM [de] YYYY');
    $fechaDB      = $llamados["atencionFecha"];
    $fechaCarbon = Carbon::createFromFormat('Y-m-d', $fechaDB);
    $fechaCarbon->setLocale('es');
    $fechaLlamado = $fechaCarbon->isoFormat('D [de] MMMM [de] YYYY');
    $nombreAprendiz = $llamados["Apre_Nom"]." ".$llamados["Apre_Ape"];
    $idAprendiz     = $llamados["Id_Apre"];
    $especialidad   = $llamados["Pro_Desc"];
    $fichaAprendiz  = $llamados["llamadoFicha"];
    $nombreInst     = "<span style=\"text-transform:capitalize;\">".$llamados["Fun_Nom"]." ".$llamados["Fun_Ape"]."</span>";
    $telAprendiz    = $llamados["Apre_Tel"];
    $correoAprendiz    = $llamados["Apre_Correo"];
    $motRemision    = $llamados["llamadoMotivo"];
    $accionesTomadas    = $llamados["llamadoAccionesTomadas"];
    $descripcionLlamado = "Como resultado del Proceso de Seguimiento y Evaluación a los aprendices, según acta N°".$codLlamado." de fecha ".$fechaLlamado." el comité encargado ha determinado hacerle un LLAMADO DE ATENCIÓN POR ESCRITO por motivo de: ".$motRemision." en el proceso de formación.";
    $descripcionAccionesTomadas = "Así mismo, esta medida formativa sugiere un cambio de actitud frente a la formación, dejando manifiesto que el compromiso, la responsabilidad y la disciplina deben formar parte de un mejor desempeño y comportamiento para su ubicación laboral futura. El comité determina que debe: ".$accionesTomadas.".";
    $parrafoCierre = "Agradecemos tener en cuenta la anterior medida formativa con el propósito de lograr el mejoramiento requerido de su proceso formativo.";
    //Librerías
    require_once('public/PDF/tcpdf.php');
    

    // Crear una instancia de TCPDF
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
    
    // Establecer las propiedades del documento
    
    $pdf->SetCreator(PDF_CREATOR);
    $pdf->SetAuthor('SENA');
    $pdf->SetTitle('Llamado de Atención');
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
    

    EOD;
    $pdf->Cell(0, 10, $txt, 0, 1, 'C');
    $pdf->Write(0, " ", '', 0, 'C', true, 0, false, false, 0);
    // Establecer el contenido de la plantilla
    $pdf->SetFont('Helvetica', '', 12);
    $pdf->SetDrawColor(255, 255, 255);
    $pdf->SetTextColor(0, 0, 0);
    //Línea 1
    $right_column = '<b>Fecha: </b><span style="text-transform: capitalize">'.$fechaEmision.'</span>';
    $pdf->SetX(110); // Ajusta el valor según tus necesidades
    $pdf->SetFont('Helvetica', '', 12);
    $pdf->writeHTML($right_column, true, false, true, false, 'R');

    //Linea 2
    $y = $pdf->getY();
    $left_column = 'Aprendiz';
    $y +=6;
    $pdf->writeHTMLCell(140, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
    

    //Línea 3
    $left_column = '<b><span style="text-transform: uppercase">'.$nombreAprendiz.'</span></b>';
    $y +=6;
    $pdf->writeHTMLCell(160, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
    //Línea 4
    $y +=6;
    $left_column = '<span style="font-weight:bold;text-transform: uppercase">Número de identificación:'.$idAprendiz.'</span>';
    
    $pdf->writeHTMLCell(80, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);

    //Línea 5
    $y +=6;
    $left_column = '<b><span style="text-transform: uppercase">'.$especialidad.' - '.$fichaAprendiz.'</span></b>';
    $pdf->writeHTMLCell(200, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 1; 

   // Línea 6
    $left_column = '<i><span style="text-transform: none">'.$correoAprendiz.'</span></i>';
    $pdf->writeHTMLCell(180, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 10; // Incremento de 10

    // Línea 7
    $right_column = 'Asunto: <b>Llamado de Atención</b>';
    $pdf->SetX(110); // Ajusta el valor según tus necesidades
    $pdf->SetY($y); // Ajusta el valor según tus necesidades
    $pdf->SetFont('Helvetica', '', 12);
    $pdf->writeHTML($right_column, true, false, true, false, 'R');
    $y += $pdf->getLasth() + 10;

    // Línea 8
    $left_column = 'Respetado Aprendiz,';
    $pdf->writeHTMLCell(180, '', '', $y, $left_column, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 10;  // Incremento de 10


    //Cuerpo Llamado de Atención
    //Párrafo 1
    $pdf->writeHTMLCell(180, '', '', $y, $descripcionLlamado, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 10;  // Incremento de 10

    //Párrafo 2
    $pdf->writeHTMLCell(180, '', '', $y, $descripcionAccionesTomadas, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 10;  // Incremento de 10

    //Párrafo 3
    $pdf->writeHTMLCell(180, '', '', $y, $parrafoCierre, 0, 0, 0, true, 'J', true);
    $y += $pdf->getLasth() + 10;  // Incremento de 10
    //Firmas y despedida
    $pdf->writeHTMLCell(180, '', '', $y, "Cordialmente,", 0, 0, 0, true, 'J', true);
    $y = $pdf->SetY(-40);;  // Incremento de 10
     
    // Agregar el texto de las firmas
    $pdf->writeHTMLCell(180, '', '', $y, $nombreInst, 0, 0, 0, true, 'J', true);

    $y = $pdf->GetY();
    $pdf->SetDrawColor(0, 0, 0); // Color negro
    // Agregar líneas para las firmas
    $pdf->Line(15, $y - 1, 75, $y -1); // Línea para la firma del instructor

    // reset pointer to the last page
    $pdf->lastPage();

    // Descargar el PDF
    $pdf->Output('acta_compromiso.pdf', 'I');
}
public function filtros() {
    $id = $_SESSION["id"];
    $filtro = $_GET['filtro'];
    $texto = $_GET['texto'];
    
    // Realizar la consulta según el filtro seleccionado
    switch ($filtro) {
      case "Ficha de caracterización":
        $actas = actas_modelo::listByFicha($id, $texto);
        break;
      case "ID de aprendiz":
        $actas = actas_modelo::listById($id, $texto);
        break;
      case "Fecha de creación":
        $actas = actas_modelo::listByDate($id, $texto);
        break;
      default:
        $actas = actas_modelo::lista($id);
        break;
    }
    
    $tabla = "";
    $encabezados = "
    <tr>
        <th>NOMBRE APRENDIZ</th>
        <th>FICHA</th>
        <th>FECHA COMPROMISO</th>
        <th>MOTIVO DE REMISIÓN</th>
        <th>ACCIONES</th>
    </tr>
";
    // Generar la tabla HTML con los resultados
    foreach ($actas as $fila) {
      $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"];
      $codActa = $fila["codActa"];
      
      $tabla .= "<tr>";
      $tabla .= "<td>".$nombreCompleto."</td>";
      $tabla .= "<td>".$fila["actaFicha"]."</td>";
      $tabla .= "<td>".$fila["actaFecha"]."</td>";
      $tabla .= "<td>".$fila["actaMotivoRemision"]."</td>";
      $tabla .= "<td>
        <a class='btn btn-secondary' href='?controller=actas&action=generarPDFActa&codActa=".$codActa."' target='_blank'>Descargar</a>
      </td>";
      $tabla .= "</tr>";
    }
    $tablaCompleta = $encabezados . $tabla;
    // Devolver la tabla HTML como respuesta
    echo $tablaCompleta;
  }

}