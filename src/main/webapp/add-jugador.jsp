<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white py-3">
          <h3 class="mb-0 text-center fw-bold">
            <i class="bi bi-person-plus-fill me-2"></i>Registrar Nuevo Jugador
          </h3>
        </div>
        <div class="card-body p-4 p-md-5">

          <% if (request.getParameter("error") != null) { %>
          <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
            <i class="bi bi-exclamation-octagon-fill me-2"></i>
            <strong>Error:</strong> No se pudo guardar el jugador. Verifica la conexión o datos duplicados.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
          <% } %>

          <form action="add-jugador" method="post">

            <div class="row g-4">

              <div class="col-md-12">
                <label class="form-label fw-bold">Nickname del Jugador</label>
                <input type="text" name="nickname" class="form-control form-control-lg" placeholder="Ej: PapaPepe" required>
              </div>

              <%-- RELACIÓN --%>
              <div class="col-md-12">
                <label class="form-label fw-bold text-primary">Asignar a un Equipo</label>
                <select name="id_equipo" class="form-select form-select-lg border-primary" required>
                  <option value="" selected disabled>Selecciona el club...</option>
                  <c:forEach var="equipo" items="${equipos}">
                    <option value="${equipo.id}">${equipo.nombre}</option>
                  </c:forEach>
                </select>
                <div class="form-text">Si no aparecen equipos, asegúrate de registrarlos primero.</div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Edad</label>
                <div class="input-group">
                  <input type="number" name="edad" class="form-control" placeholder="18" min="14" required>
                  <span class="input-group-text">años</span>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">KDA Ratio (Performance)</label>
                <div class="input-group">
                  <input type="number" step="0.01" name="kda_ratio" class="form-control" placeholder="0.00" required>
                  <span class="input-group-text">ratio</span>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Fin de Contrato</label>
                <input type="date" name="fecha_fin_contrato" class="form-control" required>
              </div>

              <div class="col-md-6 d-flex align-items-end pb-1">
                <div class="form-check form-switch bg-light p-3 rounded border w-100">
                  <input class="form-check-input ms-0 me-3" type="checkbox" name="es_titular" id="es_titular" value="true">
                  <label class="form-check-label fw-bold" for="es_titular">¿Jugador Titular?</label>
                </div>
              </div>

            </div>

            <hr class="my-5">

            <div class="d-flex justify-content-between">
              <a href="list-jugadores" class="btn btn-outline-secondary px-4">
                <i class="bi bi-x-circle me-2"></i>Cancelar
              </a>
              <button type="submit" class="btn btn-primary btn-lg px-5 shadow">
                <i class="bi bi-check-circle me-2"></i>Guardar Jugador
              </button>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="footer.jsp" %>