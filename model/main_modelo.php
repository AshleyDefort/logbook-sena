<?php
class main_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO programas
       (Cod_Pro, Pro_Desc)
    VALUES (?,?)";
    $st=$c->prepare($sql);  
    $v=array($data["codigo"],
                $data["descripcion"]);
        return $st->execute($v);//organiza 
    }
    public static function edit(){}
    public static function delete(){}
    public static function find(){}
    public static function findById($codigo){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from programas WHERE Cod_Pro=?";
        $st=$c->prepare($sql);
        $v= array($codigo);
        $st->execute($v);
        return $st->fetch();
    }

    public static function lista(){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from programas";
        $st=$c->prepare($sql);
        $v= $st->execute();
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }

}