<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">EDITAR APRENDIZ</h6>
    </div>
    <div class="card-body">

        <form method="post" action="?controller=aprendices&action=edit" class="user" onsubmit="return false">
    
        <div class="form-group row">
                <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" id="id" name="id" 
                    placeholder="Id" value="<?php echo $this->aprendices["Id_Apre"]; ?>" >
                </div>
                <div class="col-sm-6">
                    <select id="sexo" name="sexo" class="form-control mt-1">
                    <optgroup label="Sexo"></optgroup>
                    <option value="MASCULINO"<?php if ($this->aprendices["Apre_Sexo"] == "MASCULINO") echo " selected"; ?>>Masculino</option>
                    <option value="FEMENINO"<?php if ($this->aprendices["Apre_Sexo"] == "FEMENINO") echo " selected"; ?>>Femenino</option>
                    </select>
                </div>
            </div> 
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" 
                    name="nombres" placeholder="Nombres" value="<?php echo $this->aprendices["Apre_Nom"];?>">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos" value="<?php echo $this->aprendices["Apre_Ape"];?>">
                </div>
               
            </div>
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="telefono" placeholder="Telefono" name="telefono" value="<?php echo $this->aprendices["Apre_Tel"];?>">
                </div>
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo" value="<?php echo $this->aprendices["Apre_Correo"];?>">
                </div>
               
            </div>
            <input type="hidden" name="id" id="id"
            value="<?php echo $this->aprendices["Id_Apre"];?>" >
            <input type="submit" name="aceptar" onclick="edtAprendiz()" class="btn btn-primary">
            <a href="?controller=aprendices&action=index" class="btn btn-secondary"> Volver </a><br>
            
        </form>
        
    </div>
</div>
