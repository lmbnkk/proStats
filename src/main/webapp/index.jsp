<%@ page import="com.svalero.prostats.model.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Usuario user = (Usuario) session.getAttribute("usuarioActual");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>proStats - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand img { height: 40px; }
        .hero-section { background: #f8f9fa; padding: 60px 0; border-bottom: 1px solid #dee2e6; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="proStats Logo" class="me-2">
        </a>
        <div class="ms-auto d-flex align-items-center">
            <% if (user == null) { %>
            <a href="login.jsp" class="btn btn-outline-light">Iniciar Sesión</a>
            <% } else { %>
            <span class="text-light me-3">Bienvenido, <strong><%= user.getUsername() %></strong></span>
            <a href="logout" class="btn btn-danger btn-sm">Cerrar Sesión</a>
            <% } %>
        </div>
    </div>
</nav>

<header class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold">Estadísticas ProPlayer</h1>
        <p class="lead text-muted">La base de datos definitiva para el análisis de rendimiento profesional.</p>
    </div>
</header>

<main class="container my-5">
    <% if (user != null && user.isEsAdmin()) { %>
    <div class="card border-danger mb-4 shadow-sm">
        <div class="card-header bg-danger text-white">
            <h5 class="mb-0">Panel de Control de Administrador</h5>
        </div>
        <div class="card-body">
            <p class="card-text">Tienes privilegios elevados para gestionar la plataforma.</p>
            <div class="d-grid gap-2 d-md-block">
                <button class="btn btn-primary">Gestionar Equipos</button>
                <button class="btn btn-primary">Gestionar Jugadores</button>
                <button class="btn btn-primary">Gestionar Torneos</button>
            </div>
        </div>
    </div>
    <% } %>

    <div class="row">
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Equipos</h5>
                    <p class="card-text">Consulta el ranking y valor de mercado de los clubes actuales.</p>
                    <a href="equipos.jsp" class="btn btn-outline-primary">Ver Listado</a>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>