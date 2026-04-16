package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail-equipo")
public class DetailEquipo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("list-equipos");
            return;
        }

        int id = Integer.parseInt(idStr);

        // llamar al dao
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        Equipo equipo = equipoDao.getEquipo(id);

        // mochila y jsp
        request.setAttribute("equipo", equipo);
        request.getRequestDispatcher("detail-equipo.jsp").forward(request, response);
    }
}