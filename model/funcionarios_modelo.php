<?php
class funcionarios_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO funcionario
       (Fun_Tip_Doc,ID_Func,Fun_Nom,Fun_Ape,Fun_Tel,Fun_Correo,Fun_Pswd,Fun_Direcc,Fun_Cargo,Fun_Rol)
    VALUES (?,?,?,?,?,?,?,?,?,?)";
    $st=$c->prepare($sql);
    $v=array($data["doc"],
                $data["id"],
                $data["nombres"],
                $data["apellidos"],
                $data["telefono"],
                $data["correo"],
                sha1($data["password"]),
                $data["direccion"],
                $data["cargo"],
                $data["rol"]);
        return $st->execute($v);//organiza 
    }

    public static function edit($data){
        $obj= new connection();
        $c= $obj->getConnection();
        $sql="UPDATE funcionario SET 
        Fun_Tip_Doc=?,ID_Func=?, Fun_Nom=?, Fun_Ape=?, Fun_Tel=?, Fun_Correo=?, Fun_Direcc=?, Fun_Cargo=?, Fun_Rol=?
        WHERE ID_Func=?";
     $st=$c->prepare($sql);
     $v=array($data["doc"],
                $data["id"],
                $data["nombres"],
                 $data["apellidos"],
                 $data["telefono"],
                 $data["correo"],
                 $data["direccion"],
                 $data["cargo"],
                 $data["rol"],
                $data["id"]);
         return $st->execute($v);//organiza 
     }
        public static function delete($id){
            $obj = new connection();
            $c = $obj -> getConnection();
            $sql = "DELETE FROM funcionario WHERE ID_Func = ?";
            $st = $c -> prepare($sql);
            $v = array($id);
            return $st -> execute($v);
        }
    public static function find(){}

    public static function lista($pagina,$limite){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from funcionario LIMIT $pagina, $limite";
        $st=$c->prepare($sql);
        $v= $st->execute();
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }
    public static function findById($id){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from funcionario WHERE ID_Func=?";
        $st=$c->prepare($sql);
        $v= array($id);
        $st->execute($v);
        return $st->fetch();
    }

    public static function Total(){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from funcionario";
        $st=$c->prepare($sql);
        $st->execute();
        return $st->rowCount();
    }


    public static function validarUsuario($data){
        $obj= new connection();
        $c= $obj->getConnection();
        $sql="SELECT * from funcionario WHERE ID_Func=? AND Fun_Tip_Doc=? AND
                                            Fun_Pswd=?" ;
        $st=$c->prepare($sql);
        $v= array($data["id"],$data["doc"], sha1($data["password"]));
        $st->execute($v);
        //retorna informacion del usuario, en caso de noencontrarla retorna un vector vacío
        return $st->fetch();
    }
    
    public static function validarPassActual($password){
        $obj= new connection();
        $c= $obj->getConnection(); 
        $sql="SELECT * from funcionario WHERE Fun_Pswd = ? AND 
                                             ID_Func = ?";
        $st=$c->prepare($sql);
        $v= array(sha1($password),$_SESSION['id']);
        $st->execute($v);
        return $st->fetch();

    }

    public static function actualizarPassword($password){
        $obj= new connection();
        $c= $obj->getConnection(); 
        $sql="UPDATE funcionario SET Fun_Pswd =? WHERE ID_Func=?";
        $st=$c->prepare($sql);
        $v= array(sha1($password),$_SESSION['id']);
        $st->execute($v);
    }

}


//VARIABLES DE SESIÓN (muestra el nombre del usuario en diferntes sesiones)