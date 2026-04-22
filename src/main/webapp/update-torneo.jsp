<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-warning text-dark py-3"> <%-- Cambio a amarillo para indicar edición --%>
                    <h3 class="mb-0 text-center fw-bold">
                        <i class="bi bi-pencil-square me-2"></i>Modificar Torneo: ${torneo.nombreEvento}
                    </h3>
                </div>
                <div class="card-body p-4 p-md-5">

                    <form action="update-torneo" method="post">

                        <%-- VITAL: Campo oculto con el ID para que el DAO sepa qué fila actualizar --%>
                        <input type="hidden" name="id" value="${torneo.id}">

                        <div class="row g-4">

                            <div class="col-md-12">
                                <label class="form-label fw-bold">Nombre del Torneo</label>
                                <input type="text" name="nombre_evento" class="form-control form-control-lg"
                                       value="${torneo.nombreEvento}" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-bold">Max. Equipos</label>
                                <div class="input-group">
                                    <span class="input-group-text">#</span>
                                    <input type="number" name="maximo_equipos" class="form-control"
                                           value="${torneo.maximoEquipos}" min="2" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-bold">Premio (€)</label>
                                <div class="input-group">
                                    <input type="number" step="0.01" name="premio" class="form-control"
                                           value="${torneo.premio}" required>
                                    <span class="input-group-text">€</span>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-bold">Fecha del Evento</label>
                                <input type="date" name="fecha_evento" class="form-control"
                                       value="${torneo.fechaEvento}" required>
                            </div>

                            <div class="col-md-6 d-flex align-items-end pb-1">
                                <div class="form-check form-switch bg-light p-3 rounded border w-100">
                                    <input class="form-check-input ms-0 me-3" type="checkbox" name="presencial" id="presencial"
                                    ${torneo.esPresencial ? 'checked' : ''}>
                                    <label class="form-check-label fw-bold" for="presencial">¿Es Presencial?</label>
                                </div>
                            </div>
                        </div>

                        <hr class="my-5">

                        <div class="d-flex justify-content-between">
                            <a href="list-torneos" class="btn btn-outline-secondary px-4">
                                <i class="bi bi-x-circle me-2"></i>Descartar
                            </a>
                            <button type="submit" class="btn btn-warning btn-lg px-5 shadow fw-bold">
                                <i class="bi bi-save me-2"></i>Actualizar Datos
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>