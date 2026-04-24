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
import java.util.List;

@WebServlet("/list-jugadores")
public class ListJugador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // para la búsqueda
        String search1 = request.getParameter("search");
        String search2Str = request.getParameter("idEquipo");

        if (search1 == null ) search1 = "";
        int idEquipo = 0;
        if (search2Str != null && !search2Str.isEmpty()) {
            idEquipo = Integer.parseInt(search2Str);
        }

        // llamada al dao
        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        List<Jugador> listaJugadores = jugadorDao.searchJugadores("%" + search1 + "%", idEquipo, idEquipo);

        // cargar equipos para que se vean en busqueda
        EquipoDao equipoDao =  Database.getJdbi().onDemand(EquipoDao.class);
        List<Equipo> listaEquipos = equipoDao.getEquipos();

        // se cogen la listas
        request.setAttribute("jugadores", listaJugadores);
        request.setAttribute("equipos", listaEquipos);

        // se manda al JSP
        request.getRequestDispatcher("list-jugadores.jsp").forward(request, response);
    }
}
