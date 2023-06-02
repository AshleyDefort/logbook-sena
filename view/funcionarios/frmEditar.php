<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">EDITAR FUNCIONARIO</h6>
    </div>
    <div class="card-body">

        <form method="post" action="?controller=funcionarios&action=edit" class="user" onsubmit="return false">
        <div class="form-group row">
        <div class="col-sm-6">
                    <select id="doc" name="doc" class="form-control" value="<?php echo $this->funcionarios["Fun_Tip_Doc"];?>">>
                        <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                        <option value="Tarjeta de Identidad">Tarjeta de Idetidad</option>
                        <option value="Permiso Especial de Permanencia">Permiso Especial de Permanencia</option>
                        <option value="Cedula de Extrangeria">Cedula de Extrangeria</option>
                        <option value="Permiso por Protección Temporal">Permiso por Protección Temporal</option>
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
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNC">FUNC</option>
                    </select>
                </div>
            </div>
            <input type="hidden" name="id" id="id"
            value="<?php echo $this->funcionarios["ID_Func"];?>" >
            <input type="submit" name="aceptar" onclick="edtFuncionario()" class="btn btn-primary">
             
            
        </form>
        
    </div>
</div>
