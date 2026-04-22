package com.svalero.prostats.controller;

import com.svalero.prostats.dao.TorneoDao;
import com.svalero.prostats.model.Torneo;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/update-torneo")
public class EditTorneo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        Torneo torneo = torneoDao.getTorneo(id);

        request.setAttribute("torneo", torneo);
        request.getRequestDispatcher("update-torneo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre_evento");
        int maxEquipos = Integer.parseInt(request.getParameter("maximo_equipos"));
        double premio = Double.parseDouble(request.getParameter("premio"));
        LocalDate fechaEvento = LocalDate.parse(request.getParameter("fecha_evento"));
        boolean presencial = Boolean.parseBoolean(request.getParameter("presencial"));

        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        torneoDao.updateTorneo(nombre, maxEquipos, premio, fechaEvento, presencial, id);

        response.sendRedirect("list-torneos");

    }
}
