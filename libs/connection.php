<?php
class connection{
    private $con;
    private $user="root";
    private $pass="";
    private $server="mysql:host=localhost;dbname=bitacora;port=3308";//cuando es un puerto diferente se coloca ej mvc;port=33006;
    public function __construct(){
       try{
        $this->con= new PDO($this->server, $this->user, $this->pass);//PDO ES UNA VARIABLE PARA CONECTAR A LA BD
        $this->con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);//PARA CAPTURAR ERRORES (decir cuales son). Los :: indican que una variable para es de tipo estatico
    }catch(PDOException $e){
    echo"ERROR: ".$e->getMessage();//para INDICAR que hay errores
    }
}
    public function getConnection(){
        return $this->con;
    }

}