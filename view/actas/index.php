<div class="card shadow mb-4">
<div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-light">ACTAS DE COMPROMISO</h6>
</div>
<div class="card-body">
<a href="?controller=actas&action=frmActas" class="btn btn-primary mb-3"> Nueva Acta </a><br>

    <!--<?php //if (empty($this->tabla)): ?>
        <label for="filtro"></label>
    <?php //else: ?>
        <label for="filtro">Filtrar por:</label>
        <select name="filtro" id="filtro" onchange="selectFiltros()">
            <option value="">Seleccionar</option>
            <option value="Ficha de caracterización">Ficha de caracterización</option>
            <option value="ID de aprendiz">ID de aprendiz</option>
            <option value="Fecha de creación">Fecha de creación</option>
        </select>
        <input type="hidden" name="texto" id="texto">
        <a onclick="filtrar()"><i class="fa fa-filter fa-sm fa-fw mr-2 text-gray-500"></i></a>
    <?php //endif; ?>
    -->
    <div class="table-responsive">
        <?php if (empty($this->tabla)): ?>
            <div class="col-12 text-center"><label class="text-center">No hay actas de compromiso creadas.</label></div>
        <?php else: ?>
            <table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <th>NOMBRE APRENDIZ</th>
                                                <th>FICHA</th>
                                                <th>FECHA COMPROMISO</th>
                                                <th>MOTIVO DE REMISIÓN</th>
                                                <th>ACCIONES</th>
                                            </thead>
                                            <tbody>
                                            <?php
                                            echo $this->tabla;
                                            ?>
                                            </tbody>
                                        </table>
        <?php endif; ?>
    </div>
    <p></p>
</div>
                         
</div>
<script>
    function handleEnterKey(event) {
        // Verificar si la tecla presionada es Enter (código 13)
        if (event.keyCode === 13) {
            event.preventDefault(); // Evitar el comportamiento predeterminado del Enter (por ejemplo, enviar el formulario)
            filtrar(); // Realizar el filtro
        }
    }
    var textoInput = document.getElementById('texto');

    // Agregar un evento al campo de texto para capturar la tecla Enter
    textoInput.addEventListener('keyup', handleEnterKey);
</script>