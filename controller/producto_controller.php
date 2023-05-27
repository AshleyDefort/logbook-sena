<?php
require_once "model/producto_modelo.php";

class producto_controller{
    function __construct(){
        $this->obj=new template();
    }
    public function index(){
        $id=$_GET["id"];
        $this->obj->fichas=producto_modelo::lista($id);
        $this->obj-> loadTemplate("producto/index");
    }
    public function frmFichas(){
        $this->obj-> loadTemplate("producto/frmFichas");
    }

    public function frmaprendiz(){
        $id=$_GET["id"];
        $this->obj->aprendiz=producto_modelo::lista2($id);
        $this->obj-> loadTemplate("producto/frmaprendiz");
    }
    public function registrar(){
        extract($_POST);
        $data["ficha"]=$ficha;//las variabes son los del formularios frmproducto
        $data["desc"]=$desc;
        $data["cod_prog"]=$cod_prog;
        $data["fech_inic"]=$fech_inic;
        $data["fech_fin"]=$fech_fin;
        $r=producto_modelo::add($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"se registró", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se registró", "estado"=>2));
        }
        }
    }

