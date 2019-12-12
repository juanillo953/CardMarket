<%-- 
    Document   : errorRegistro
    Created on : 11-dic-2019, 14:00:31
    Author     : Alumno_2DAW
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String error = (String)request.getAttribute("errorInsert");%>
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
    .medio{
        width: 40%;
        text-align: center;
        margin: auto;
        margin-top:10%;
        border-radius: 20px;
        padding:2%;
        background: white;
    }</style>
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
                      <a class="nav-link" href="index.html">Home</a>
                    </li>
                  </ul>
              
                  <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                      <a class="nav-link" href="registrarse.jsp"><span class="fas fa-user"></span>Registrate</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="login.html"><span class="fas fa-sign-in-alt"></span>Acceder al sitio</a>
                    </li>
                  </ul>
                </div>
              </nav>
              <div class="medio"><h1><%=error%></h1><button width="70%" margin-bottom="2%" class="btn btn-lg btn-primary btn-block" onclick="location.href='registrarse.jsp'">Intentarlo de nuevo</button></div>
              <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>