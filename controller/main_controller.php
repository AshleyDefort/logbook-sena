<?php
require_once "model/main_modelo.php";
class main_controller{
    function __construct(){
        $this->obj=new template();
    }
    public function home(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj-> loadTemplate("main/index");
        // $this->obj-> loadTemplate("main/frmLogin", false);
    }
    public function frmlogin(){
        $this->obj-> loadTemplate("main/frmLogin", false);
    }

    public function frmProgramas(){
        $this->obj-> loadTemplate("main/frmProgramas");
    }
    
    public function registrar(){
        extract($_POST);
        $data["codigo"]=$codigo;//las variabes son los del formularios frmproducto
        $data["descripcion"]=$descripcion;
        $r=main_modelo::add($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"Se registró", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se registró", "estado"=>2));
        }
        }

//sale error pero está bien supuestamente, no se pone main  ni la extensión .php porque ya está en el template.
//require_once "view/footer.php";
//el this es el qu se encarga de cargar las páginas.

}