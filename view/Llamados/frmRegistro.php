<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">LLAMADO DE ATENCIÓN</h6>
    </div>
    <div class="card-body">    
        <form method="post" action="?controller=observaciones&action=crear" class="user" onsubmit="return false">
            <div class="form-group row">
                <div class="col-sm-6">
                    <input type="date" class="form-control form-control-user" id="fechaLlamado" name="Bit_Fecha" value="<?php
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
                <label for="motivoRemision" class="form-label">Motivo</label>
                    <select id="motivoRemision" name="motivoRemision" class="form-control" onchange="mostrarInputMotivo()">
                         <option value="Impuntualidad">Impuntualidad</option>
                        <option value="Incumplimiento de tareas asignadas">Incumplimiento de tareas asignadas</option>
                        <option value="Falta de respeto hacia los compañeros">Falta de respeto hacia los compañeros</option>
                        <option value="Uso inadecuado del uniforme">Uso inadecuado del uniforme</option>
                        <option value="Uso inadecuado de recursos del SENA">Uso inadecuado de recursos del SENA</option>
                        <option value="Bajo rendimiento académico">Bajo rendimiento académico</option>
                        <option value="Falta de compromiso con el programa de formación">Falta de compromiso con el programa de formación</option>
                        <option value="Violación del reglamento interno del SENA">Violación del reglamento interno del SENA</option>
                        <option value="Comportamiento disruptivo en el aula">Comportamiento disruptivo en el ambiente de formación</option>
                        <option value="Falta de ética profesional">Falta de ética profesional</option>
                        <option value="Ausencia injustificada en actividades programadas">Ausencia injustificada en actividades programadas</option>
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
                <label for="accionTomada" class="form-label">Acciones Tomadas</label>
                    <select id="accionTomada" name="accionTomada" class="form-control" onchange="mostrarInputAccion()">
                        <option value="Firmar un acta de compromiso">Firmar un acta de compromiso</option>
                        <option value="Realización de una charla informativa">Realización de una charla informativa</option>
                        <option value="Solicitud de mejora del comportamiento">Solicitud de mejora del comportamiento</option>
                        <option value="Realización de actividad de refuerzo">Realización de actividad de refuerzo</option>
                        <option value="Asistir a un taller ofrecido por Bienestar al Aprendiz para mejorar en el aspecto mencionado">Asistir a un taller ofrecido por Bienestar al Aprendiz para mejorar en el aspecto mencionado</option>
                        <option value="Suspensión temporal de participación en actividades">Suspensión temporal de participación en actividades</option>
                        <option value="Remisión a instancias superiores">Remisión a instancias superiores</option>
                        <option value="Terminación del programa de formación">Terminación del programa de formación</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                <textarea hidden class="form-control" id="otraAccionTomada" rows="1" maxlength="500" placeholder="Escriba aquí la acción tomada"></textarea>
                </div>
            </div>
            <input type="submit" name="aceptar" onclick="generarLlamadoDeAtencion()" class="btn btn-primary" value="Registrar">
            <?php
                                    
                                    echo '<a href="?controller=atencion&action=index" class="btn btn-light"> Volver </a>';
                                                        
                                    ?> 
        </form>
    </div>
</div>
