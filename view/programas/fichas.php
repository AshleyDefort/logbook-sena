

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">Administrar Fichas</h6>
    </div>
    <div class="card-body">
    <a href="?controller=programas&action=frmFichas&id=<?php $codPrograma=$_GET["id"]; echo $codPrograma; ?>" class="btn btn-primary mb-3">REGISTAR FICHAS</a>
        <div class="row">   
          <?php
          if (count($this->fichas) > 0) {
            foreach($this->fichas as $fila) { $id=$fila["Cod_Ficha"];?>
          
              <div class="col-md-4">
                <div class="card">
                  <img src="public/img/logo.png" width="100px" height="100px" class=" mx-auto mt-3" alt="...">
                  <div class="card-body">
                    <h5 class="card-title text-center">FICHA: <?php echo $fila["Cod_Ficha"]; ?></h5>
                    <p class="card-text">Descripción: <?php echo $fila["Desc_Fich"]; ?></p>
                    <p class="card-text">Inicio de Formación: <?php echo $fila["fechaIni_Fich"]; ?></p>
                    <p class="card-text">Fin de Formación: <?php echo $fila["fechaFin_Fich"]; ?></p>
                    <?php echo "<div class='text-center'> 
                      <a class='btn btn-primary' href='?controller=programas&action=infoFicha&id=$id'>  Ver  </a>
                      </div>";
                      echo "</tr>"; ?>
                  </div>
                </div>
              </div> 
            <?php }
          } else {
            $mensaje="No tiene fichas de caracterización asignadas.";
            echo '<div class="col-12 text-center"><label class="text-center">' . $mensaje . '</label></div>';


          }
          
          ?>
</div><br>
<?php
                                    
                                    echo '<a href="?controller=programas&action=index" class="btn btn-light"> Volver </a>';
                                                        
                                    ?>             
    </div>
</div>