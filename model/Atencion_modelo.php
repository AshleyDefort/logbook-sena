<?php
class Atencion_modelo{


    public static function buscar($id){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from aprendiz WHERE Id_Apre=?";
        $st=$c->prepare($sql);
        $v= array($id);
        $st->execute($v);
        return $st->fetch();
    }


}