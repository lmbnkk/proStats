package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.dao.JugadorDao;
import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.model.Jugador;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail-jugador")
public class DetailJugador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("list-jugadores");
            return;
        }

        int id = Integer.parseInt(idStr);

        // llamar al dao
        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        Jugador jugador = jugadorDao.getJugador(id);

        // para buscar el equipo
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        Equipo equipo = equipoDao.getEquipo(jugador.getIdEquipo());

        // mochila y jsp
        request.setAttribute("jugador", jugador);
        request.setAttribute("equipo", equipo);
        request.getRequestDispatcher("/detail-jugador.jsp").forward(request, response);
    }
}
