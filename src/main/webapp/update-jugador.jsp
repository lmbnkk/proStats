<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<main class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="card shadow-lg border-0">
        <div class="card-header bg-warning text-dark py-3">
          <h3 class="mb-0 text-center fw-bold">
            <i class="bi bi-pencil-square me-2"></i>Modificar Jugador: ${jugador.nickname}
          </h3>
        </div>
        <div class="card-body p-4 p-md-5">

          <form action="update-jugador" method="post">

            <input type="hidden" name="id" value="${jugador.id}">

            <div class="row g-4">

              <div class="col-md-12">
                <label class="form-label fw-bold">Nickname del Jugador</label>
                <input type="text" name="nickname" class="form-control form-control-lg"
                       value="${jugador.nickname}" required>
              </div>

              <div class="col-md-12">
                <label class="form-label fw-bold text-primary">Equipo Actual</label>
                <select name="id_equipo" class="form-select" required>
                  <c:forEach var="equipo" items="${equipos}">
                    <option value="${equipo.id}" ${equipo.id == jugador.idEquipo ? 'selected' : ''}>
                        ${equipo.nombre}
                    </option>
                  </c:forEach>
                </select>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Edad</label>
                <div class="input-group">
                  <input type="number" name="edad" class="form-control"
                         value="${jugador.edad}" min="14" required>
                  <span class="input-group-text">años</span>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">KDA Ratio</label>
                <div class="input-group">
                  <input type="number" step="0.01" name="kda_ratio" class="form-control"
                         value="${jugador.kdaRatio}" required>
                  <span class="input-group-text">ratio</span>
                </div>
              </div>

              <div class="col-md-6">
                <label class="form-label fw-bold">Fin de Contrato</label>
                <input type="date" name="fecha_fin_contrato" class="form-control"
                       value="${jugador.fechaFinContrato}" required>
              </div>

              <div class="col-md-6 d-flex align-items-end pb-1">
                <div class="form-check form-switch bg-light p-3 rounded border w-100">
                  <input class="form-check-input ms-0 me-3" type="checkbox" name="es_titular" id="es_titular"
                  ${jugador.esTitular ? 'checked' : ''}>
                  <label class="form-check-label fw-bold" for="es_titular">¿Es Titular?</label>
                </div>
              </div>

            </div>

            <hr class="my-5">

            <div class="d-flex justify-content-between">
              <a href="list-jugadores" class="btn btn-outline-secondary px-4">
                <i class="bi bi-x-circle me-2"></i>Descartar
              </a>
              <button type="submit" class="btn btn-warning btn-lg px-5 shadow fw-bold">
                <i class="bi bi-save me-2"></i>Actualizar Ficha
              </button>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="footer.jsp" %>