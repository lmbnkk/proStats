<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<main class="container py-5">

    <div class="d-flex justify-content-between align-items-end mb-5 border-bottom pb-3">
        <div>
            <h1 class="fw-bold mb-0">Directorio de Torneos</h1>
            <p class="text-muted mb-0">Gestiona y consulta los torneos de la plataforma.</p>
        </div>

        <% if (user != null && user.isEsAdmin()) { %>
        <a href="add-torneo" class="btn btn-primary btn-lg shadow">
            <i class="bi bi-plus-circle me-2"></i>Registrar Torneo
        </a>
        <% } %>
    </div>

    <!--- BUSCADOR --->
    <section class="card shadow-sm border-0 mb-4">
        <div class="card-body p-4">
            <form action="list-torneos" method="get" class="row g-3 align-items-end">
                <div class="col-md-5">
                    <label class="form-label fw-bold small text-uppercase text-muted">Nombre del Torneo</label>
                    <input type="text" name="search" class="form-control" placeholder="Ej: Major Zaragoza" value="${param.search}">
                </div>

                <div class="col-md-5">
                    <label class="form-label fw-bold small text-uppercase text-muted">Formato</label>
                    <select name="presencial" class="form-select">
                        <option value="-1">Todos los formatos</option>
                        <option value="1" ${param.presencial == '1' ? 'selected' : ''}>Presencial</option>
                        <option value="0" ${param.presencial == '0' ? 'selected' : ''}>Online</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn btn-dark w-100 fw-bold">
                        <i class="bi bi-filter me-2"></i>Filtrar
                    </button>
                </div>
            </form>
        </div>
    </section>
    <!--- FIN BUSCADOR --->

    <div class="row g-4">
        <c:forEach var="torneo" items="${torneos}">
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 shadow-sm border-0 transition-hover">
                    <div class="card-body text-center">
                        <h5 class="card-title fw-bold">${torneo.nombreEvento}</h5>
                        <div class="d-flex justify-content-center gap-2 mb-3">
                            <span class="badge bg-dark">Max. Equipos: ${torneo.maximoEquipos}</span>
                            <span class="badge bg-outline-secondary text-dark border">${torneo.premio} €</span>
                        </div>
                    </div>

                    <div class="card-footer bg-white border-0 pb-3">
                        <div class="d-grid gap-2">
                            <a href="detail-torneo?id=${torneo.id}" class="btn btn-sm btn-outline-primary">Ver Ficha Completa</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<%@ include file="footer.jsp" %>