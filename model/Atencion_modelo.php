<?php
class Atencion_modelo{

    public static function add($data){
        $obj = new connection();
        $c = $obj->getConnection();
        $sql = "INSERT INTO llamado_de_atencion (atencionFecha, llamadoIdApre, llamadoFicha, llamadoFuncionario, llamadoMotivo, llamadoAccionesTomadas) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            $st = $c->prepare($sql);
            $v = array(
                $data["fechaLlamado"],
                $data["idAprendiz"],
                $data["fichaAprendiz"],
                $data["idFuncionario"],
                $data["motRemision"],
                $data["accionTomada"]
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
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, atencion.`codLlamado`, atencion.`atencionFecha`, atencion.`llamadoFicha`, atencion.`llamadoMotivo` FROM aprendiz apr INNER JOIN llamado_de_atencion atencion ON apr.`Id_Apre`=atencion.`llamadoIdApre`;";
            $st = $c->prepare($sql);
            $st->execute(); // Pasar el valor de $id como argumento
        } else {
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, atencion.`codLlamado`, atencion.`atencionFecha`, atencion.`llamadoFicha`, atencion.`llamadoMotivo` FROM aprendiz apr INNER JOIN llamado_de_atencion atencion ON apr.`Id_Apre`=atencion.`llamadoIdApre` WHERE atencion.llamadoFuncionario=?;";
            $st = $c->prepare($sql);
            $st->execute([$id]); // Pasar el valor de $id como argumento
        }
        return $st->fetchAll();
    }
    public static function datosLlamado($codLlamado){
        $obj= new connection(); //creamos un ontjeto de conexión
        $c= $obj->getConnection();
        $sql="SELECT apr.*, llamado.*, fun.Fun_Nom, fun.Fun_Ape, pro.Pro_Desc FROM llamado_de_atencion llamado
        JOIN aprendiz apr ON llamado.`llamadoIdApre`=apr.`Id_Apre`
        JOIN funcionario fun ON llamado.`llamadoFuncionario`=fun.`ID_Func`
        JOIN ficha fic ON llamado.`llamadoFicha`=fic.`Cod_Ficha`
        JOIN programas pro ON fic.`Cod_ProFK`=pro.`Cod_Pro` WHERE llamado.`codLlamado`=?;";
        $st = $c->prepare($sql);
        $st->execute([$codLlamado]); // Pasar el valor de $id como argumento
        return $st->fetchAll();
    }

}