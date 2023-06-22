

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Administrar Fichas</h6>
    </div>
    <div class="card-body">
        <a href="?controller=programas&action=frmFichas" class="btn btn-primary">REGISTAR FICHAS</a><br><br>
        <div class="row" >
        <?php foreach($this->fichas as $fila) { $id=$fila["Cod_Ficha"];?>
          
            <div class="col-md-4">
              <div class="card">
                <img src="public/img/logo.png" width="100px" height="100px" class=" mx-auto mt-3" alt="...">
                <div class="card-body">
                  <h5 class="card-title">FICHA: <?php echo $fila["Cod_Ficha"]; ?></h5>
                  <p class="card-text">DESCRIPCION: <?php echo $fila["Desc_Fich"]; ?></p>
                  <p class="card-text">FECHA DE INICIO: <?php echo $fila["fechaIni_Fich"]; ?></p>
                  <p class="card-text">FECHA DE FIN: <?php echo $fila["fechaFin_Fich"]; ?></p>
                  <?php echo "<td> 
                    <a class='btn btn-primary' href='?controller=programas&action=frmaprendiz&id=$id'>  Ver  </a>
                    </td>";
                    echo "</tr>"; ?>
                </div>
              </div>
            </div> 
          <?php } ?>
</div><br>
<?php
                                    
                                    echo '<a href="?controller=programas&action=index" class="btn btn-light"> Volver </a>';
                                                        
                                    ?>             
    </div>
</div>