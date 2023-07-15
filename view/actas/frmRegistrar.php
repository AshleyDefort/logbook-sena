<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">ACTA DE COMPROMISO</h6>
    </div>
    <div class="card-body">    
        <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
            <div class="form-group row">
                <div class="col-sm-6">
                    <input type="date" class="form-control form-control-user" id="Bit_Fecha" name="Bit_Fecha" value="<?php
date_default_timezone_set('America/Bogota'); 
echo date("Y-m-d");
?>" >
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
                    <input type="text" class="form-control form-control-user" id="nombres" name="nombres" placeholder="Nombres del aprendiz">
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="apellidos" name="apellidos" placeholder="Apellidos del aprendiz">
                    
                    <input type="hidden" class="form-control form-control-user" id="sexo" name="sexo" placeholder="Apellidos del aprendiz">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="telefono" placeholder="Telefono del aprendiz" name="telefono">
                </div>
                <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo del aprendiz">
                </div>
            </div>
            <div class="form-group row">
            <div class="col-sm-6">
                <label for="fichas" class="form-label">Seleccionar Ficha</label>
                    <select id="fichas" name="fichas" class="form-control">
                    </select>
                </div>
                <div class="col-sm-6">
                <label for="motivoRemision" class="form-label">Motivo Remisión</label>
                    <select id="motivoRemision" name="motivoRemision" class="form-control" onchange="mostrarInput()">
                        <option value="Bajo rendimiento académico">Bajo rendimiento académico</option>
                        <option value="Inasistencia">Inasistencia</option>
                        <option value="Impuntualidad">Impuntualidad</option>
                        <option value="Comportamiento inapropiado">Comportamiento inapropiado</option>
                        <option value="Incumplimiento de normas y reglamentos">Incumplimiento de normas y reglamentos</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                <textarea hidden class="form-control" id="otroMotivoRemision" rows="1" maxlength="500" placeholder="Escriba aquí el motivo de remisión"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6">
                    <label for="descargoApr" class="form-label">Descargo Aprendiz</label>
                    <textarea class="form-control" id="descargoApre" rows="5" maxlength="500"></textarea>
                </div>
                <div class="col-sm-6">
                    <label for="compromisos" class="form-label">Compromisos Adquiridos</label>
                    <textarea class="form-control" id="compromisos" rows="5" maxlength="500"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6">
                    <label for="recomendaciones" class="form-label">Recomendaciones</label>
                    <textarea class="form-control" id="recomendaciones" rows="5" maxlength="500"></textarea>
                </div>
            </div>
            <input type="submit" name="aceptar" onclick="generarActas()" class="btn btn-primary" value="Generar Acta">
            <?php
                                    
                                    echo '<a href="?controller=actas&action=index" class="btn btn-light"> Volver </a>';
                                                        
                                    ?> 
        </form>
    </div>
</div>
