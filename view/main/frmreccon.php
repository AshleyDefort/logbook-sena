<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="Public/img/logo.png">
    <title>Recuperar Contraseña</title>

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
                                        <h1 class="h4 text-green-900 mb-4">RECUPERAR CONTRASEÑA</h1>
                                    </div>
 <form class="user" method="post" 
 		action="?controller=funcionarios&action=validar" onsubmit="return false">
                                        <div class="form-group">
                                        <h5 class="text-green-900 mb-4">Numero de documento</h5>
    <input type="number" class="form-control form-control-user"
              id="id" name="id" placeholder="Ingrese Su Numero de documento">

                                        </div>
                                        
                                        <div class="form-group text-center">
                                            <input type="submit" value="Enviar" class="btn btn-primary" onclick="login()">
                                        </div>
                                         
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <footer class="bg-gradient-primary text-center text-lg-start">
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