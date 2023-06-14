<?php
require_once "model/Atencion_modelo.php";
class Atencion_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $this->obj-> loadTemplate("Llamados/index");
    }

    public function buscar(){
        extract($_POST);
        
        $r=Atencion_modelo::buscar($id);
        if(is_array($r))
             echo json_encode(array("mensaje"=>$r, "estado"=>1));
        else
             echo json_encode(array("mensaje"=>"sin datos", "estado"=>2));
    }

}