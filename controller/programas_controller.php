<?php
require_once "model/programas_modelo.php";
require_once "model/funcionarios_modelo.php";
class programas_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $this->obj->programas=programas_modelo::listaProgramas();
        $this->obj-> loadTemplate("programas/index");
    }
    public function fichas(){
        $id=$_SESSION["id"];  
        $funcionario=funcionarios_modelo::findById($id);
        $rol=$funcionario["Fun_Rol"];
        $codPrograma=$_GET["id"];
        $this->obj->fichas=programas_modelo::lista($codPrograma,$id,$rol);
        $this->obj-> loadTemplate("programas/fichas");
    }
    public function frmFichas(){
        $codPrograma = $_GET["id"];
        $this->obj->programaFicha = programas_modelo::findById($codPrograma);
        $this->obj->nombrePrograma = $this->obj->programaFicha["Pro_Desc"]; 
        $this->obj->codPrograma = $this->obj->programaFicha["Cod_Pro"]; 
        $this->obj->loadTemplate("programas/frmFichas");
    }

    public function frmaprendiz(){
        $id=$_GET["id"];
        $this->obj->aprendiz=programas_modelo::lista2($id);
        $this->obj-> loadTemplate("programas/frmaprendiz");
    }
    public function registrar()
    {
        extract($_POST);
        $data["instructores"] = $instructores;
        $instructoresArray = preg_split('/\s*,\s*/', $instructores, -1, PREG_SPLIT_NO_EMPTY);
        $instructoresValidos = [];
    
        foreach ($instructoresArray as $instructorID) {
            $funcionario = funcionarios_modelo::findById($instructorID);
            
            if ($funcionario) {
                $instructoresValidos[] = $instructorID;
            }
        }
        
        // Continuar solo si al menos un instructor válido fue ingresado
        if (count($instructoresValidos) > 0) {
            $data["ficha"] = $ficha;
            $data["desc"] = $desc;
            $data["cod_prog"] = $cod_prog;
            $data["fech_inic"] = $fech_inic;
            $data["fech_fin"] = $fech_fin;
            
            // Asignar instructores válidos a los datos a insertar
            $data["instructores"] = $instructoresValidos;
            
            $r = programas_modelo::add($data);
            
            if ($r > 0) {
                echo json_encode(array("mensaje" => "Se han registrado los datos", "estado" => 1));
            } else {
                echo json_encode(array("mensaje" => "ERROR: NO se registró", "estado" => 2));
            }
        } else {
            echo json_encode(array("mensaje" => "ERROR: Ingrese al menos un ID de instructor válido", "estado" => 3));
        }
    }
    
}
