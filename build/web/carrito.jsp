<%-- 
    Document   : carrito
    Created on : 16-dic-2019, 9:45:15
    Author     : Alumno_2DAW
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Carta"%>
<%@page import="controlador.Bd"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  HttpSession sesion = request.getSession();
    Usuario usuario = (Usuario)sesion.getAttribute("usuario");
    Bd bd = new Bd();
    bd.abrirConexion();
    List<Carta> cartas = (List)sesion.getAttribute("carrito");
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
        background: rgba(255, 255, 255, 0.788);
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
    .rojo{
        color:red;
    }
    body{
        background-image: url("./imagenes/fondo");
    }
    body{
      background-image: url("./imagenes/black.jpg");
    }
    .nombre{
        padding-bottom:2%;
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
    .izquierda{
        display: inline-block;
        top:0;
        width: 30%;
        padding: 4%;
    }
    .derecha{
        display:inline-block;
        flex-direction:column;
        padding: 4%;
        width: 58%;

    }
    .tachado{
        text-decoration: line-through;
    }
    h5,h6{
        margin:2%;
    }
    .invisible{
      display: none;
    }
    .carrito{
      width: 85%;
      background: rgba(255, 255, 255, 0.774);
    }
    .imagenCarrito{
      padding: 2%;
      display: inline-block;
      width: 10%;

    }
    .contadorCarrito{
      width: 20%;

    }
    span{
        padding: 2%;
    }
    table{
      margin: 2%;
      width: 97%;
    }
    .flotante{
      float: right;
    }
    </style>
    <script>
    function calculaTotal(precio,id){
      var fila = document.getElementsByTagName("tr");
      var columnas = fila[id+1].getElementsByTagName("td");
      var input = columnas[2].getElementsByTagName("input");
      console.log(input[0].value);
      columnas[3].innerHTML=((Math.floor((input[0].value*precio)*100))/100+"€")

    }
    </script>
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
        <a class="nav-link" href="principal.jsp">Pedidos</a>
      </li>
    </ul>

    <ul class="nav navbar-nav ml-auto">
      <li class="nav-item">
                      <a class="nav-link" href="actualizaDatos.jsp"><span class="fas fa-user"></span> <%=usuario.getNombre()%> <%=usuario.getApellidos()%></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="carrito.jsp"><span class="fas fa-shopping-cart"></span></a>
      </li>
    </ul>
  </div>
</nav>
<div class="max-contenedor">
  <form action="ServletGuardaCarrito" method="POST">
  <table id="tabla">
    <th>Foto</th>
    <th>Nombre</th>
    <th>Cantidad</th>
    <th>Total</th>
  <%for(int contador=0;contador<cartas.size();contador++){%>
    <tr id="<%=contador%>">
      <td><img src="<%=cartas.get(contador).getFoto()%>.jpg" class="imagenCarrito" alt=""></td>
      <td><%=cartas.get(contador).getDescripcion()%></td>
      <td><input type="number" name="cantidad[]" id="cantidad[]" value="<%=cartas.get(contador).getCantidad()%>" onchange="calculaTotal(<%=cartas.get(contador).getPrecio()%>,<%=contador%>)"></td>
      <td id="total"><%=cartas.get(contador).getCantidad()*cartas.get(contador).getPrecio()%>€</td>

    </tr>
  <%}%>
  
</table>
<input type="submit" class="flotante" value="Actualizar Carrito" class="btn btn-primary btn-success">
</form>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>