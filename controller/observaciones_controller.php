<?php
require_once "model/observaciones_modelo.php";
class observaciones_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        //$id=$_GET["id"];
        //$this->obj->fichas=producto_modelo::lista($id);
        $this->obj-> loadTemplate("observaciones/index");
    }
    
    
    public function crear(){
        extract($_POST);
        $data["Bit_Fecha"]=$Bit_Fecha;//las variabes son los del formularios frmproducto
        $data["ID_FuncFK"]=$ID_FuncFK;
        $data["Id_ApreFK"]=$Id_ApreFK;
        $data["Bit_Des_Larg"]=$Bit_Des_Larg;
        $data["Cod_Des_CortFK"]=$Cod_Des_CortFK;
        $r=observaciones_modelo::add($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"se registró", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se registró", "estado"=>2));
        }
        }


    public function buscarapr(){
        $id = $_GET["id"];
        
    }
    }

