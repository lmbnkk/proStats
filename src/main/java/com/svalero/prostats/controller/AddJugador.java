package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.dao.JugadorDao;
import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/add-jugador")
public class AddJugador extends HttpServlet {

    // carga equipos previamente
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        List<Equipo> equipos = equipoDao.getEquipos();

        request.setAttribute("equipos", equipos);
        request.getRequestDispatcher("add-jugador.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // parámetros básicos
        String nickname = request.getParameter("nickname");
        String edadStr = request.getParameter("edad");
        String kdaRatioStr = request.getParameter("kda_ratio");
        String fechaStr = request.getParameter("fecha_fin_contrato");
        boolean titular = request.getParameter("es_titular") != null;
        String idEquipo = request.getParameter("id_equipo");

        // validación
        if (nickname == null || nickname.trim().isEmpty() || Integer.parseInt(edadStr) < 18) {
            response.sendRedirect("add-jugador?error=validacion");
            return;
        }

        try {
            JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
            jugadorDao.addJugador(nickname,
                    Integer.parseInt(edadStr),
                    Double.parseDouble(kdaRatioStr),
                    LocalDate.parse(fechaStr),
                    titular,
                    Integer.parseInt(idEquipo)
            );
             response.sendRedirect("list-jugadores?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-jugador?error=1");
        }
    }
}
