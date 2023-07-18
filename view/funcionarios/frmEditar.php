<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">EDITAR FUNCIONARIO</h6>
    </div>
    <div class="card-body">

        <form method="post" action="?controller=funcionarios&action=edit" class="user" onsubmit="return false">
        <div class="col-sm-12 d-flex flex-column align-items-center">
        <div style="width: 10em; height: 10em; overflow: hidden;">
        <?php
        $imagen = base64_encode($this->funcionarios["Fun_Img"]);
        $extension = pathinfo($imagen, PATHINFO_EXTENSION);
        $base64 = 'data:image/' . $extension . ';base64,' . $imagen;
        ?>
        <img src="<?php echo $base64; ?>" alt="" class="img-fluid img-thumbnail" style="max-width: 100%; max-height: 100%; display: block;" id="img-profile">
        </div>
        <div class="mt-2" style="display:none">
        <button type="button" id="btn-foto" class="btn btn-sm btn-primary">Subir foto</button>
            <input id="file-input" type="file" style="display:none" accept="image/*">
        </div>
        <div class="mt-2" id="add_labels"></div>
</div>
        <div class="form-group row">
        <div class="col-sm-6">
                    <select id="doc" name="doc" class="form-control">
                    <option value="CC"<?php if ($this->funcionarios["Fun_Tip_Doc"] == "CC") echo " selected"; ?>>Cédula de Ciudadania</option>
                    <option value="TI"<?php if ($this->funcionarios["Fun_Tip_Doc"] == "TI") echo " selected"; ?>>Tarjeta de Identidad</option>
                    <option value="PEP"<?php if ($this->funcionarios["Fun_Tip_Doc"] == "PEP") echo " selected"; ?>>Permiso Especial de Permanencia</option>
                    <option value="CE"<?php if ($this->funcionarios["Fun_Tip_Doc"] == "CE") echo " selected"; ?>>Cédula de Extranjería</option>
                    <option value="PPP"<?php if ($this->funcionarios["Fun_Tip_Doc"] == "PPP") echo " selected"; ?>>Permiso por Protección Temporal</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" id="id" name="id" 
                    placeholder="Id" value="<?php echo $this->funcionarios["ID_Func"]; ?>">
                </div>
                
            </div> 
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" 
                    name="nombres" placeholder="Nombres" value="<?php echo $this->funcionarios["Fun_Nom"];?>">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos" value="<?php echo $this->funcionarios["Fun_Ape"];?>">
                </div>
               
            </div>
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="telefono" placeholder="Telefono" name="telefono" value="<?php echo $this->funcionarios["Fun_Tel"];?>">
                </div>
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo" value="<?php echo $this->funcionarios["Fun_Correo"];?>">
                </div>
               
            </div>
            <div class="form-group row">
            <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="direccion" name="direccion" placeholder="Direccion" value="<?php echo $this->funcionarios["Fun_Direcc"];?>">
                </div>
                <div class="col-sm-6">
                    <select id="rol" name="rol" class="form-control">
                    <optgroup label="Rol"></optgroup>
                    <option value="ADMIN"<?php if ($this->funcionarios["Fun_Rol"] == "ADMIN") echo " selected"; ?>>ADMIN</option>
            <option value="FUNC"<?php if ($this->funcionarios["Fun_Rol"] == "FUNC") echo " selected"; ?>>FUNC</option>
                    </select>
                </div>
            </div>
            <input type="hidden" name="id" id="id"
            value="<?php echo $this->funcionarios["ID_Func"];?>" >
            <input type="submit" name="aceptar" onclick="edtFuncionario()" class="btn btn-primary">
            <a href="?controller=funcionarios&action=index" class="btn btn-secondary"> Volver </a><br>
            
        </form>
        
    </div>
</div>
