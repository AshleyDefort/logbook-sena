<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">EDITAR CLIENTE</h6>
    </div>
    <div class="card-body">

        <form method="post" action="?controller=funcionarios&action=edit" class="user" onsubmit="return false">
        <div class="form-group row">
                <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" id="id" name="id" 
                    placeholder="Id" value="<?php echo $this->funcionarios["ID_Func"]; ?>">
                </div>
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" 
                    name="nombres" placeholder="Nombres" value="<?php echo $this->funcionarios["Fun_Nom"];?>">
                </div>
            </div> 
            <div class="form-group row">
                
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos" value="<?php echo $this->funcionarios["Fun_Ape"];?>">
                </div>
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="telefono" placeholder="Telefono" name="telefono" value="<?php echo $this->funcionarios["Fun_Tel"];?>">
                </div>
            </div>
            <div class="form-group row">
            
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo" value="<?php echo $this->funcionarios["Fun_Correo"];?>">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="direccion" name="direccion" placeholder="Direccion" value="<?php echo $this->funcionarios["Fun_Direcc"];?>">
                </div>
            </div>
            <div class="form-group row">
            <div class="col-sm-6">
                    <select id="cargo" name="cargo" class="form-control">
                    <optgroup label="Cargo"></optgroup>
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNC">FUNC</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <select id="rol" name="rol" class="form-control">
                    <optgroup label="Rol"></optgroup>
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNC">FUNC</option>
                    </select>
                </div>
            </div>
            <input type="hidden" name="id" id="id"
            value="<?php echo $this->funcionarios["ID_Func"];?>" >
            <input type="submit" name="aceptar" onclick="edtcliente()" class="btn btn-primary">
             
            
        </form>
        
    </div>
</div>
