<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">ACTA DE COMPROMISO</h6>
    </div>
    <div class="card-body">    
    <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
        
        <div class="form-group row">
        <div class="col-sm-6">
        <input type="date" class="form-control form-control-user" id="Bit_Fecha" name="Bit_Fecha" placeholder="Ingresar Fecha">
                </div>
                <div class="col-sm-5">
                    <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="Digite Id Aprendiz">
                </div>
                <div class="col-sm-1">
                    <a href="?controller=observaciones&action=buscarapr">
                        <i class="fas fa-search fa-2x"></i></div>
                    </a>
            </div>    
        <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" 
                    name="nombres" placeholder="Nombres">
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
                    <input type="text" name="direccion" class="form-control form-control-user" id="direccion" placeholder="Direccion">
                </div>
            </div>


            
            <input type="submit" name="aceptar" onclick="generarActas()" class="btn btn-primary" value="Generar Acta">
             
            
        </form>
        
                           
    </div>
</div>