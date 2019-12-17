<%-- 
    Document   : muestraArticulos
    Created on : 12-dic-2019, 11:08:43
    Author     : Alumno_2DAW
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Carta"%>
<%@page import="controlador.Bd"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  HttpSession sesion = request.getSession();
    Usuario usuario = (Usuario)sesion.getAttribute("usuario");
        RequestDispatcher rd;
    if(usuario ==null){
        rd= request.getRequestDispatcher("/index.html");
        rd.forward(request, response);
    }
    Bd bd= new Bd();
    bd.abrirConexion();
    List<Carta> cartas = bd.obtenerCartas(Integer.parseInt(request.getParameter("cat")));
    
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
      <li class="nav-item">
        <a class="nav-link" href="ServletDesloguea"><span class="fas fa-sign-out-alt"></span></a>
      </li>
    </ul>
  </div>
</nav>
<div class="max-contenedor">
    <div class="busqueda"></div>
    <%for(int contador=0;contador<cartas.size();contador++){%>
    <div class="interior-contenedor"><a href="detalleArticulo.jsp?id=<%=cartas.get(contador).getId()%>"><img src="<%=cartas.get(contador).getFoto()%>.jpg" alt=""><br><strong class="medio"><%=cartas.get(contador).getDescripcion()%></strong></a></div>
    <%}%>
   
</div>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
