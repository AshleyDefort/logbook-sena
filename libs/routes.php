<?php
class routes
{
    //una función static no requiere de un objeto para acceder a la función
    public static function loadContent($cnt, $act){
      // se BORRÓ PERO AJA  echo "<br>".$cnt."_controller.php";
        $archivo="controller/".$cnt."_controller.php";
        if(file_exists($archivo)){
            require_once $archivo;
            $clase=$cnt."_controller";//aquí se accede
            $obj=new $clase();//aquí se crea un objeto de tipo main controller, y se ejecuta. Este es dinámico //ej si en cnt fuera = instructor, se crearía un objeto instructor
            if(method_exists($obj, $act)){
                $obj->$act();
            }else{
                echo "<br> El método public function $act no existe en el controlador $clase";
            }
        }else{
            echo "<br> El controlador no existe";
        }
    }
}