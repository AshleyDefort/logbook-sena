<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-white">ADMINISTRAR APRENDICES</h6>
    </div>
    <div class="card-body">
        <table class="table table-bordered mt-3">
                                        <tr>
                                            <th>NOMBRE</th>
                                            <th>APELLIDO</th>
                                            <th>TELEFONO</th>
                                            <th>CORREO</th>
                                        </tr>
        <?php
            foreach ($this->aprendiz as $fila) {//POR CADA FILA QUE EXITE EN CLIENTE SE REGISTRA EL VALOR EN LA VARIABLE FILA
                echo "<tr>";
            echo "<td>".$fila["Apre_Nom"]."</td>";
            echo "<td>".$fila["Apre_Ape"]."</td>";
            echo "<td>".$fila["Apre_Tel"]."</td>";
            echo "<td>".$fila["Apre_Correo"]."</td>";//concatenar
            echo "</tr>";
                                        }
                                        ?>
                                       
        </table>
    </div>
</div>