<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="Public/img/logo.png">
    <title>Ingreso Bitácora</title>

    <!-- Custom fonts for this template-->
    <link href="Public/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="Public/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-light" >
    <header class="bg-light">

            <img src="Public/img/LogoSimbolo.jpg" class="img-fluid w-25" alt="Banner"> 

    <div class="w-100 bg-gradient-primary" style="height:20px;">

    </div>
    </header>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-9 col-md-6">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row justify-content-center">
                            <div class="d-none d-lg-block"></div>
                            <div class="col-lg-9">
                                <div class="p-4">
                                    <div class="text-center">
                                        <h1 class="h4 text-green-900 mb-4">BITÁCORA SENA</h1>
                                    </div>
 <form class="user" method="post" 
 		action="?controller=funcionarios&action=validar">

         <div class="form-group row">
         <div class="col-sm-12">
                    <select id="doc" name="doc" class="form-control">
                        <option value="Cedula de Ciudadania">Cédula de Ciudadanía</option>
                        <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                        <option value="Permiso Especial de Permanencia">Permiso Especial de Permanencia</option>
                        <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                        <option value="Permiso por Protección Temporal">Permiso por Protección Temporal</option>
                    </select>
                </div>

                                        </div>

                                        <div class="form-group">
    <input type="number" class="form-control form-control-user"
              id="id" name="id" placeholder="Numero de documento">

                                        </div>
                                        <div class="form-group" hidden="true">
    <input type="email" class="form-control form-control-user"
              id="correo" name="correo" placeholder="Digite correo">

                                        </div>
                                       
                                   			<div class="form-group">
    <input type="password" class="form-control form-control-user"
       id="password" name="password"placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <div class="form-group text-center">
                                        <input type="submit" value="Ingresar" class="btn btn-primary" onclick="login(); return false;">
                                        </div>
                                         
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="?controller=main&action=frmreccont">Olvidaste Tu Contraseña?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <footer class="bg-gradient-primary text-center text-lg-start" style="position: absolute;bottom: 0px; width:100%;">
  <!-- Copyright -->
  <div class="text-center p-3 bg-gradient-primary text-light">
    © 202X Copyright:
    <a class="text-light" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>

    <!-- Bootstrap core JavaScript-->
    <script src="Public/vendor/jquery/jquery.min.js"></script>
    <script src="Public/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="Public/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="Public/js/sb-admin-2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Public/js/script.js"></script>

</body>
</html>