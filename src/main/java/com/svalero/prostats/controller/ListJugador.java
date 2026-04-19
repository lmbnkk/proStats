package com.svalero.prostats.controller;

import com.svalero.prostats.dao.JugadorDao;
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

        // llamada al dao
        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        List<Jugador> listaJugadores = jugadorDao.getJugadores();

        // se coge la lista
        request.setAttribute("jugadores", listaJugadores);

        // se manda al JSP
        request.getRequestDispatcher("list-jugadores.jsp").forward(request, response);
    }
}
