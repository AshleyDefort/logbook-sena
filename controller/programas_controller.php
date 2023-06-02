<?php
require_once "model/programas_modelo.php";

class programas_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $id=$_GET["id"];
        $this->obj->fichas=programas_modelo::lista($id);
        $this->obj-> loadTemplate("programas/index");
    }
    public function frmFichas(){
        $this->obj-> loadTemplate("programas/frmFichas");
    }

    public function frmaprendiz(){
        $id=$_GET["id"];
        $this->obj->aprendiz=programas_modelo::lista2($id);
        $this->obj-> loadTemplate("programas/frmaprendiz");
    }
    public function registrar(){
        extract($_POST);
        $data["ficha"]=$ficha;//las variabes son los del formularios frmprogramas
        $data["desc"]=$desc;
        $data["cod_prog"]=$cod_prog;
        $data["fech_inic"]=$fech_inic;
        $data["fech_fin"]=$fech_fin;
        $r=programas_modelo::add($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"se registró", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se registró", "estado"=>2));
        }
        }
    }

