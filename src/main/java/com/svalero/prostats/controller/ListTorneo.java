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

        // para la búsqueda
        String search1 = request.getParameter("search");
        String search2Str = request.getParameter("presencial");

        if (search1 == null ) search1 = "";
        int presencial = -1;
        if (search2Str != null && !search2Str.isEmpty()) {
            presencial = Integer.parseInt(search2Str);
        }
        // llamada al dao
        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        List<Torneo> listaTorneos = torneoDao.searchTorneos("%" + search1 + "%", presencial, presencial);

        // se coge la lista
        request.setAttribute("torneos", listaTorneos);

        // se manda al JSP
        request.getRequestDispatcher("list-torneos.jsp").forward(request, response);
    }
}
