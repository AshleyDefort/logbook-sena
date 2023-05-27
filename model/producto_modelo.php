<?php
class producto_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO ficha
       (Cod_Ficha,Desc_Fich,Cod_ProFK,FechaIni_Fich,FechaFin_Fich)
    VALUES (?,?,?,?,?)";
    $st=$c->prepare($sql);  
    $v=array($data["ficha"],
                $data["desc"],
                $data["cod_prog"],
                $data["fech_inic"],
                $data["fech_fin"]);
        return $st->execute($v);//organiza 
    }
    public static function edit(){}
    public static function delete(){}
    public static function find(){}
    public static function lista($id){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from ficha WHERE Cod_ProFK=?";
        $st=$c->prepare($sql);
        
         $st->execute(array($id));
        
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }

    public static function lista2($id){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT a.ID_Apre, a.Apre_Nom, a.Apre_Ape, a.Apre_Tel, a.Apre_Correo FROM aprendiz a JOIN apre_ficha fa ON a.ID_Apre = fa.ID_Apre JOIN ficha f ON fa.Cod_Ficha = f.Cod_Ficha WHERE f.Cod_Ficha=?";
        $st = $c->prepare($sql);
    $st->execute([$id]);
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }

}