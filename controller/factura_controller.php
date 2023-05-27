<?php

class factura_controller{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /mvc_Brayan");
        }
        $this->obj=new template();
    }
    public function index(){
        $this->obj-> loadTemplate("factura/index");
    }

}