<div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-light">ACTAS DE COMPROMISO</h6>
                                </div>
                                <div class="card-body">
                             
                                <label for="filtro">Filtrar por:</label>
                                <select name="filtro" id="filtro" onchange="selectFiltros()">
                                <option value="">Seleccionar</option>
                                    <option value="Ficha de caracterización">Ficha de caracterización</option>
                                    <option value="ID de aprendiz">ID de aprendiz</option>
                                    <option value="Fecha de creación">Fecha de creación</option>
                                </select>
                                <input type="hidden" name="texto" id="texto">
                                <a onclick="filtrar()"> <i class="fa fa-filter fa-sm fa-fw mr-2 text-gray-500"></i> </a>
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
                                    <a href="?controller=actas&action=frmActas" class="btn btn-primary"> Nueva Acta </a>
                                    <p>
                                    </p>
                                </div>
                            </div>