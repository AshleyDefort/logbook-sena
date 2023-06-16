<?php
require_once "model/observaciones_modelo.php";
class observaciones_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora-master");
        }
        $this->obj=new template();
    }
    public function index(){
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
            echo json_encode(array("mensaje"=>"Observación registrada", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se ha registrado la observación", "estado"=>2));
        }
        }


        public function buscar(){
            extract($_POST);
            
            $r=observaciones_modelo::buscar($id);
            if(is_array($r))
                 echo json_encode(array("mensaje"=>$r, "estado"=>1));
            else
                 echo json_encode(array("mensaje"=>"sin datos", "estado"=>2));
        }
    }

