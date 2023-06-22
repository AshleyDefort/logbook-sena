<?php
require_once 'libs/connection.php';
class aprendices_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO aprendiz
       (Id_Apre,Apre_Nom,Apre_Ape,Apre_Tel, Apre_Correo,Apre_Sexo,Apre_Rol) VALUES (?,?,?,?,?,?,?)";
        try {
            $st = $c->prepare($sql);
            $v = array($data["id"], $data["nombres"], $data["apellidos"], $data["telefono"], $data["correo"], $data["sexo"], $data["rol"]);
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
        $rutaPorDefecto = "../public/img/profile_photo_default.png";
        $datosFotoDefault = file_get_contents($rutaPorDefecto);
        $data["foto"] = $foto['tmp_name'] ? file_get_contents($foto['tmp_name']) : $datosFotoDefault;
    
        $sql = "UPDATE aprendiz SET 
      
            Id_Apre = ?,
            Apre_Nom = ?,
            Apre_Ape = ?,
            Apre_Tel = ?,
            Apre_Correo = ?,
            Apre_Direcc = ?,
            Apre_Sexo = ?,
            Apre_Rol = ?
        
            WHERE Id_Apre = ?";
        $st = $c->prepare($sql);
        $st->bindValue(1, $data["id"]);
        $st->bindValue(2, $data["nombres"]);
        $st->bindValue(3, $data["apellidos"]);
        $st->bindValue(4, $data["telefono"]);
        $st->bindValue(5, $data["correo"]);
        $st->bindValue(6, $data["direccion"]);
        $st->bindValue(7, $data["sexo"]);
        $st->bindValue(8, $data["rol"]);
    } else {
        $sql = "UPDATE aprendiz SET 
            Id_Apre = ?,
            Apre_Nom = ?,
            Apre_Ape = ?,
            Apre_Tel = ?,
            Apre_Correo = ?,
            Apre_Direcc = ?,
            Apre_Sexo = ?,
            Apre_Rol = ?
            WHERE Id_Apre = ?";
        $st = $c->prepare($sql);
        
        // Utilizar directamente el método execute() con los valores
        $st->execute(array(
       
            $data["id"],
            $data["nombres"],
            $data["apellidos"],
            $data["telefono"],
            $data["correo"],
            $data["sexo"],
            $data["rol"],
          
        ));
    }

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

    public static function lista($pagina,$limite){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT * from aprendiz LIMIT $pagina, $limite";
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