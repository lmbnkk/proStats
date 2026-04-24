package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.dao.JugadorDao;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-jugador")
public class RemoveJugador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        jugadorDao.deleteJugador(id);

        // vuelta al listado
        response.sendRedirect("list-jugadores");
    }
}