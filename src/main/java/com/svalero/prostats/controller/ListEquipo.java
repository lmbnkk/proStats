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
import java.util.List;

@WebServlet("/list-equipos")
public class ListEquipo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // llamada al dao
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        List<Equipo> listaEquipos = equipoDao.getEquipos();

        // se coge la lista
        request.setAttribute("equipos", listaEquipos);

        // se manda al JSP
        request.getRequestDispatcher("list-equipos.jsp").forward(request, response);
    }
}
