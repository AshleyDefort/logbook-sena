<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">Administrar Programas</h6>
    </div>
    <div class="card-body">
        <a href="?controller=main&action=frmProgramas" class="btn btn-primary">REGISTAR PROGRAMAS</a>
        <div class="table-responsive">
        <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                                        <tr>
                                            <th>PROGRAMAS</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                        <?php
                                        foreach ($this->programas as $fila) {//POR CADA FILA QUE EXITE EN CLIENTE SE REGISTRA EL VALOR EN LA VARIABLE FILA
                                            $id=$fila["Cod_Pro"];
                                            echo "<tr>";
                                            echo "<td>".$fila["Pro_Desc"]."</td>";//concatenar
                                            
                                            
                                                echo "<td> 
                                                <a class='btn btn-primary' href='?controller=programas&action=fichas&id=$id'>  Ver  </a>
                                                                   </td>";
                                                            echo "</tr>";
                                           
                                        }
                                        ?>
        </table>
        </div>
                                
    </div>
</div>
