<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">REGISTRAR FUNCIONARIO</h6>
    </div>
    <div class="card-body">
        <form method="post" action="?controller=funcionarios&action=registrar" class="user" onsubmit="return false" enctype="multipart/form-data">
            <div class="form-group row">
                <div class="col-sm-12 d-flex flex-column align-items-center">
                    <div style="width: 10em; height: 10em; overflow: hidden;">
                        <img src="public/img/profile_photo_default.png" alt="" class="img-fluid img-thumbnail" style="max-width: 100%; max-height: 100%; display: block;" id="img-profile">
                    </div>
                    <div class="mt-2">
                        <button type="button" id="btn-foto" class="btn btn-sm btn-primary">Subir foto</button>
                        <input id="file-input" type="file" style="display:none" accept="image/*" name="foto">
                    </div>
                    <div class="mt-2" id="add_labels"></div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6">
                    <select id="doc" name="doc" class="form-control">
                        <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                        <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                        <option value="Permiso Especial de Permanencia">Permiso Especial de Permanencia</option>
                        <option value="Cedula de Extrangeria">Cedula de Extrangeria</option>
                        <option value="Permiso por Protección Temporal">Permiso por Protección Temporal</option>
                    </select>
                </div>
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
                    <input type="password" name="password" class="form-control form-control-user" id="password" placeholder="Contraseña">
                </div>
                <div class="col-sm-6">
                    <input type="text" name="direccion" class="form-control form-control-user" id="direccion" placeholder="Direccion">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6">
                    <select id="rol" name="rol" class="form-control">
                        <optgroup label="rol"></optgroup>
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNC">FUNC</option>
                    </select>
                </div>
            </div>

            <input type="submit" name="aceptar" onclick="regCliente()" class="btn btn-primary">
        </form>
    </div>
</div>

<script>
    document.getElementById("btn-foto").addEventListener('click', function() {
        document.getElementById("file-input").click();
    });

    document.getElementById("file-input").addEventListener('change', function() {
        let pos = this.files.length - 1;
        let filename = this.files[pos].name;
        document.getElementById("add_labels").textContent = filename;
        let imagen = document.getElementById("img-profile");
        imagen.src = URL.createObjectURL(this.files[pos]);
    });
</script>
