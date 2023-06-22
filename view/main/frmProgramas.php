<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">REGISTRAR PROGRAMA</h6>
    </div>
    <div class="card-body">
        <form method="post" action="?controller=main&action=registrar" class="user" onsubmit="return false">
            <div class="form-group row">
                <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" id="codigo" name="codigo" placeholder="Codigo del Programa">
                </div>
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="descripcion" name="descripcion" placeholder="Nombre del Programa">
                </div>
                
            </div>
            <input type="submit" name="aceptar" onclick="regPrograma()" class="btn btn-primary">
            <?php
                                    
                                    echo '<a href="?controller=programas&action=index" class="btn btn-light"> Volver </a>';
                                                        
                                    ?>      
        </form>
        
    </div>
</div>