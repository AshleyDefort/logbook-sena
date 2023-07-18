<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Funcionarios</h6>
    </div>
    <div class="card-body">
        <?php if ($_SESSION["rol"] == "ADMIN") {
            echo '<a href="?controller=funcionarios&action=frmRegistro" class="btn btn-primary mb-3">Registrar</a>';
        } ?>
        <div class="table-responsive" id="contenidoTabla">
            <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0" style="text-transform:uppercase;">
                <thead>
                    <th>NOMBRES</th>
                    <th>APELLIDOS</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <th>ROL</th>
                    <?php
                    if ($_SESSION["rol"] == "ADMIN") {
                        echo '<th>ACCIONES</th>';
                    }
                    ?>
                </thead>
                <tbody>
                <?php 
                  foreach ($this->funcionarios as $fila) {
                      $id = $fila["ID_Func"];
                      echo "<tr>";
                      echo"<td>" . $fila["Fun_Nom"] . "</td>";
                      echo "<td>" . $fila["Fun_Ape"] . "</td>";
                      echo "<td>" . $fila["Fun_Tel"] . "</td>";
                     echo "<td style=\"text-transform:lowercase;\">" . $fila["Fun_Correo"] . "</td>";
                      echo "<td>" . $fila["Fun_Rol"] . "</td>";
                      if ($_SESSION["rol"] == "ADMIN") {
                          echo "<td class='text-center'> 
                              <a class='fas fa-edit' href='?controller=funcionarios&action=frmEditar&id=$id'></a> | 
                              <a class='fas fa-trash text-danger' onclick='Eliminar1($id)'></a>
                          </td>";
                      }
                  }
    
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

