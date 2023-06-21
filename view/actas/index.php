<div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-light">ACTAS DE COMPROMISO</h6>
                                </div>
                                <div class="card-body">
                                <a href="?controller=actas&action=frmActas" class="btn btn-primary"> Nueva Acta </a>
                                    <div class="table-responsive">
                                        <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                                            <tr>
                                                <th>NOMBRE APRENDIZ</th>
                                                <th>FICHA</th>
                                                <th>FECHA COMPROMISO</th>
                                                <th>MOTIVO DE REMISIÓN</th>
                                                <th>ACCIONES</th>
                                            </tr>
                                            <?php
                                            echo $this->tabla;
                                            ?>
                                        </table>
                                    </div>
                                    <p>
                                    </p>
                                </div>
                            </div>