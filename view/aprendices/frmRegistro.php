
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
                
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="Digite su ID">
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
                    <input type="text" name="sexo" class="form-control form-control-user" id="sexo" placeholder="Sexo">
                </div>
               
                <div class="col-sm-6">
                    <select id="rol" name="rol" class="form-control">
                        <optgroup label="rol"></optgroup>
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNC">FUNC</option>
                    </select>
                </div>
            </div>

            <input type="submit" name="aceptar" onclick="regApre()" class="btn btn-primary">
        </form>
    </div>
</div>