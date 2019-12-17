<%-- 
    Document   : actualizaDatos
    Created on : 16-dic-2019, 8:24:59
    Author     : Alumno_2DAW
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%HttpSession sesion = request.getSession();
    Usuario usuario = (Usuario)sesion.getAttribute("usuario");
    RequestDispatcher rd;
    if(usuario ==null){
        rd= request.getRequestDispatcher("/index.html");
        rd.forward(request, response);
    }%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body{
      background-image: url("./imagenes/black.jpg");
    }
    .rojo{
      color:red;
    }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
        <a class="navbar-brand" href="#">CardMarket</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb" aria-expanded="true">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div id="navb" class="navbar-collapse collapse hide">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="principal.jsp">Home</a>
            </li>
            <%if(usuario.getPerfil()==0){%>
              <li class="nav-item active">
                <a class="nav-link" href="mostrarPedido.jsp">Pedidos</a>
              </li>
              
            </ul>
        
            <ul class="nav navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="actualizaDatos.jsp"><span class="fas fa-user"></span> <%=usuario.getNombre()%> <%=usuario.getApellidos()%></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="carrito.jsp"><span class="fas fa-shopping-cart"></span></a>
              </li>
              <%}else{%>
                <li class="nav-item active">
                  <a class="nav-link" href="pedidoAdministrador.jsp">Pedidos</a>
                </li>
        
              </ul>
        
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="actualizaDatos.jsp"><span class="fas fa-user"></span> <%=usuario.getNombre()%> <%=usuario.getApellidos()%></a>
                </li>
              <%}%>
            <li class="nav-item">
              <a class="nav-link" href="ServletDesloguea"><span class="fas fa-sign-out-alt"></span></a>
            </li>
          </ul>
        </div>
      </nav>
        <div class="container">
                <div class="row">
                  <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                      <div class="card-body">
                        <h5 class="card-title text-center">Actualizacion de datos</h5>
                       
                        <form class="form-signin" method="POST" action="ServletActualizaDatos">
                          <div class="form-label-group">
                            <input type="text" name="nombre"  id="nombre" class="form-control" placeholder="Nombre de usuario" pattern="^[A-Za-z0-9]{4,}$" required autofocus>
                            <label for="nombre">Nombre</label>
                          </div>
            
                          <div class="form-label-group">
                            <input type="text" name="apellidos" id="apellidos" class="form-control" placeholder="Apellidos" pattern="^[^ ]{4,}$" required>
                            <label for="apellidos">Apellidos</label>
                          </div>
                          <div class="form-label-group">
                                <input type="text" name="direccion" id="direccion" class="form-control" pattern="^[^ ]{4,}$" placeholder="Dirección" required>
                                <label for="direccion">Dirección</label>
                          </div>
            
                          <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Actualizar Datos</button>
                          <hr class="my-4">
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

