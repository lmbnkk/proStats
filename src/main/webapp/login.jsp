<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<%-- Redirección lógica: Si ya está logueado, ¿qué hace aquí? --%>
<% if (user != null) {
    response.sendRedirect("index.jsp");
} %>

<main class="container">
    <div class="row justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="col-md-5 col-lg-4">

            <div class="text-center mb-4">
                <i class="bi bi-person-circle text-primary" style="font-size: 4rem;"></i>
                <h2 class="fw-bold">Acceso ProStats</h2>
            </div>

            <div class="card shadow border-0 p-3">
                <div class="card-body">
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Usuario</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" name="username" class="form-control" placeholder="Nombre de usuario" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Contraseña</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg shadow-sm">Entrar al Sistema</button>
                        </div>
                    </form>

                    <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger mt-4 py-2 text-center small" role="alert">
                        <i class="bi bi-exclamaition-triangle-fill me-2"></i>
                        Credenciales incorrectas.
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="text-center mt-4">
                <a href="index.jsp" class="text-muted small text-decoration-none">
                    <i class="bi bi-arrow-left"></i> Volver al panel principal
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>