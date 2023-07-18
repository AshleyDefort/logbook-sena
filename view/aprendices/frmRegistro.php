
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">REGISTRAR APRENDICES</h6>
    </div>
    <div class="card-body">
        <form method="post" action="?controller=aprendices&action=registrar" class="user" onsubmit="return false" enctype="multipart/form-data">
            <div class="form-group row">
                <div class="col-sm-12 d-flex flex-column align-items-center">
                  
                   
                    <div class="mt-2" id="add_labels"></div>
                </div>
            </div>
            <div class="form-group row">
                
                <div class="col-sm-5">
                    <input type="number" class="form-control form-control-user" id="id" name="id" placeholder="Digite su ID">
                </div>
                <div class="col-sm-6" hidden>
                <label for="fichas" class="form-label">Seleccionar Ficha</label>
                    <select id="fichas" name="fichas" class="form-control">
                    </select>
                </div>
                <div class="col-sm-1">
                    <img type="submit" src="public/img/buscar.png" onclick="buscar2()">
                </div>
                <div class="col-sm-6">
                <input type="number" class="form-control form-control-user" id="ficha" name="ficha" placeholder="Dígite el número de ficha (Opcional)" <?php 
                if ($this->ficha!="") {
                    echo 'value="' . $this->ficha . '" readonly';
                } ?>>
    
    
    
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" name="nombres" placeholder="Nombres">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="telefono" placeholder="Telefono" name="telefono">
                </div>
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6">
                <select id="sexo" name="sexo" class="form-control">
                        <optgroup label="Sexo"></optgroup>
                            <option value="FEMENINO">Femenino</option>
                            <option value="MASCULINO">Masculino</option>
                        </optgroup>
                    </select>
                </div>
               
                <div class="col-sm-6">
                    <select id="rol" name="rol" class="form-control">
                        <optgroup label="Rol"></optgroup>
                        <option value="APRENDIZ">Aprendiz</option>
                        <option value="LÍDER">Líder</option>
                        <option value="COLÍDER">Colíder</option>
                </select>
                </div>
            </div>

            <input type="submit" name="aceptar" onclick="regApre()" class="btn btn-primary">
        </form>
    </div>
</div>