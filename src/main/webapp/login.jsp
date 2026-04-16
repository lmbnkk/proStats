<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>proStats - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .login-container { min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .card { border: none; border-radius: 15px; }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="row w-100 justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="text-center mb-4">
                <img src="images/logo.png" alt="proStats" height="60">
            </div>
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-center mb-4">Iniciar Sesión</h4>
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nombre de usuario</label>
                            <input type="text" name="username" class="form-control" placeholder="Ej: admin" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Entrar</button>
                        </div>
                    </form>

                    <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger mt-3 py-2 text-center" role="alert">
                        Credenciales incorrectas. Inténtalo de nuevo.
                    </div>
                    <% } %>
                </div>
            </div>
            <div class="text-center mt-3">
                <a href="index.jsp" class="text-muted text-decoration-none small">← Volver al inicio</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>