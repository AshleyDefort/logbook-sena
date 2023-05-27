<?php
require_once "model/cliente_modelo.php";
class cliente_controller
{
    function __construct(){
        //if (!isset($_SESSION["id"])) {
            //header("Location: /mvc_Brayan");
        //}
        $this->obj = new template();
    }

    public function index(){
        $limite = 3;
        $total = cliente_modelo::Total();
        
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
        $this->obj->clientes=cliente_modelo::lista($pagina,$limite);
        $this->obj->pag = '';
        if($secciones >=1){
            $this->obj->pag = '<ul class="pagination pagination-sm">';
            for($i=1;$i<=$secciones;$i++){
                if($i != $pagina_actual){
                    $this ->obj->pag .= '<li class="page.item"><a href="?controller=cliente&action=index&pagina='.
                    ($limite*($i-1)).'"class="page-link">'.$i.'</a></li>';
                }else{
                    $this->obj->pag .= ' <li class="page-item active" aria-current="page">
                    <span class="page-link">'.$i.'</span></li>';
                }
            }
            $this->obj->pag .= '</ul>';
        }
        $this->obj->tabla = "";
        foreach ($this->obj->clientes as $fila) {//POR CADA FILA QUE EXITE EN CLIENTE SE REGISTRA EL VALOR EN LA VARIABLE FILA
            $id = $fila["ID_Func"];
            $this->obj->tabla.= "<tr>";
            $this->obj->tabla.= "<td>".$fila["Fun_Nom"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Ape"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Tel"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Correo"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Fun_Rol"]."</td>";//concatenar
            if($_SESSION["rol"]=="ADMIN"){
                $this->obj->tabla.= "<td> 
            <a class='btn btn-primary' href='?controller=cliente&action=frmEditar&id=$id'>Editar</a> | 
            <a class='btn btn-danger' href='?controller=cliente&action=delete&id=$id'>Eliminar</a>
                               </td>";}
                        $this->obj->tabla.= "</tr>";
        }
        //var_dump($this->obj->clientes);para comprobar si tienes algún cliente de manera anticipada y si lo anterior funciona
        $this->obj->loadTemplate("cliente/index");
    }

    public function frmRegistro(){
        if($_SESSION['rol'] !="ADMIN"){
            header("Location: ?controller=cliente&action=index");
        }

        $this->obj->loadTemplate("cliente/frmregistro");
    }

    public function frmEditar(){
        $id = $_GET["id"];
        $this->obj-> cliente = cliente_modelo::findById($id);
        $this->obj-> loadtemplate("cliente/frmEditar");
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
    $data["cargo"]=$cargo;
    $data["rol"]=$rol;
    $r=cliente_modelo::add($data);
    if($r>0){
        echo json_encode(array("mensaje"=>"se registró", "estado"=>1));
    }else{
        echo json_encode(array("mensaje"=>"ERROR: NO se registró", "estado"=>2));
    }
    }
    public function delete(){
		$id = $_GET["id"];
		$r  = cliente_modelo::delete($id);
		if($r > 0){
			header("Location: ?controller=cliente&action=index");
		}
	}

    public function validar(){
		extract($_POST);
        $data["doc"]=$doc;
        $data["id"]=$id;
        $data["correo"]=$correo;
        $data["password"]=$password;
        $r=cliente_modelo::validarUsuario($data);
        if(is_array($r)){
            $_SESSION["id"]        =$r["ID_Func"];
            $_SESSION["nombre"]    =$r["Fun_Nom"];
            $_SESSION["apellido"]  =$r["Fun_Ape"]; 
            $_SESSION["rol"]  =$r["Fun_Rol"]; 
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
    header("Location: /Bitacora-master");
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
        $data["cargo"]=$cargo;
        $data["rol"]=$rol;
        $r=cliente_modelo::edit($data);
        if($r>0){
            echo json_encode(array("mensaje"=>"se editó", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se editó", "estado"=>2));
        }
        }

        public function frmPassword(){
            $this->obj->loadTemplate("cliente/frmPassword");
        }

        public function CambiarPassword(){
            extract($_POST);
            $r=cliente_modelo::validarPassActual($password);
            if(is_array($r)){
                $r=cliente_modelo::actualizarPassword($Npassword);
                echo json_encode(array("mensaje" => "Password Actualizado", "estado"=>1 ));
            }else{
                echo json_encode(array("mensaje" => "El password no coincide con el 
                registrado en la BD", "estado"=>2 ));
            }
        }

        public function reportePDF(){
            $this->obj->clientes=cliente_modelo::lista();
            $this->obj->loadTemplate("cliente/reportePDF", false);
        }

        
        }


