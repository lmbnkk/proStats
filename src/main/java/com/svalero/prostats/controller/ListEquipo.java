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

        // para la búsqueda
        String search1 = request.getParameter("search");
        String search2Str = request.getParameter("profesional");

        if (search1 == null ) search1 = "";
        int profesional = -1;
        if (search2Str != null && !search2Str.isEmpty()) {
            profesional = Integer.parseInt(search2Str);
        }

        // llamada al dao
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        List<Equipo> listaEquipos = equipoDao.searchEquipos("%" + search1 + "%", profesional, profesional);

        // se coge la lista
        request.setAttribute("equipos", listaEquipos);

        // se manda al JSP
        request.getRequestDispatcher("list-equipos.jsp").forward(request, response);
    }
}
