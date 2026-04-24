<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.svalero.prostats.model.Usuario" %>
<%
  // Definimos la variable 'user' AQUÍ para que esté disponible en todas las páginas que incluyan este header
  Usuario user = (Usuario) session.getAttribute("usuarioActual");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>proStats - Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <style>
    .navbar-brand img { height: 40px; }
    .hero-section { background: #f8f9fa; padding: 60px 0; border-bottom: 1px solid #dee2e6; }
    .admin-panel { border-left: 5px solid #dc3545; }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      <img src="images/logo.png" alt="proStats Logo" class="me-2">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="list-equipos">Equipos</a></li>
        <li class="nav-item"><a class="nav-link" href="list-jugadores">Jugadores</a></li>
        <li class="nav-item"><a class="nav-link" href="list-torneos">Torneos</a></li>
      </ul>

      <div class="d-flex align-items-center">
        <% if (user == null) { %>
        <a href="login.jsp" class="btn btn-outline-light btn-sm">Iniciar Sesión</a>
        <% } else { %>
        <span class="text-light me-3 small">Hola, <strong><%= user.getUsername() %></strong></span>
        <a href="logout" class="btn btn-danger btn-sm">Cerrar Sesión</a>
        <% } %>
      </div>
    </div>
  </div>
</nav>