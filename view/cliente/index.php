<div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Registro Funcionario</h6>
                                </div>
                                <div class="card-body">
                                    <?php
                                    if($_SESSION["rol"]=="ADMIN"){
                                        echo '<a href="?controller=cliente&action=frmRegistro" class="btn btn-primary"> Registrar </a>';
                                        echo '<a> </a>';
                                        echo '<a href="?controller=cliente&action=reportePDF" class="btn btn-light"> Reporte PDF </a>';
                                    }
                                    ?>

                                       <select name=items id="items">
                                        <option value="3">-- 3 --</option>
                                        <option value="6">-- 6 --</option>
                                        <option value="12">-- 12 --</option>
                                       </select> 

                                    <table class="table table-bordered mt-3">
                                        <tr>
                                            <th>NOMBRES</th>
                                            <th>APELLIDOS</th>
                                            <th>TELEFONO</th>
                                            <th>CORREO</th>
                                            <th>ROL</th>
                                        </tr>
                                        <?php
                                        echo $this->tabla;
                                        ?>
                                    </table>
                                    <p>
                                        <?php
                                        echo $this->pag;
                                        ?>
                                    </p>
                                </div>
                            </div>