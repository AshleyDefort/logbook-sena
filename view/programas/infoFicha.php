<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">ADMINISTRAR APRENDICES</h6>
    </div>
    <div class="card-body">
        <a href="?controller=aprendices&action=frmRegistro&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Registrar Aprendiz </a>
        <?php if (empty($this->aprendiz)): ?>
            <div class="col-12 text-center"><label class="text-center">No hay actas aprendices registrados en esta ficha de formación.</label></div>
    <?php else: ?>
        <a href="?controller=aprendices&action=frmRegistro&ficha=<?php $codFicha=$_GET["id"]; echo $codFicha; ?>" class="btn btn-light"> Registrar Aprendiz </a>
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
    <?php endif; ?>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">ACTAS DE COMPROMISO</h6>
    </div>
    <div class="card-body">
    <?php if (empty($this->actas)): ?>
        <div class="col-12 text-center"><label class="text-center">No hay actas de compromiso creadas.</label></div>
        <?php else: ?>
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
                        <td>
                            <a class='btn btn-secondary' href='?controller=actas&action=generarPDFActa&codActa=<?= $codActa ?>' target='_blank'>Descargar</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>
        
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">LLAMADOS DE ATENCIÓN</h6>
    </div>
    <div class="card-body">
    <?php if (empty($this->actas)): ?>
        <div class="col-12 text-center"><label class="text-center">No hay actas de compromiso creadas.</label></div>
        <?php else: ?>
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
                        <td>
                            <a class='btn btn-secondary' href='?controller=actas&action=generarPDFActa&codActa=<?= $codActa ?>' target='_blank'>Descargar</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>
        
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">OBSERVADOR</h6>
    </div>
    <div class="card-body">
    <?php if (empty($this->actas)): ?>
        <div class="col-12 text-center"><label class="text-center">No hay actas de compromiso creadas.</label></div>
        <?php else: ?>
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
                        <td>
                            <a class='btn btn-secondary' href='?controller=actas&action=generarPDFActa&codActa=<?= $codActa ?>' target='_blank'>Descargar</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>
        
    </div>
</div>
    <?php
                                    
                                    echo '<a href="?controller=main&action=home" class="btn btn-light "> Volver </a>';
                                                        
                                    ?> 