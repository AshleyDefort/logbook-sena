<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">APRENDICES</h6>
    </div>
    <div class="card-body">
        <?php
        if ($_SESSION["rol"] == "ADMIN") {
            echo '<a href="?controller=aprendices&action=frmRegistro&ficha=" class="btn btn-primary mb-3"> Registrar </a>';
           
        }
        ?>
        <div class="table-responsive">
            <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <th>ID</th>
                    <th>NOMBRES</th>
                    <th>APELLIDOS</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <?php
                    if ($_SESSION["rol"] == "ADMIN") {
                        echo '<th>ACCIONES</th>';
                    }
                    ?>
                </thead>
                <tbody>
                <?php
                foreach ($this->aprendices as $fila) {//POR CADA FILA QUE EXITE EN aprendices SE REGISTRA EL VALOR EN LA VARIABLE FILA
                    $id = $fila["Id_Apre"];
                    echo "<tr>";
                    echo "<td>".$fila["Id_Apre"]."</td>";
                    echo "<td>".$fila["Apre_Nom"]."</td>";//concatenar
                    echo "<td>".$fila["Apre_Ape"]."</td>";//concatenar
                    echo "<td>".$fila["Apre_Tel"]."</td>";//concatenar
                    echo "<td>".$fila["Apre_Correo"]."</td>";//concatenar
                    if($_SESSION["rol"]=="ADMIN"){
                        echo "<td class='text-center'> 
                    <a class='fas fa-edit' href='?controller=aprendices&action=frmEditar&id=$id'></a> | 
                    <a class='fas fa-trash text-danger' onclick='eliminarAprendiz($id)'></a>
                                       </td>";}
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>