<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Llamado de atención</h6>
    </div>
    <div class="card-body">    
    <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
        
        <div class="form-group row">
                <div class="col-sm-5">
                    <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="Digite Id Aprendiz">
                </div>
                <div class="col-sm-1">
                    <img type="submit" src="public/img/buscar.png" onclick="buscar()">
                </div>
            </div>    
        <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="nombres" 
                    name="nombres" placeholder="Nombres" >
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos">
                </div>
            </div>
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="programa" placeholder="PROGRAMA" name="programa">
                </div>
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo">
                </div>
</div>


            <input type="submit" name="aceptar" id="ok" class="btn btn-primary">
             
            
        </form>
        
                           
    </div>
</div>
