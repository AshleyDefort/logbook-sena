<?php
class observaciones_modelo{
    public static function add($data){
       $obj= new connection();
       $c= $obj->getConnection();
       $sql="INSERT INTO observaciones
       (FechaObs,ID_FuncFK,Id_ApreFK,TituloObs,DescripcionObs,fk_ficha)
    VALUES (?,?,?,?,?,?)";
    $st=$c->prepare($sql);  
    $v=array($data["fechaObservacion"],
                $data["idFuncionario"],
                $data["idAprendiz"],
                $data["observacion"],
                $data["descripcion"],
                $data["fichaAprendiz"]);
        return $st->execute($v);
    }
    
    public static function edit(){}
    public static function delete($id){
        $obj = new connection();
        $c = $obj -> getConnection();
        $sql = "DELETE FROM observaciones WHERE CodObs = ?";
        $st = $c -> prepare($sql);
        $v = array($id);
        return $st -> execute($v);
    }
    public static function find(){}
    public static function lista($id){
        $obj= new connection(); 
        $c= $obj->getConnection();
        if ($_SESSION["rol"]==="ADMIN") {
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, obs.* FROM aprendiz apr INNER JOIN observaciones obs ON apr.`Id_Apre`=obs.`Id_ApreFK`;";
            $st = $c->prepare($sql);
            $st->execute(); // Pasar el valor de $id como argumento
        } else {
            $sql="SELECT apr.`Apre_Nom`, apr.`Apre_Ape`, obs.* FROM aprendiz apr INNER JOIN observaciones obs ON apr.`Id_Apre`=obs.`Id_ApreFK` WHERE obs.Id_FuncFK=?;";
            $st = $c->prepare($sql);
            $st->execute([$id]); // Pasar el valor de $id como argumento
        }
        return $st->fetchAll();
    }
    public static function buscar($id)
{
    $obj = new connection();
    $c = $obj->getConnection();
    if ($_SESSION["rol"]==="ADMIN") {
        $sql = "SELECT aprendiz.*, apre_ficha.Cod_Ficha FROM aprendiz
            LEFT JOIN apre_ficha ON aprendiz.Id_Apre = apre_ficha.Id_Apre
            WHERE aprendiz.Id_Apre = ?";
        $st = $c->prepare($sql);
        $v = array($id);
        $st->execute($v);
    } else {
        $sql = "SELECT aprendiz.*, apre_ficha.Cod_Ficha FROM aprendiz
            LEFT JOIN apre_ficha ON aprendiz.Id_Apre = apre_ficha.Id_Apre INNER JOIN ficha_funcionario ON apre_ficha.Cod_Ficha=ficha_funcionario.cod_ficha
            WHERE aprendiz.Id_Apre = ? AND ficha_funcionario.id_funcionario=?";
        $idFunc = $_SESSION["id"];
        $st = $c->prepare($sql);
        $v = array($id, $idFunc);
        $st->execute($v);
    }
    

    $aprendiz = null;

    while ($row = $st->fetch()) {
        if (!$aprendiz) {
            $aprendiz = $row; 
            $aprendiz["fichas"] = array(); 
        }

        if ($row["Cod_Ficha"]) {
            $aprendiz["fichas"][] = $row["Cod_Ficha"]; // Agregamos las fichas al array
        }
    }

    return $aprendiz;
}


}