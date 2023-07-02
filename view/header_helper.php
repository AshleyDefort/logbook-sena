<?php
function getProfileData() {
    require_once "model/funcionarios_modelo.php";
    $id = $_SESSION['id'];
    if (isset($_SESSION["id"])) {
        $funcionario = funcionarios_modelo::findById($id);
        return $funcionario;
    }
    return null;
}
?>