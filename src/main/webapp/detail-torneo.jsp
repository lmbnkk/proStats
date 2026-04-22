<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-lg border-0">
                <div class="card-body p-5">

                    <div class="d-flex justify-content-between align-items-start mb-4">
                        <div>
                            <h1 class="display-4 fw-bold mb-0">${torneo.nombreEvento}</h1>

                            <span class="badge ${torneo.esPresencial ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                                ${torneo.esPresencial ? 'Presencial' : 'Online'}
                            </span>
                        </div>
                        <div class="text-end bg-light p-3 rounded border">
                            <small class="text-muted d-block fw-bold small">Premio</small>
                            <span class="display-6 fw-bold text-dark">${torneo.premio} €</span>
                        </div>
                    </div>

                    <hr class="my-4">


                    <div class="row text-center">
                        <div class="col-md-6 border-end">
                            <label class="text-muted small fw-bold text-uppercase">Max. Equipos</label>
                            <p class="fs-3 fw-bold">${torneo.maximoEquipos}</p>
                        </div>
                        <div class="col-md-6">
                            <label class="text-muted small fw-bold text-uppercase">Fecha del evento</label>
                            <p class="fs-3 fw-bold text-danger">${torneo.fechaEvento}</p>
                        </div>
                    </div>

                    <div class="mt-5 d-flex gap-2 justify-content-center">
                        <a href="list-torneos" class="btn btn-outline-dark px-4">
                            <i class="bi bi-arrow-left me-2"></i>Volver
                        </a>
                        <% if (user != null && user.isEsAdmin()) { %>
                        <a href="update-torneo?id=${torneo.id}" class="btn btn-warning px-4">
                            <i class="bi bi-pencil-fill me-2"></i>Editar
                        </a>
                        <a href="delete-torneo?id=${torneo.id}" class="btn btn-danger px-4"
                           onclick="return confirm('¿Eliminar ${torneo.nombreEvento}?')">
                            <i class="bi bi-trash-fill me-2"></i>Borrar
                        </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>