<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Observacion</h6>
    </div>
    <div class="card-body">    
    <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
        
        <div class="form-group row">
        
            <div class="col-sm-6">
                <input type="text" class="form-control " id="id" name="id"  placeholder="No. Identificacion Del Aprendiz">
                
            </div>
            
            <div class="col-sm-6">
            <select class="form-control" name="" id="" >
                        <option disabled selected hidden>Tipo De Observacion</option>
                        <option value="">Comportamental</option>
                        <option value="">Academico</option>
                        <option value="">Presentacion</option>
                    </select>

            </div>
        </div>    
        
            <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                    
                </div>
               
                <div class="col-sm-6">
                
                    </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-12">
                    <textarea name="" id="" cols="0" rows="10" class="col-12 form-control" style="resize:none;"></textarea>
                </div>
                
            </div>
    

            <div class="col-12 text-right">

                <input type="submit" name="aceptar" onclick="regCliente()" class="btn btn-primary col-3 ">
            </div>
             
            
        </form>
        
                           
    </div>
</div>
