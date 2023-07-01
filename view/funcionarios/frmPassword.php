<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">CAMBIAR CONTRASEÑA</h6>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <form method="post" class="user" onsubmit="return false">
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <input type="password" class="form-control form-control-user" id="password" 
                            name="password" placeholder="Ingrese la contraseña antigua">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <input type="password" class="form-control form-control-user" id="Npassword" 
                            name="Npassword" placeholder="Ingrese la contraseña nueva">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <input type="password" class="form-control form-control-user" id="NCpassword" 
                            name="NCpassword" placeholder="Confirme la contraseña nueva">
                        </div>
                    </div>
                    <input type="hidden" name="id" id="id" value="<?php echo $this->cliente["ID_Func"];?>">
                    <input type="submit" name="aceptar" onclick="CambiarPass()" class="btn btn-primary">
                </form>
            </div>
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header py-3 bg-secondary">
                        <h6 class="m-0 font-weight-bold text-light">REQUERIMIENTOS DE CONTRASEÑA</h6>
                    </div>
                    <div class="card-body">
                        <ul>
                            <li>La contraseña debe tener al menos 8 caracteres.</li>
                            <li>Debe contener al menos una letra mayúscula y una minúscula.</li>
                            <li>Debe incluir al menos un número.</li>
                            <li>Debe contener al menos un caractere especial, como !@#$%^&amp;*().</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
