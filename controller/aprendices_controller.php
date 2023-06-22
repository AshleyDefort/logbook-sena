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
        $limite = 10;
        $total = aprendices_modelo::Total();
        
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
        $this->obj->aprendicess=aprendices_modelo::lista($pagina,$limite);
        $this->obj->pag = '';
        if($secciones >=1){
            $this->obj->pag = '<ul class="pagination pagination-sm">';
            for($i=1;$i<=$secciones;$i++){
                if($i != $pagina_actual){
                    $this ->obj->pag .= '<li class="page.item"><a href="?controller=aprendices&action=index&pagina='.
                    ($limite*($i-1)).'"class="page-link">'.$i.'</a></li>';
                }else{
                    $this->obj->pag .= ' <li class="page-item active" aria-current="page">
                    <span class="page-link">'.$i.'</span></li>';
                }
            }
            $this->obj->pag .= '</ul>';
        }
        $this->obj->tabla = "";
        foreach ($this->obj->aprendicess as $fila) {//POR CADA FILA QUE EXITE EN aprendices SE REGISTRA EL VALOR EN LA VARIABLE FILA
            $id = $fila["Id_Apre"];
            $this->obj->tabla.= "<tr>";
            $this->obj->tabla.= "<td>".$fila["Id_Apre"]."</td>";
            $this->obj->tabla.= "<td>".$fila["Apre_Nom"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Apre_Ape"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Apre_Tel"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Apre_Correo"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Apre_Sexo"]."</td>";//concatenar
            $this->obj->tabla.= "<td>".$fila["Apre_Rol"]."</td>";//concatenar
            if($_SESSION["rol"]=="ADMIN"){
                $this->obj->tabla.= "<td> 
            <a class='btn btn-primary' href='?controller=aprendices&action=frmEditar&id=$id'>Editar</a> | 
            <a class='btn btn-danger' onclick='Eliminar1($id)'>Eliminar</a>
                               </td>";}
                        $this->obj->tabla.= "</tr>";
        }
        //var_dump($this->obj->aprendicess);para comprobar si tienes algún aprendices de manera anticipada y si lo anterior funciona
        $this->obj->loadTemplate("aprendices/index");
    }

    public function frmRegistro(){
        //if($_SESSION['rol'] !="ADMIN"){
         //   header("Location: ?controller=aprendices&action=index");
        //}
        $this->obj->loadTemplate("aprendices/frmregistro");
    }
	
    
    public function frmEditar(){
        $id = $_GET["id"];
        $this->obj-> aprendices = aprendices_modelo::findById($id);
        $this->obj-> loadtemplate("aprendices/frmEditar");
    }
 
    public function registrar(){
        extract($_POST);
        $data["id"]=$id;
        $data["nombres"]=$nombres;
        $data["apellidos"]=$apellidos;
        $data["telefono"]=$telefono;
        $data["correo"]=$correo;
        $data["sexo"]=$sexo;
        $data["rol"]=$rol;

        $r=aprendices_modelo::add($data);
        var_dump($r);
        if($r>0){
            echo json_encode(array("mensaje"=>"Se han registrado los datos", "estado"=>1));
        }else{
            echo json_encode(array("mensaje"=>"ERROR: NO se han registrado los datos", "estado"=>2));
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