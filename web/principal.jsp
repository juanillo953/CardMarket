<%-- 
    Document   : principal
    Created on : 12-dic-2019, 9:07:07
    Author     : Alumno_2DAW
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  HttpSession sesion = request.getSession();
    Usuario usuario = (Usuario)sesion.getAttribute("usuario");
    RequestDispatcher rd;
    if(usuario==null){
        rd= request.getRequestDispatcher("/index.html");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    .max-contenedor{
        position: relative;
        background-image: url("./imagenes/fondo.jpg");
        width: 95%;
        border: 1px solid black;
        border-radius:20px ;
        margin: auto;
        height: auto;
        margin-top: 1%;
        margin-bottom:1%;
    }
    .interior-contenedor{
        position: relative;
        display:inline-block;
        width: 20%;
        background: rgba(223, 192, 135, 0.815);
        margin: 2.13%;
        min-height: 150px;
        text-align: center;
        border-radius:20px;
        border: 1px solid black;
        padding: 1%;
        padding-bottom: 2%!important;
        transition: all .2s ease-in-out;
    }
    .interior-contenedor:hover{
      transform: scale(1.2);

    }
    .medio{
      color:rgb(173, 6, 6);

    }

    body{
        background-image: url("./imagenes/fondo");
    }
    img{
      width: 90%;
    }
    body{
      background-image: url("./imagenes/black.jpg");
    }
    .busqueda{
      width: 98%;
      min-height: 70px;
      border: 1px solid white;
      border-radius:20px;
      margin:auto;
      margin-top:1%;
      background: rgba(255, 255, 255, 0.753);
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
<div class="max-contenedor">
    <div class="busqueda"></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=1"><img src="./imagenes/fayden.jpg" alt=""><br><strong class="medio">Masterpiece</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=2"><img src="./imagenes/kiran.jpg" alt=""><br><strong class="medio">Míticas</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=3"><img src="./imagenes/gadwick.jpg" alt=""><br><strong class="medio">Raras</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=4"><img src="./imagenes/jeleva.jpg" alt=""><br><strong class="medio">Especiales</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=5"><img src="./imagenes/mist.jpg" alt=""><br><strong class="medio">Poco Comunes</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=6"><img src="./imagenes/genji.jpg" alt=""><br><strong class="medio">Comunes</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=7"><img src="./imagenes/isla.jpg" alt=""><br><strong class="medio">Tierras</strong></a></div>
    <div class="interior-contenedor"><a href="muestraArticulos.jsp?cat=8"><img src="./imagenes/humano.jpg" alt=""><br><strong class="medio">Fichas</strong></a></div>
</div>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>