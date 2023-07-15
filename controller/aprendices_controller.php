<?php
require_once "model/aprendices_modelo.php";
require_once 'libs/connection.php';
class aprendices_controller
{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj = new template();
    }

    public function index(){
        $this->obj->aprendices=aprendices_modelo::lista();
        $this->obj->loadTemplate("aprendices/index");
    }

    public function frmRegistro(){
        $ficha = $_GET["ficha"];
        $this->obj->ficha = $ficha;
        $this->obj->loadTemplate("aprendices/frmregistro");
    }
    
    
    public function frmEditar(){
        $id = $_GET["id"];
        $this->obj-> aprendices = aprendices_modelo::findById($id);
        $this->obj-> loadtemplate("aprendices/frmEditar");
    }
 
    public function registrar(){
        extract($_POST);
        $data["id"] = $id;
        $data["nombres"] = $nombres;
        $data["apellidos"] = $apellidos;
        $data["telefono"] = $telefono;
        $data["correo"] = $correo;
        $data["sexo"] = $sexo;
        $data["rol"] = $rol;
        
        if (!empty($ficha)) {
            $data["ficha"] = $ficha;
        } else {
            $data["ficha"] = null;
        }
        
        $aprendizExiste = aprendices_modelo::existeAprendiz($id);
        
        if ($aprendizExiste) {
            if (!empty($ficha)) {
                $r = aprendices_modelo::addFicha($data);
                
                if ($r) {
                    echo json_encode(array("mensaje"=>"El aprendiz ya estaba registrado y ha sido añadido a la ficha de formación", "estado"=>1));
                } else {
                    echo json_encode(array("mensaje"=>"ERROR: No se ha podido añadir el aprendiz a la ficha de formación", "estado"=>2));
                }
            } else {
                echo json_encode(array("mensaje"=>"El aprendiz ya está registrado", "estado"=>3));
            }
        } else {
            $r = aprendices_modelo::add($data);
            
            if ($r) {
                echo json_encode(array("mensaje"=>"Se ha registrado el aprendiz", "estado"=>1));
            } else {
                echo json_encode(array("mensaje"=>"ERROR: No se ha podido registrar el aprendiz", "estado"=>2));
            }
        }
    }
    
    public function delete(){
		$id = $_POST["id"];
		$r  = aprendices_modelo::delete($id);
		if($r > 0){
			header("Location: ?controller=aprendices&action=index");
		}
	}

    

      
      

    

    public function edit(){
        extract($_POST);
        $data["doc"]=$doc;
        $data["id"]=$id;
        $data["nombres"]=$nombres;
        $data["apellidos"]=$apellidos;
        $data["telefono"]=$telefono;
        $data["correo"]=$correo;
        $data["direccion"]=$direccion;
        $data["rol"]=$rol;
    
        // Verificar si se ha subido una foto
        if (isset($_FILES['foto']) && $_FILES['foto']['name'] !== '') {
            $foto = $_FILES['foto'];
            $nombreFoto = $foto['name'];
            $tipoFoto = $foto['type'];
            $tamanoFoto = $foto['size'];
            $ubicacionTemporalFoto = $foto['tmp_name'];
            $errorFoto = $foto['error'];
    
            $datosFoto = file_get_contents($ubicacionTemporalFoto); // Leer el contenido de la foto
    
            $data["foto"] = $datosFoto; // Asignar los datos de la foto al arreglo de datos a insertar en la base de datos
        } else {
            // Asignar valor predeterminado para la foto en caso de no haberse enviado una
            $rutaPorDefecto = "public/img/profile_photo_default.png";
 // o asigna un valor predeterminado válido para la columna de la base de datos
            $datosFotoDefault = file_get_contents($rutaPorDefecto); // Leer el contenido de la imagen por defecto
            $data["foto"] = $datosFotoDefault;
        }
        var_dump($data);
        $r = aprendices_modelo::edit($data);
        if ($r !== false) {
            echo json_encode(array("mensaje" => "Se han editado los datos", "estado" => 1));
        } else {
            echo json_encode(array("mensaje" => "ERROR: No se han editado los datos", "estado" => 2));
        }
    }
    

    

    

    

        
}