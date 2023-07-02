<?php
require_once 'libs/connection.php';
class actas_modelo 
{
    public static function add($data){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "INSERT INTO acta_compromiso (actaFecha, actaIdAprendiz, actaFicha, actaFuncionario, actaMotivoRemision, actaDescargoAprendiz, actaCompromisos, actaRecomendaciones) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            $st = $c->prepare($sql);
            $v = array(
                $data["fechaActa"],
                $data["idAprendiz"],
                $data["fichaAprendiz"],
                $data["idFuncionario"],
                $data["motRemision"],
                $data["descargoApre"],
                $data["compromiso"],
                $data["recomendaciones"]
            );
            
            $st->execute($v);
    
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return false;
        }
    }
    public static function lista($id){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        if ($_SESSION["rol"]==="ADMIN") {
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre`=acta.`actaIdAprendiz`;";
            $st = $c->prepare($sql);
            $st->execute(); // Pasar el valor de $id como argumento
        } else {
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre`=acta.`actaIdAprendiz` WHERE acta.actaFuncionario=?;";
            $st = $c->prepare($sql);
            $st->execute([$id]); // Pasar el valor de $id como argumento
        }
        return $st->fetchAll();
    }
    public static function listByDate($id, $fechaActa){
        $fechaActa = date('Y-m-d', strtotime($fechaActa));
        $obj = new connection(); // creamos un objeto de conexión
        $c = $obj->getConnection();
        if ($_SESSION["rol"]==="ADMIN") {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.`actaFecha` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$fechaActa]); // Pasar los valores de $id y $fechaCreacion como argumentos
        } else {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.actaFuncionario = ? AND acta.`actaFecha` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$id, $fechaActa]); // Pasar los valores de $id y $fechaCreacion como argumentos
        }
        
        return $st->fetchAll();
    }
    public static function listById($id, $idApre){
        $obj = new connection(); // creamos un objeto de conexión
        $c = $obj->getConnection();
        if ($_SESSION["rol"]==="ADMIN") {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.`actaIdAprendiz` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$idApre]); 
        } else {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.actaFuncionario = ? AND acta.`actaIdAprendiz` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$id, $idApre]); 
        }
        
        return $st->fetchAll();
    }
    public static function listByFicha($id, $ficha){
        $obj = new connection(); // creamos un objeto de conexión
        $c = $obj->getConnection();
        if ($_SESSION["rol"]==="ADMIN") {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.`actaFicha` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$ficha]);  
        } else {
            $sql = "SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, acta.`codActa`, acta.`actaFicha`, acta.`actaFecha`, acta.`actaMotivoRemision` FROM aprendiz apr INNER JOIN acta_compromiso acta ON apr.`Id_Apre` = acta.`actaIdAprendiz` WHERE acta.actaFuncionario = ? AND acta.`actaFicha` = ?;";
            $st = $c->prepare($sql);
            $st->execute([$id, $ficha]);             
        }
        
        return $st->fetchAll();
    }
    public static function datosActa($codActa){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, apr.`Apre_Tel`, acta.*, fun.Fun_Nom, fun.Fun_Ape, pro.Pro_Desc FROM acta_compromiso acta
        JOIN aprendiz apr ON acta.`actaIdAprendiz`=apr.`Id_Apre`
        JOIN funcionario fun ON acta.`actaFuncionario`=fun.`ID_Func`
        JOIN ficha fic ON acta.`actaFicha`=fic.`Cod_Ficha`
        JOIN programas pro ON fic.`Cod_ProFK`=pro.`Cod_Pro` WHERE acta.`codActa`=?;";
        $st = $c->prepare($sql);
        $st->execute([$codActa]); // Pasar el valor de $id como argumento
        return $st->fetchAll();
    }
}

?>