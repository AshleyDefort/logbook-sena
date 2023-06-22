<div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-light">Registro Funcionario</h6>
                                </div>
                                <div class="card-body">
                                    <?php
                                    if($_SESSION["rol"]=="ADMIN"){
                                        echo '<a href="?controller=funcionarios&action=frmRegistro" class="btn btn-primary"> Registrar </a>';
                                        echo '<a> </a>';
                                        echo '<a href="?controller=funcionarios&action=reportePDF" class="btn btn-light"> Reporte PDF </a>';
                                    }
                                    ?>

                                    <div class="table-responsive">
                                        <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                                            <tr>
                                                <th>NOMBRES</th>
                                                <th>APELLIDOS</th>
                                                <th>TELEFONO</th>
                                                <th>CORREO</th>
                                                <th>ROL</th>
                                                <th></th>
                                            </tr>
                                            <?php
                                            echo $this->tabla;
                                            ?>
                                        </table>
                                    </div>
                                    <p>
                                        <?php
                                        echo $this->pag;
                                        ?>
                                    </p>
                                </div>
                            </div>