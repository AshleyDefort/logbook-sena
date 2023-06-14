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

    public function index(){
        $limite = 10;
        $total = funcionarios_modelo::Total();
        
        if($total > $limite){
            $secciones = ceil($total/$limite);
        }else{
            $secciones = 1;
        }

        if(isset($_GET["pagina"]) && is_numeric($_GET["pagina"])){
            $pagina = $_GET["pagina"];
        }else{
            $pagina=0;
        }

        $pagina_actual = ($pagina/$limite)+1;
        $this->obj->funcionarioss=funcionarios_modelo::lista($pagina,$limite);
        $this->obj->pag = '';
        if($secciones >=1){
            $this->obj->pag = '<ul class="pagination pagination-sm">';
            for($i=1;$i<=$secciones;$i++){
                if($i != $pagina_actual){
                    $this ->obj->pag .= '<li class="page.item"><a href="?controller=funcionarios&action=index&pagina='.
                    ($limite*($i-1)).'"class="page-link">'.$i.'</a></li>';
                }else{
                    $this->obj->pag .= ' <li class="page-item active" aria-current="page">
                    <span class="page-link">'.$i.'</span></li>';
                }
            }
            $this->obj->pag .= '</ul>';
        }
        $this->obj->tabla = "";
        foreach ($this->obj->funcionarioss as $fila) {//POR CADA FILA QUE EXITE EN funcionarios SE REGISTRA EL VALOR EN LA VARIABLE FILA
            $id = $fila["ID_Func"];
            $this->obj->tabla.= "<tr>";
            $this->obj->tabla.= "<td>".$fila["Fun_Nom"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Ape"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Tel"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Correo"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Rol"]."</td>";//concatenar
            if($_SESSION["rol"]=="ADMIN"){
                $this->obj->tabla.= "<td> 
            <a class='btn btn-primary' href='?controller=funcionarios&action=frmEditar&id=$id'>Editar</a> | 
            <a class='btn btn-danger' onclick='Eliminar1($id)'>Eliminar</a>
                               </td>";}
                        $this->obj->tabla.= "</tr>";
        }
        //var_dump($this->obj->funcionarioss);para comprobar si tienes algún funcionarios de manera anticipada y si lo anterior funciona
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
        $data["doc"]=$doc;
        $data["id"]=$id;
        $data["nombres"]=$nombres;
        $data["apellidos"]=$apellidos;
        $data["telefono"]=$telefono;
        $data["correo"]=$correo;
        $data["password"]=$password;
        $data["direccion"]=$direccion;
        $data["rol"]=$rol;
        $foto = $_FILES['foto']; // Obtener los detalles de la foto

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
            $rutaPorDefecto = "public/img/profile_photo_default.png"; // o asigna un valor predeterminado válido para la columna de la base de datos
            $datosFotoDefault = file_get_contents($rutaPorDefecto); // Leer el contenido de la imagen por defecto
            $data["foto"] = $datosFotoDefault;

        }

        $r=funcionarios_modelo::add($data);
        var_dump($r);
        if($r>0){
            echo json_encode(array("mensaje"=>"Se han registrado los datos", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se han registrado los datos", "estado"=>2));
        }
    }
    public function delete(){
		$id = $_POST["id"];
		$r  = funcionarios_modelo::delete($id);
		if($r > 0){
			header("Location: ?controller=funcionarios&action=index");
		}
	}

    public function validar(){
		extract($_POST);
        $data["doc"]=$doc;
        $data["id"]=$id;
        $data["password"]=$password;
        $r=funcionarios_modelo::validarUsuario($data);
        if(is_array($r)){
            $_SESSION["id"]        =$r["ID_Func"];
            $_SESSION["nombre"]    =$r["Fun_Nom"];
            $_SESSION["apellido"]  =$r["Fun_Ape"]; 
            $_SESSION["rol"]  =$r["Fun_Rol"]; 
            $_SESSION["imagen"]  =$r["Fun_Img"]; 
            $mensaje = "";
            $estado = 1;
            $url="?controller=main&action=home";
            //header("Location: ?controller=main&action=home");   
        }else{
            $mensaje = "Datos incorrectos o Incompletos";
            $estado = 2;
            $url="";
            //echo"Usuario no registrado";
        }
        echo json_encode(array("mensaje" => $mensaje, "estado"=> $estado, "url"=>$url));
    }

      
      

    public function salir(){
        session_destroy();
        header("Location:/Bitacora");
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


