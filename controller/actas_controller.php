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
    
}
?>