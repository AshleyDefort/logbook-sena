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
    
            $codActa = $c->lastInsertId();
    
            // Insertar en la tabla "aprendices_actas"
            $sql2 = "INSERT INTO aprendices_actas (codActaFK, idAprendizFK, codFichaFK) VALUES (?, ?, ?)";
            $st2 = $c->prepare($sql2);
            $v2 = array(
                $codActa,
                $data["idAprendiz"],
                $data["fichaAprendiz"]
            );
            
            return $st2->execute($v2);
        } catch (PDOException $e) {
            echo $e->getMessage();
            return false; // 
        }
    }
     
}

?>