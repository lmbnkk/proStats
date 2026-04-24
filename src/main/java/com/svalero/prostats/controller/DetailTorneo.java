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

@WebServlet("/detail-torneo")
public class DetailTorneo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("list-torneos");
            return;
        }

        int id = Integer.parseInt(idStr);

        // llamar al dao
        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        Torneo torneo = torneoDao.getTorneo(id);

        // mochila y jsp
        request.setAttribute("torneo", torneo);
        request.getRequestDispatcher("detail-torneo.jsp").forward(request, response);
    }
}
