<!--CARTITAS DE ARRIBA:)-->
<div class="row">

<!-- Earnings (Monthly) Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Total Aprendices</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalActas"><?php echo $this->totalAprendices ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-users fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Earnings (Monthly) Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        ACTAS DE COMPROMISO</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $this->totalActas ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-file-text fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Earnings (Monthly) Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Llamados de atención
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $this->totalLlamados ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-exclamation-circle fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Pending Requests Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                        Observaciones</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo $this->totalObservaciones ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-sticky-note fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--INFORMACIÓN DE LA FICHA-->
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
        role="button" aria-expanded="true" aria-controls="collapseCardExample">
        <h6 class="m-0 font-weight-bold text-white">INFORMACIÓN DE LA FICHA  <i class="fas fa-pencil-alt ml-2" onClick="habilitarCampos(event)"></i></h6>
    </a>
    <!-- Card Content - Collapse -->
    <div class="collapse show" id="collapseCardExample">
        <div class="card-body">
            <form action="?controller=programas&action=edit" method="post" class="user" onsubmit="return false">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="numFicha" class="form-label">Ficha de Caracterización</label>
                        <input type="number" name="numFicha" id="numFicha" class="form-control form-control-user" readonly value="<?php echo $this->infoFicha[0]["cod_ficha"]    ?>">
                    </div>
                    <div class="col-sm-6">
                    <label for="descFicha" class="form-label">Descripción de la Ficha</label>
                        <input type="text" name="descFicha" id="descFicha" class="form-control form-control-user" readonly value="<?php echo $this->infoFicha[0]["Desc_Fich"]    ?>">
                    </div>
                </div>
                <div class="form-group row">
                <div class="col-sm-6">
                        <label for="inicioFicha" class="form-label">Inicio de la Formación</label>
                        <input type="date" name="inicioFicha" id="inicioFicha" class="form-control form-control-user" readonly value="<?php echo $this->infoFicha[0]["fechaIni_Fich"]    ?>">
                    </div>
                    <div class="col-sm-6">
                    <label for="finFicha" class="form-label">Fin de la Formación</label>
                        <input type="date" name="finFicha" id="finFicha" class="form-control form-control-user" readonly value="<?php echo $this->infoFicha[0]["fechaFin_Fich"]    ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12">
                    <label for="instructoresFicha" class="form-label">Instructores</label>
                    <input type="hidden" name="idInstructores" id="idInstructores" class="form-control form-control-user" placeholder="Dígite los IDs de los instructores a agregar separados por comas">
                    <div class="table-responsive">
                        <table class="table table-bordered mt-3" id="tablaInstructores">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre Completo</th>
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($this->infoFicha as $funcionario): 
                                    $nombreCompleto = $funcionario["Fun_Nom"]." ".$funcionario["Fun_Ape"]
                                    ?>
                                    <tr>
                                        <td><?php echo $funcionario["ID_Func"]; ?></td>
                                        <td style="text-transform:uppercase;"><?php echo $nombreCompleto; ?></td>
                                        <td style="text-transform:lowercase;"><?php echo $funcionario["Fun_Correo"]; ?></td>
                                        <td><?php echo $funcionario["Fun_Tel"]; ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" name="enviar" id="enviar"  onclick="edtFicha()" class="btn btn-primary text-light">
                    <a onclick="cancelar()" class="btn btn-secondary text-light" id ="cancelar" hidden>Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!--APRENDICES-->
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample1" class="d-block card-header py-3" data-toggle="collapse"
        role="button" aria-expanded="true" aria-controls="collapseCardExample1">
        <h6 class="m-0 font-weight-bold text-white">ADMINISTRAR APRENDICES</h6>
    </a>
    <!-- Card Content - Collapse -->
    <div class="collapse show" id="collapseCardExample1">
        <div class="card-body">
            <a href="?controller=aprendices&action=frmRegistro&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Registrar Aprendiz </a>
            <?php if (empty($this->aprendiz)): ?>
                <div class="col-12 text-center"><label class="text-center">No hay actas aprendices registrados en esta ficha de formación.</label></div>
        <?php else: ?>
            <div class="table-responsive">
                <table class="table table-bordered mt-3">
                    <tr>
                        <th>NOMBRE</th>
                        <th>APELLIDO</th>
                        <th>TELEFONO</th>
                        <th>CORREO</th>
                    </tr>
                    <?php foreach ($this->aprendiz as $fila): ?>
                        <tr>
                            <td><?= $fila["Apre_Nom"] ?></td>
                            <td><?= $fila["Apre_Ape"] ?></td>
                            <td><?= $fila["Apre_Tel"] ?></td>
                            <td><?= $fila["Apre_Correo"] ?></td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        <?php endif; ?>
        </div>
    </div>
</div>
<!--ACTAS DE COMPROMISO-->
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample2" class="d-block card-header py-3" data-toggle="collapse"
        role="button" aria-expanded="true" aria-controls="collapseCardExample2">
        <h6 class="m-0 font-weight-bold text-white">ACTAS DE COMPROMISO</h6>
    </a>
    <!-- Card Content - Collapse -->
    <div class="collapse show" id="collapseCardExample2">
        <div class="card-body">
            <a href="?controller=actas&action=frmActas&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Crear Acta </a>
            <?php if (empty($this->actas)): ?>
        <div class="col-12 text-center"><label class="text-center">No hay actas de compromiso creadas.</label></div>
        <?php else: ?>
            <div class="table-responsive">
                <table class="table table-bordered mt-3">
                    <tr>
                        <th>NOMBRE</th>
                        <th>FECHA</th>
                        <th>MOTIVO DE REMISIÓN</th>
                        <th>ARCHIVO</th>
                    </tr>
                    <?php foreach ($this->actas as $fila): ?>
                        <?php
                        $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"];
                        $codActa = $fila["codActa"];
                        ?>
                        <tr>
                            <td><?= $nombreCompleto ?></td>
                            <td><?= $fila["actaFecha"] ?></td>
                            <td><?= $fila["actaMotivoRemision"] ?></td>
                            <td class='text-center'>
                                <a class='fas fa-file-pdf text-gray-700' href='?controller=actas&action=generarPDFActa&codActa=<?php echo $codActa ?>' target='_blank'></a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        <?php endif; ?>
        </div>
    </div>
</div>
<!--LLAMADOS DE ATENCIÓN-->
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample3" class="d-block card-header py-3" data-toggle="collapse"
        role="button" aria-expanded="true" aria-controls="collapseCardExample3">
        <h6 class="m-0 font-weight-bold text-white">LLAMADOS DE ATENCIÓN</h6>
    </a>
    <div class="collapse show" id="collapseCardExample3">
        <div class="card-body">
        <a href="?controller=Atencion&action=frmRegistrar&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Registrar Llamado de Atención </a>
                <?php if (empty($this->llamados)): ?>
            <div class="col-12 text-center"><label class="text-center">No hay llamados de atención registrados.</label></div>
            <?php else: ?>
                <div class="table-responsive">
                    <table class="table table-bordered mt-3">
                            <thead>
                                <th>NOMBRE APRENDIZ</th>
                                <th>FECHA</th>
                                <th>MOTIVO DE REMISIÓN</th>
                                <th>ARCHIVO</th>
                             </thead>
                             <tbody>
                                 <?php foreach ($this->llamados as $fila): ?>
                                     <?php
                                     $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"];
                                     $codLlamado = $fila["codLlamado"];
                                     ?>
                                     <tr>
                                         <td><?= $nombreCompleto ?></td>
                                         <td><?= $fila["atencionFecha"] ?></td>
                                         <td><?= $fila["llamadoMotivo"] ?></td>
                                         <td class='text-center'>
                                         <a class='fas fa-file-pdf text-gray-700' href='?controller=Atencion&action=generarPDFAtencion&codLlamado=<?= $codLlamado ?>' target='_blank'></a>
    
                                         </td>
                                     </tr>
                                 <?php endforeach; ?>
                             </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>
<!--OBSERVADOR-->
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample4" class="d-block card-header py-3" data-toggle="collapse"
        role="button" aria-expanded="true" aria-controls="collapseCardExample4">
        <h6 class="m-0 font-weight-bold text-white">OBSERVADOR</h6>
    </a>
    <div class="collapse show" id="collapseCardExample4">
        <div class="card-body">
        <a href="?controller=observaciones&action=frmRegistro&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Registrar Observación </a>
                <?php if (empty($this->observaciones)): ?>
            <div class="col-12 text-center"><label class="text-center">No hay observaciones registradas.</label></div>
            <?php else: ?>
                <div class="table-responsive">
                    <table class="table table-bordered mt-3">
                            <thead>
                                <th>NOMBRE APRENDIZ</th>
                                <th>FECHA</th>
                                <th>TÍTULO</th>
                                <th>ACCIONES</th>
                             </thead>
                             <tbody>
                                 <?php foreach ($this->observaciones as $fila): ?>
                                     <?php
                                     $nombreCompleto = $fila["Apre_Nom"] . " " . $fila["Apre_Ape"];
                                     $codObs = $fila["CodObs"];
                                     $codObs         = $fila["CodObs"];
                                    $ficha          = $fila["fk_ficha"];
                                    $fecha          = $fila["FechaObs"];
                                    $titulo         = $fila["TituloObs"];
                                    $descripcion    = $fila["DescripcionObs"];
                                     ?>
                                     <tr>
                                         <td><?= $nombreCompleto ?></td>
                                         <td><?= $fila["FechaObs"] ?></td>
                                         <td><?= $fila["TituloObs"] ?></td>
                                         <td class='text-center'>
                                         <a class='fas fa-eye text-primary open-modal' style='text-decoration:none;' href='#' data-nombre='<?php echo $nombreCompleto ?>' data-ficha='<?php echo $ficha ?>' data-fecha='<?php echo $fecha ?>' data-titulo='<?php echo $titulo ?>' data-descripcion='<?php echo $descripcion ?>'></a> | 
                                            <a class='fas fa-trash text-danger' onclick='eliminarObservacion(<?php echo $codObs ?>)'></a>
                                        </td>
                                     </tr>
                                 <?php endforeach; ?>
                             </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>