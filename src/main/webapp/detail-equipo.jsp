<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow border-0 overflow-hidden">
                <div class="row g-0">

                    <div class="col-md-5 bg-light d-flex align-items-center justify-content-center p-5 border-end">
                        <img src="${pageContext.request.contextPath}/uploads/${equipo.fotoPerfil}"
                             class="img-fluid rounded shadow-sm" alt="Escudo">
                    </div>

                    <div class="col-md-7">
                        <div class="card-body p-5">
                            <div class="d-flex justify-content-between align-items-start mb-4">
                                <div>
                                    <h1 class="display-5 fw-bold text-dark">${equipo.nombre}</h1>
                                    <span class="badge ${equipo.esProfesional ? 'bg-success' : 'bg-secondary'} fs-6">
                                        ${equipo.esProfesional ? 'Profesional' : 'Amateur'}
                                    </span>
                                </div>
                                <div class="text-end">
                                    <h2 class="text-primary fw-bold mb-0">#${equipo.puestoRanking}</h2>
                                    <small class="text-muted text-uppercase fw-bold">Ranking Mundial</small>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="row g-4">
                                <div class="col-6">
                                    <label class="text-muted small text-uppercase fw-bold d-block">Valor de Mercado</label>
                                    <span class="fs-4 fw-bold text-success">${equipo.valorMercado} €</span>
                                </div>
                                <div class="col-6">
                                    <label class="text-muted small text-uppercase fw-bold d-block">Fundación</label>
                                    <span class="fs-4 fw-bold">${equipo.fechaFundacion}</span>
                                </div>
                            </div>

                            <div class="mt-5 d-flex gap-3">
                                <a href="list-equipos" class="btn btn-outline-dark">
                                    <i class="bi bi-arrow-left me-2"></i>Volver al Listado
                                </a>
                                <% if (user != null && user.isEsAdmin()) { %>
                                <a href="update-equipo?id=${equipo.id}" class="btn btn-warning">
                                    <i class="bi bi-pencil-fill me-2"></i>Editar Ficha
                                </a>
                                <a href="delete-equipo?id=${equipo.id}" class="btn btn-danger px-4"
                                   onclick="return confirm('¿Eliminar definitivamente a ${equipo.nombre}? Esta acción no se puede deshacer.')">
                                    <i class="bi bi-trash-fill me-2"></i>Borrar Equipo
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>