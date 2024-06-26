<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">REGISTRAR FICHA</h6>
    </div>
    <div class="card-body">
        <form method="post" action="?controller=programas&action=registrar" class="user" onsubmit="return false">
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="ficha" 
                    name="ficha" placeholder="Digite Codigo de Ficha">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="desc" name="desc" placeholder="Descripción de la ficha">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="nom_prog" name="nom_prog" placeholder="Programa" value="<?php echo $this->nombrePrograma; ?>" readonly>
                <input type="hidden" class="form-control form-control-user" id="cod_prog" name="cod_prog" placeholder="Programa" value="<?php echo $this->codPrograma; ?>">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="instructores" name="instructores" placeholder="IDs de instructores a cargo (separados por comas)">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6">
                    <label for="fech_inic">  Fecha de Inicio</label>
                <input type="date" class="form-control form-control-user" id="fech_inic" name="fech_inic" placeholder="Fecha de Inicio">
            </div>
            <div class="col-sm-6">
            <label for="fech_fin">  Fecha de Fin</label>
            <input type="date" class="form-control form-control-user" id="fech_fin" name="fech_fin" placeholder="Fecha de Fin">
        </div>
            </div>
            <input type="submit" name="aceptar" onclick="regFichas()" class="btn btn-primary">
            
            
        </form>
        
    </div>
</div>
