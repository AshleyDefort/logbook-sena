<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">Administrar Programas</h6>
    </div>
    <div class="card-body">
        <a href="?controller=main&action=frmProgramas" class="btn btn-primary mb-3">REGISTAR PROGRAMAS</a>
        <div class="table-responsive">
        <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>PROGRAMAS</th>
            <th>ACCIONES</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($this->programas as $fila) {
            $id = $fila["Cod_Pro"];
            echo "<tr>";
            echo "<td>".$fila["Pro_Desc"]."</td>";
            echo "<td> 
                    <a class='btn btn-primary' href='?controller=programas&action=fichas&id=$id'>Ver</a>
                  </td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>


        </div>
                                
    </div>
</div>
<script>
    $(document).ready(function() {
    $('#dataTable').DataTable(
        {
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json"
        }
    }
    );
});
</script>