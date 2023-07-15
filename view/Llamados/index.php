<div class="card shadow mb-4">
<div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-light">LLAMADOS DE ATENCIÓN</h6>
</div>
<div class="card-body">
<a href="?controller=atencion&action=frmRegistrar" class="btn btn-primary mb-3"> Nuevo Llamado de Atención </a><br>
    <div class="table-responsive">
        <?php if (empty($this->tabla)): ?>
            <div class="col-12 text-center"><label class="text-center">No hay llamados de atención.</label></div>
        <?php else: ?>
            <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <th>NOMBRE APRENDIZ</th>
                                                <th>FICHA</th>
                                                <th>FECHA COMPROMISO</th>
                                                <th>MOTIVO DE REMISIÓN</th>
                                                <th>ACCIONES</th>
                                            </thead>
                                            <tbody>
                                            <?php
                                            echo $this->tabla;
                                            ?>
                                            </tbody>
                                        </table>
        <?php endif; ?>
    </div>
    <p></p>
</div>
                         
</div>