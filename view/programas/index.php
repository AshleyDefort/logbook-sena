<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">Administrar Programas</h6>
    </div>
    <div class="card-body">
        <a href="?controller=main&action=frmProgramas" class="btn btn-primary mb-3">Registrar Programas</a>
        <div class="table-responsive">
        <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>PROGRAMAS</th>
            <th class="text-center">ACCIONES</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($this->programas as $fila) {
            $id = $fila["Cod_Pro"];
            echo "<tr>";
            echo "<td style=\"text-transform:capitalize;\">".$fila["Pro_Desc"]."</td>";
            echo "<td class='text-center'> 
                    <a style='text-decoration:none;' class='fas fa-eye' href='?controller=programas&action=fichas&id=$id'></a>
                  </td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>


        </div>
                                
    </div>
</div>
