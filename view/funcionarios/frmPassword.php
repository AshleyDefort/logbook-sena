<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">CAMBIAR CONTRASEÑA</h6>
    </div>
    <div class="card-body">

        <form method="post"  class="user" onsubmit="return false">
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" 
                    name="password" placeholder="Ingrese la contraseña antigua" >
                </div>
            </div>
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="Npassword" 
                    name="Npassword" placeholder="Ingrese la contraseña nueva">
                </div>
</div>
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="NCpassword" 
                    name="NCpassword" placeholder="Confirme la contraseña nueva">
                </div>
</div>
           
                
            <input type="hidden" name="id" id="id"
            value="<?php echo $this->cliente["ID_Func"];?>" >
            <input type="submit" name="aceptar" onclick="CambiarPass()" class="btn btn-primary">
             
            
        </form>
        
    </div>
</div>