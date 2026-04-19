<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-lg border-0">
                <div class="card-body p-5">

                    <div class="d-flex justify-content-between align-items-start mb-4">
                        <div>
                            <h1 class="display-4 fw-bold mb-0">${jugador.nickname}</h1>

                            <p class="text-primary fs-4 fw-semibold mt-1">
                                <i class="bi bi-shield-shaded"></i> ${equipo.nombre}
                            </p>
                            <span class="badge ${jugador.esTitular ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                                ${jugador.esTitular ? 'TITULAR' : 'RESERVA'}
                            </span>
                        </div>
                        <div class="text-end bg-light p-3 rounded border">
                            <small class="text-muted d-block fw-bold small">KDA RATIO</small>
                            <span class="display-6 fw-bold text-dark">${jugador.kdaRatio}</span>
                        </div>
                    </div>

                    <hr class="my-4">


                    <div class="row text-center">
                        <div class="col-md-6 border-end">
                            <label class="text-muted small fw-bold text-uppercase">Edad</label>
                            <p class="fs-3 fw-bold">${jugador.edad} años</p>
                        </div>
                        <div class="col-md-6">
                            <label class="text-muted small fw-bold text-uppercase">Fin Contrato</label>
                            <p class="fs-3 fw-bold text-danger">${jugador.fechaFinContrato}</p>
                        </div>
                    </div>

                    <div class="mt-5 d-flex gap-2 justify-content-center">
                        <a href="list-jugadores" class="btn btn-outline-dark px-4">
                            <i class="bi bi-arrow-left me-2"></i>Volver
                        </a>
                        <% if (user != null && user.isEsAdmin()) { %>
                        <a href="update-jugador?id=${jugador.id}" class="btn btn-warning px-4">
                            <i class="bi bi-pencil-fill me-2"></i>Editar
                        </a>
                        <a href="delete-jugador?id=${jugador.id}" class="btn btn-danger px-4"
                           onclick="return confirm('¿Eliminar a ${jugador.nickname}?')">
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