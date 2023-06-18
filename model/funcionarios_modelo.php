<?php
require_once 'libs/connection.php';
class funcionarios_modelo{
    public static function add($data){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "INSERT INTO funcionario (Fun_Tip_Doc, ID_Func, Fun_Nom, Fun_Ape, Fun_Tel, Fun_Correo, Fun_Pswd, Fun_Direcc, Fun_Rol, Fun_Img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            $st = $c->prepare($sql);
            $v = array(
                $data["doc"],
                $data["id"],
                $data["nombres"],
                $data["apellidos"],
                $data["telefono"],
                $data["correo"],
                sha1($data["password"]),
                $data["direccion"],
                $data["rol"],
                $data["foto"]
            );
            
            return $st->execute($v);
        } catch (PDOException $e) {
            // Manejar el error de la consulta
            echo $e->getMessage();
            return false; // O cualquier manejo de error adecuado que desees realizar
        }
    }
    

    public static function edit($data)
    {
        $obj = new connection();
        $c = $obj->getConnection();
    
        // Verificar si se ha cargado una nueva foto
        if (isset($_FILES['foto']) && $_FILES['foto']['name'] !== '') {
            $foto = $_FILES['foto'];
            $data["foto"] = file_get_contents($foto['tmp_name']);
        } else {
            // Verificar si se desea eliminar la foto
            if (isset($data['eliminar_foto']) && $data['eliminar_foto'] === '1') {
                $rutaPorDefecto = "public/img/profile_photo_default.png";
                $data["foto"] = file_get_contents($rutaPorDefecto);
            }
        }
    
        $sql = "UPDATE funcionario SET 
            Fun_Tip_Doc = ?,
            ID_Func = ?,
            Fun_Nom = ?,
            Fun_Ape = ?,
            Fun_Tel = ?,
            Fun_Correo = ?,
            Fun_Direcc = ?,
            Fun_Rol = ?,
            Fun_Img = ?
            WHERE ID_Func = ?";
        $st = $c->prepare($sql);
        $st->bindValue(1, $data["doc"]);
        $st->bindValue(2, $data["id"]);
        $st->bindValue(3, $data["nombres"]);
        $st->bindValue(4, $data["apellidos"]);
        $st->bindValue(5, $data["telefono"]);
        $st->bindValue(6, $data["correo"]);
        $st->bindValue(7, $data["direccion"]);
        $st->bindValue(8, $data["rol"]);
        $st->bindParam(9, $data["foto"], PDO::PARAM_LOB);
        $st->bindValue(10, $data["id"]);
    
        return $st->execute();
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