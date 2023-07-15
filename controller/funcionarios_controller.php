<?php
require_once "model/funcionarios_modelo.php";
require_once 'libs/connection.php';
class funcionarios_controller
{
    function __construct(){
        if (!isset($_SESSION["id"])) {
            header("Location: /Bitacora");
        }
        $this->obj = new template();
    }

    public function index() {
        $this->obj->funcionarios=funcionarios_modelo::lista();
        $this->obj->loadTemplate("funcionarios/index");
    }
    

    public function frmRegistro(){
        if($_SESSION['rol'] !="ADMIN"){
            header("Location: ?controller=funcionarios&action=index");
        }
        $this->obj->loadTemplate("funcionarios/frmregistro");
    }
	public function frmPerfil(){
        $id = $_SESSION['id'];
        $this->obj-> funcionarios = funcionarios_modelo::findById($id);
        $this->obj->loadTemplate("funcionarios/frmPerfil");
    }
    public function frmEditar(){
        $id = $_GET["id"];
        $this->obj-> funcionarios = funcionarios_modelo::findById($id);
        $this->obj-> loadtemplate("funcionarios/frmEditar");
    }
 
    public function registrar(){
        extract($_POST);
        $data["doc"] = $doc;
        $data["id"] = $id;
        $data["nombres"] = $nombres;
        $data["apellidos"] = $apellidos;
        $data["telefono"] = $telefono;
        $data["correo"] = $correo;
        $data["password"] = $password;
        $data["direccion"] = $direccion;
        $data["rol"] = $rol;
    
        // Verificar si se ha subido una foto
        if (array_key_exists('foto', $_FILES) && $_FILES['foto']['name'] !== '') {
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
            $datosFotoDefault = file_get_contents($rutaPorDefecto);
            $data["foto"] = $datosFotoDefault;
        }
    
        $r = funcionarios_modelo::add($data);
        if ($r > 0) {
            echo json_encode(array("mensaje" => "Se han registrado los datos", "estado" => 1));
        } else {
            echo json_encode(array("mensaje" => "ERROR: NO se han registrado los datos", "estado" => 2));
        }
    }
    
    public function delete(){
		$id = $_POST["id"];
		$r  = funcionarios_modelo::delete($id);
		if($r > 0){
			header("Location: ?controller=funcionarios&action=index");
		}
	}

    public function validar()
{
    extract($_POST);
    $data["doc"] = $doc;
    $data["id"] = $id;
    $data["password"] = $password;
    $r = funcionarios_modelo::validarUsuario($data);
    if (is_array($r)) {
        $_SESSION["id"] = $r["ID_Func"];
        $_SESSION["nombre"] = $r["Fun_Nom"];
        $_SESSION["apellido"] = $r["Fun_Ape"]; 
        $_SESSION["rol"] = $r["Fun_Rol"]; 
        $mensaje = "";
        $estado = 1;
        $url = "?controller=main&action=home";
    } else {
        $mensaje = "Datos incorrectos o Incompletos";
        $estado = 2;
        $url = "";
    }
    echo json_encode(array("mensaje" => $mensaje, "estado"=> $estado, "url"=>$url));
}


      
      

    public function salir(){
        session_destroy();
        header("Location:/Bitacora");
    }

    public function edit()
{
    extract($_POST);
    $data["doc"] = $doc;
    $data["id"] = $id;
    $data["nombres"] = $nombres;
    $data["apellidos"] = $apellidos;
    $data["telefono"] = $telefono;
    $data["correo"] = $correo;
    $data["direccion"] = $direccion;
    $data["rol"] = $rol;

    // Verificar si se debe eliminar la foto
    if (isset($_POST['eliminar_foto']) && $_POST['eliminar_foto'] === '1') {
        // Asignar valor predeterminado para la foto en caso de eliminación
        $rutaPorDefecto = "public/img/profile_photo_default.png";
        $datosFotoDefault = file_get_contents($rutaPorDefecto); // Leer el contenido de la imagen por defecto
        $data["foto"] = $datosFotoDefault;
    } else {
        // Verificar si se ha subido una nueva foto
        if (isset($_FILES['nueva_foto']) && $_FILES['nueva_foto']['error'] === UPLOAD_ERR_OK) {
            $rutaFoto = $_FILES['nueva_foto']['tmp_name'];
            $datosFoto = file_get_contents($rutaFoto); // Leer el contenido de la nueva imagen
            $data["foto"] = $datosFoto;
        }
    }

    $r = funcionarios_modelo::edit($data);
    if ($r !== false) {
        echo json_encode(array("mensaje" => "Se han editado los datos", "estado" => 1));
    } else {
        echo json_encode(array("mensaje" => "ERROR: No se han editado los datos", "estado" => 2));
    }
}


    

    public function frmPassword(){
        $this->obj->loadTemplate("funcionarios/frmPassword");
    }

    public function CambiarPassword(){
        extract($_POST);
        $r=funcionarios_modelo::validarPassActual($password);
        if(is_array($r)){
            $r=funcionarios_modelo::actualizarPassword($Npassword);
            echo json_encode(array("mensaje" => "Password Actualizado", "estado"=>1 ));
        }else{
            echo json_encode(array("mensaje" => "La contraseña ingresada no es correcta", "estado"=>2 ));
        }
    }

    public function reportePDF(){
        $this->obj->funcionarioss=funcionarios_modelo::lista();
        $this->obj->loadTemplate("funcionarios/reportePDF", false);
    }

        
}


