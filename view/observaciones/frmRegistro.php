<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Observación</h6>
    </div>
    <div class="card-body">    
    <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
        
        <div class="form-group row">
        <div class="col-sm-6">
        <input type="date" class="form-control form-control-user" id="FechaObs" name="FechaObs" value="<?php
date_default_timezone_set('America/Bogota'); 
echo date("Y-m-d");
?>" >
                </div>
                <div class="col-sm-5">
                    <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="Digite el número de identificación del aprendiz">
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
                <input type="hidden" class="form-control form-control-user" id="sexo" name="sexo" placeholder="Apellidos del aprendiz">
                <input type="hidden" class="form-control form-control-user" id="telefono" placeholder="Telefono del aprendiz" name="telefono">
                <input type="hidden" class="form-control form-control-user" id="correo" name="correo" placeholder="Correo del aprendiz">
            </div>
            <div class="form-group row">
            <div class="col-sm-6">
                <label for="fichas" class="form-label">Seleccionar Ficha</label>
                    <select id="fichas" name="fichas" class="form-control">
                    </select>
                </div>
                <div class="col-sm-6">
                <label for="observacion" class="form-label">Seleccionar Tipo de Observación</label>
                <select name="observacion" id="observacion" class="form-control">
                        <option value="" selected>Selecciona una opción</option>
                        <option value="Observación de comportamiento">Observación de comportamiento</option>
                        <option value="Observación de habilidades sociales">Observación de habilidades sociales</option>
                        <option value="Observación de rendimiento académico">Observación de rendimiento académico</option>
                        <option value="Observación de participación en clase">Observación de participación en clase</option>
                        <option value="Observación de habilidades de resolución de problemas">Observación de habilidades de resolución de problemas</option>
                        <option value="Observación de creatividad">Observación de creatividad</option>
                        <option value="Observación de trabajo en equipo">Observación de trabajo en equipo</option>
                        <option value="Observación de liderazgo">Observación de liderazgo</option>
                        <option value="Observación de autodisciplina">Observación de autodisciplina</option>
                        <option value="Observación de comunicación">Observación de comunicación</option>
                        <option value="Observación de perseverancia">Observación de perseverancia</option>
                        <option value="Observación de puntualidad">Observación de puntualidad</option>
                        <option value="Observación de iniciativa">Observación de iniciativa</option>
                        <option value="Observación de empatía">Observación de empatía</option>
                        <option value="Observación de adaptabilidad">Observación de adaptabilidad</option>
                        <option value="Observación de organización">Observación de organización</option>
                        <option value="Observación de autoevaluación">Observación de autoevaluación</option>
                        <option value="Observación de toma de decisiones">Observación de toma de decisiones</option>
                        <option value="Observación de habilidades técnicas">Observación de habilidades técnicas</option>
                </select>
                </div>
            </div>      
            <div class="form-group row">
                <div class="col-12">
                    <label for="descripcion" class="form-label">Descripción de la Observación</label>
                    <textarea class="form-control" name="descripcion" id="descripcion" cols="30" rows="5"></textarea>
                </div>
            </div>
            <input type="submit" name="aceptar" id="ok" onclick="regObservacion()" class="btn btn-primary">
            <a href="?controller=observaciones&action=index" class="btn btn-secondary"> Volver </a><br>
             
            
        </form>
        
                           
    </div>
</div>