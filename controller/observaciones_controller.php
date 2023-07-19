<?php
require_once "model/observaciones_modelo.php";
class observaciones_controller{
    function __construct(){
        if(!isset($_SESSION["id"])){
            header("Location: /Bitacora");
        }
        $this->obj=new template();
    }
    public function index(){
        $id=$_SESSION["id"];
        $this->obj->observaciones = observaciones_modelo::lista($id);
        $this->obj->tabla = "";
        foreach ($this->obj->observaciones as $fila) {
            $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"]; 
            $codObs         = $fila["CodObs"];
            $ficha          = $fila["fk_ficha"];
            $fecha          = $fila["FechaObs"];
            $titulo         = $fila["TituloObs"];
            $descripcion    = $fila["DescripcionObs"];
            $this->obj->tabla .= "<tr>";
            $this->obj->tabla .= "<td>".$nombreCompleto."</td>"; 
            $this->obj->tabla .= "<td>".$fila["fk_ficha"]."</td>";
            $this->obj->tabla .= "<td>".$fila["FechaObs"]."</td>";
            $this->obj->tabla .= "<td>".$fila["TituloObs"]."</td>";
            $this->obj->tabla .= "<td class='text-center'>
                <a class='fas fa-eye text-primary open-modal' style='text-decoration:none;' href='#' data-nombre='$nombreCompleto' data-ficha='$ficha' data-fecha='$fecha' data-titulo='$titulo' data-descripcion='$descripcion'></a> | 
                <a class='fas fa-trash text-danger' onclick='eliminarObservacion($codObs)'></a>
            </td>";
            $this->obj->tabla .= "</tr>";
        }
        $this->obj-> loadTemplate("observaciones/index");
    }
    public function frmRegistro(){
        $this->obj-> loadTemplate("observaciones/frmRegistro");
    }
    
    public function registrar(){
        extract($_POST);
        $data["fechaObservacion"]=$fechaObservacion;
        $data["idAprendiz"]=$idAprendiz;
        $data["fichaAprendiz"]=$fichaAprendiz;
        $data["observacion"]=$observacion;
        $data["descripcion"]=$descripcion;
        $data["idFuncionario"] = $_SESSION["id"];
        $r=observaciones_modelo::add($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"Observación registrada", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se ha registrado la observación", "estado"=>2));
        }
    }
    public function delete(){
		$id = $_POST["id"];
		$r  = observaciones_modelo::delete($id);
		if($r > 0){
			header("Location: ?controller=observaciones&action=index");
		}
	}
    public function buscar(){
        extract($_POST);
        
        $r=observaciones_modelo::buscar($id);
        if(is_array($r))
            
                echo json_encode(array("mensaje"=>$r, "estado"=>1));
        else
                echo json_encode(array("mensaje"=>"sin datos", "estado"=>2));
    }
}

