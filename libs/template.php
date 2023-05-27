<?php
class template{
    public function loadTemplate($section, $eCompleta = true){
        if ($eCompleta){
            require_once "view/header.php";
            require_once "view/$section.php";
            require_once "view/footer.php";        
        }else{
            require_once"view/$section.php";
        }
    }
}