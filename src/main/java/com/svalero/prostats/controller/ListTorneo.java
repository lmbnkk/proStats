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
import java.util.List;

@WebServlet("/list-torneos")
public class ListTorneo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // llamada al dao
        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        List<Torneo> listaTorneos = torneoDao.getTorneos();

        // se coge la lista
        request.setAttribute("torneos", listaTorneos);

        // se manda al JSP
        request.getRequestDispatcher("list-torneos.jsp").forward(request, response);
    }
}
