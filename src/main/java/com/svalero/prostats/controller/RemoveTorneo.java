package com.svalero.prostats.controller;

import com.svalero.prostats.dao.TorneoDao;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete-torneo")
public class RemoveTorneo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id =  Integer.parseInt(request.getParameter("id"));

        TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
        torneoDao.deleteTorneo(id);

        response.sendRedirect("list-torneos");
    }
}
