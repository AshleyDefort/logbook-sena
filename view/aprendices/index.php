<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-light">APRENDICES</h6>
    </div>
    <div class="card-body">
        <?php
        if ($_SESSION["rol"] == "ADMIN") {
            echo '<a href="?controller=aprendices&action=frmRegistro&ficha=" class="btn btn-primary"> Registrar </a>';
            echo '<a> </a>';
            echo '<a href="?controller=aprendices&action=reportePDF" class="btn btn-light"> Reporte PDF </a>';
        }
        ?>

        <select name=items id="items">
            <option value="3">-- 3 --</option>
            <option value="6">-- 6 --</option>
            <option value="12">-- 12 --</option>
        </select>
        <div class="table-responsive">
            <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                <tr>
                    <th>NOMBRES</th>
                    <th>APELLIDOS</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <th>ROL</th>
                    <th></th>
                </tr>
                <?php
                echo $this->tabla;
                ?>
            </table>
        </div>
        <p>
            <?php
            echo $this->pag;
            ?>
        </p>
    </div>
</div>