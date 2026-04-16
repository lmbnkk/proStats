<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="card shadow-lg border-0">
        <div class="card-header bg-warning text-dark py-3"> <%-- Cambio a amarillo para indicar edición --%>
          <h3 class="mb-0 text-center fw-bold">
            <i class="bi bi-pencil-square me-2"></i>Modificar Equipo: ${equipo.nombre}
          </h3>
        </div>
        <div class="card-body p-4 p-md-5">

          <form action="update-equipo" method="post" enctype="multipart/form-data">

            <%-- VITAL: Campo oculto con el ID para que el DAO sepa qué fila actualizar --%>
            <input type="hidden" name="id" value="${equipo.id}">
            <%-- Guardamos la foto actual por si el usuario NO sube una nueva --%>
            <input type="hidden" name="fotoActual" value="${equipo.fotoPerfil}">

            <div class="row g-4">

              <div class="col-md-12">
                <label class="form-label fw-bold">Nombre del Club</label>
                <input type="text" name="nombre" class="form-control form-control-lg"
                       value="${equipo.nombre}" required>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Puesto en Ranking</label>
                <div class="input-group">
                  <span class="input-group-text">#</span>
                  <input type="number" name="ranking" class="form-control"
                         value="${equipo.puestoRanking}" min="1" required>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Valor de Mercado (€)</label>
                <div class="input-group">
                  <input type="number" step="0.01" name="valor" class="form-control"
                         value="${equipo.valorMercado}" required>
                  <span class="input-group-text">€</span>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Fecha de Fundación</label>
                <input type="date" name="fecha" class="form-control"
                       value="${equipo.fechaFundacion}" required>
              </div>

              <div class="col-md-6 d-flex align-items-end pb-1">
                <div class="form-check form-switch bg-light p-3 rounded border w-100">
                  <input class="form-check-input ms-0 me-3" type="checkbox" name="profesional" id="profesional"
                  ${equipo.esProfesional ? 'checked' : ''}>
                  <label class="form-check-label fw-bold" for="profesional">¿Es Profesional?</label>
                </div>
              </div>

              <div class="col-md-12">
                <label class="form-label fw-bold">Cambiar Escudo (Opcional)</label>
                <div class="input-group">
                  <label class="input-group-text" for="foto"><i class="bi bi-upload"></i></label>
                  <input type="file" name="foto" class="form-control" id="foto">
                </div>
                <div class="form-text">Si no seleccionas ningún archivo, se mantendrá el escudo actual.</div>
              </div>
            </div>

            <hr class="my-5">

            <div class="d-flex justify-content-between">
              <a href="list-equipos" class="btn btn-outline-secondary px-4">
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