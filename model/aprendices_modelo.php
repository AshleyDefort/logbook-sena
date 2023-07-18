<?php
require_once 'libs/connection.php';
class aprendices_modelo{
    public static function add($data){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "INSERT INTO aprendiz (Id_Apre, Apre_Nom, Apre_Ape, Apre_Tel, Apre_Correo, Apre_Sexo) VALUES (?, ?, ?, ?, ?, ?)";
        $st = $c->prepare($sql);
        $v = array(
            $data["id"],
            $data["nombres"],
            $data["apellidos"],
            $data["telefono"],
            $data["correo"],
            $data["sexo"]
        );
        $success = $st->execute($v);
    
        if ($success) {
            if (isset($data["ficha"])) {
                if ($data["ficha"] !== null) {
                    $sql = "INSERT INTO apre_ficha (Cod_Ficha, Id_Apre, ApreRol) VALUES (?, ?, ?)";
                    $st = $c->prepare($sql);
                    
                    $ficha = $data["ficha"];
                    $id = $data["id"];
                    $rol = $data["rol"];
                    
                    $success = $st->execute([$ficha, $id, $rol]);
                    if (!$success) {
                        $errorInfo = $st->errorInfo();
                        echo "Error en la inserción de apre_ficha: " . $errorInfo[2];
                    }
                }
            }
        } else if ($st->errorCode() == "23000") {//Error clave duplicada
            $errorInfo = $st->errorInfo();
            $errorMessage = "El aprendiz con el ID ".$data["id"]." ya está registrado.";
            echo "Error en la inserción de aprendiz: " . $errorMessage;
        }
    
        return $success;
    }
    
    
    
    public static function existeAprendiz($id){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "SELECT COUNT(*) FROM aprendiz WHERE Id_Apre = ?";
        $st = $c->prepare($sql);
        $st->execute([$id]);
        $count = $st->fetchColumn();
        
        return ($count > 0);
    }
    
    public static function addFicha($data){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "SELECT COUNT(*) FROM ficha WHERE Cod_Ficha = ?";
        $st = $c->prepare($sql);
        $st->execute([$data["ficha"]]);
        $count = $st->fetchColumn();
        
        if ($count > 0) {
            $sql = "INSERT INTO apre_ficha (Cod_Ficha, Id_Apre, ApreRol) VALUES (?, ?, ?)";
            $st = $c->prepare($sql);
            
            $ficha = $data["ficha"];
            $id = $data["id"];
            $rol = $data["rol"];
            
            $success = $st->execute([$ficha, $id, $rol]);
            
            if (!$success) {
                $errorInfo = $st->errorInfo();
                echo "Error en la inserción de apre_ficha: " . $errorInfo[2];
            }
        } else {
            $success = false;
        }
        
        return $success;
    }
    

    public static function edit($data)
{
    $obj = new connection();
    $c = $obj->getConnection();
    $sql = "UPDATE aprendiz SET 
        Id_Apre = ?,
        Apre_Nom = ?,
        Apre_Ape = ?,
        Apre_Tel = ?,
        Apre_Correo = ?,
        Apre_Sexo = ?
        WHERE Id_Apre = ?";
    $st = $c->prepare($sql);
        $st->execute(array(
       
            $data["id"],
            $data["nombres"],
            $data["apellidos"],
            $data["telefono"],
            $data["correo"],
            $data["sexo"],
            $data["id"]
        ));
    

    return $st->execute();
}

    

    public static function delete($id){
        $obj = new connection();
        $c = $obj -> getConnection();

        $sql = "DELETE FROM aprendiz WHERE Id_Apre = ?";
        $st = $c -> prepare($sql);
        $v = array($id);
        return $st -> execute($v);
    }
    public static function find(){}

    public static function lista(){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from aprendiz";
        $st=$c->prepare($sql);
        $v= $st->execute();
        return $st->fetchAll();//ayuda a retornar a los clientes, en este caso
    }
    public static function findById($id){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from aprendiz WHERE Id_Apre=?";
        $st=$c->prepare($sql);
        $v= array($id);
        $st->execute($v);
        return $st->fetch();
    }

    public static function Total(){
        $obj= new connection(); //creamos un obtjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from aprendiz";
        $st=$c->prepare($sql);
        $st->execute();
        return $st->rowCount();
    }


    
    
    


}


//VARIABLES DE SESIÓN (muestra el nombre del usuario en diferntes sesiones)