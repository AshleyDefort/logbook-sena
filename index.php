<?php
session_start();
//$_SESSION: guarda la informacion que requieras guardar del usuario que ha iniciado la sesión
require_once "libs/routes.php";
require_once "libs/template.php";
require_once "libs/connection.php";
// $obj= new connection();
// $obj->getConnection();
    //$_GET Los indices externos ayudan extrearlos de la url, 
if(isset($_GET['controller'])&&isset($_GET['action'])){
    $controller=$_GET['controller'];
    $action=$_GET['action'];
    //Como no existen en la url, entra en el else, ya que en la url actual no está, si se llegase a modificar sí se podría.
    }else{
        $controller='main';
        $action='frmLogin';
    }
    
 routes::loadContent($controller, $action);//llamando una función, pasando el valor de control y la acción que hay definido en el index
// si no fuera static se haría:
//$obj=new routes();
//siempre se pasará por este archivo porque acá están los controlares y acciones a tomar establecidos en la linea 5.
