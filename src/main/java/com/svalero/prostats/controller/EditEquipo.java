package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/update-equipo")
@MultipartConfig
public class EditEquipo extends HttpServlet {

    // datos viejos al formulario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        Equipo equipo = equipoDao.getEquipo(id);

        request.setAttribute("equipo", equipo);
        request.getRequestDispatcher("update-equipo.jsp").forward(request, response);
    }

    // actualizar datos
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int ranking = Integer.parseInt(request.getParameter("ranking"));
        double valor = Double.parseDouble(request.getParameter("valor"));
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
        boolean profesional = request.getParameter("profesional") != null;

        // gestion de imagen
        Part imagePart = request.getPart("foto");
        String fileName = imagePart.getSubmittedFileName();
        if (fileName.isEmpty()) {
            fileName = request.getParameter("fotoActual"); // campo oculto del JSP
        } else {
            imagePart.write(getServletContext().getRealPath("/") + "uploads/" + fileName);
        }

        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        equipoDao.updateEquipo(nombre, ranking, valor, fecha, profesional, fileName, id);

        response.sendRedirect("list-equipos");
    }
}