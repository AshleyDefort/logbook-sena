<?php
require_once "model/actas_modelo.php";
class actas_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $this->obj-> loadTemplate("actas/index");
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
        if ($r > 0) {
            echo json_encode(array("mensaje" => "Se han registrado los datos", "estado" => 1));
        } else {
            echo json_encode(array("mensaje" => "ERROR: NO se han registrado los datos", "estado" => 2));
        }
    }
    
}
?>