package com.svalero.prostats.controller;

import com.svalero.prostats.dao.TorneoDao;
import com.svalero.prostats.model.Torneo;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/add-torneo")
public class AddTorneo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // básico
        String nombre = request.getParameter("nombre_evento");
        String maxEquiposStr = request.getParameter("maximo_equipos");
        String premioStr = request.getParameter("premio");
        String fechaStr = request.getParameter("fecha_evento");
        boolean presencial = request.getParameter("presencial") != null;

        // validación
        if (nombre == null || nombre.trim().isEmpty() || Integer.parseInt(maxEquiposStr) <= 0 ) {
            response.sendRedirect("add-torneo.jsp?error=validacion");
            return;
        }

        try {
            TorneoDao torneoDao = Database.getJdbi().onDemand(TorneoDao.class);
            torneoDao.addTorneo(nombre,
                    Integer.parseInt(maxEquiposStr),
                    Double.parseDouble(premioStr),
                    LocalDate.parse(fechaStr),
                    presencial);

            response.sendRedirect("list-torneos?success=1");

        } catch  (Exception e) {
            response.sendRedirect("add-torneo?error=1");
        }

    }
}
