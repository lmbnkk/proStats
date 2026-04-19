<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<main class="container py-5">

    <div class="d-flex justify-content-between align-items-end mb-5 border-bottom pb-3">
        <div>
            <h1 class="fw-bold mb-0">Listado de Jugadores</h1>
            <p class="text-muted mb-0">Gestiona y consulta los jugadores integrados en la plataforma.</p>
        </div>

        <% if (user != null && user.isEsAdmin()) { %>
        <a href="add-jugador" class="btn btn-primary btn-lg shadow">
            <i class="bi bi-plus-circle me-2"></i>Registrar Jugador
        </a>
        <% } %>
    </div>

    <div class="row g-4">
        <c:forEach var="jugador" items="${jugadores}">
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 shadow-sm border-0 transition-hover">
                    <div class="card-body text-center">
                        <h5 class="card-title fw-bold">${jugador.nickname}</h5>
                        <div class="d-flex justify-content-center gap-2 mb-3">
                            <span class="badge bg-dark">Edad ${jugador.edad}</span>
                            <span class="badge bg-outline-secondary text-dark border">${jugador.kdaRatio} %</span>
                        </div>
                    </div>

                    <div class="card-footer bg-white border-0 pb-3">
                        <div class="d-grid gap-2">
                            <a href="detail-jugador?id=${jugador.id}" class="btn btn-sm btn-outline-primary">Ver Ficha Completa</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<%@ include file="footer.jsp" %>