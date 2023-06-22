<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Observacion</h6>
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
                <img type="submit" src="public/img/buscar.png" onclick="buscar2()">
                    </div>
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
            <input type="submit" name="aceptar" id="ok" onclick="regCliente()" class="btn btn-primary">
             
            
        </form>
        
                           
    </div>
<<<<<<< HEAD
</div>
=======
</div>
>>>>>>> df4d04b79b7c4b6a7f807bc1ca5f7e76f9f04e49
