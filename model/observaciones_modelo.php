<?php
class observaciones_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO observaciones
       (Bit_Fecha,ID_FuncFK,Id_ApreFK,Bit_Des_Larg,Cod_Des_CortFK)
    VALUES (?,?,?,?,?)";
    $st=$c->prepare($sql);  
    $v=array($data["observaciones"],
                $data["Bit_Fecha"],
                $data["ID_FuncFK"],
                $data["Id_ApreFK"],
                $data["Bit_Des_Larg"],
                $data["Cod_Des_CortFK"]);
        return $st->execute($v);//organiza 
    }
    
    public static function edit(){}
    public static function delete(){}
    public static function find(){}
    /*public static function lista($id){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from  WHERE Cod_ProFK=?";
        $st=$c->prepare($sql);
        
         $st->execute(array($id));
        
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }*/
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