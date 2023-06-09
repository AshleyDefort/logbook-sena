<?php

class compromiso_controller{
    function __construct(){
        $this->obj=new template();
    }
    public function index(){
        $this->obj-> loadTemplate("compromiso/index");
    }

}