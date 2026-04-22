package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/add-equipo")
@MultipartConfig // Obligatorio para manejar imágenes
public class AddEquipo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // parámetros básicos
        String nombre = request.getParameter("nombre");
        String rankingStr = request.getParameter("ranking");
        String valorStr = request.getParameter("valor");
        String fechaStr = request.getParameter("fecha");
        boolean profesional = request.getParameter("profesional") != null;

        // validación
        if (nombre == null || nombre.trim().isEmpty() || Integer.parseInt(rankingStr) < 0) {
            response.sendRedirect("add-equipo?error=validacion");
            return;
        }

        // para la imagen
        Part imagePart = request.getPart("foto");
        String fileName = imagePart.getSubmittedFileName();

        // ruta de guardado (webapp/uploads)
        String path = getServletContext().getRealPath("/") + "uploads/";
        File uploadsDir = new File(path);
        if (!uploadsDir.exists()) uploadsDir.mkdir(); // se crea si no existe

        // se guarda la imagen
        imagePart.write(path + fileName);

        try {
            EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
            equipoDao.addEquipo(nombre,
                    Integer.parseInt(rankingStr),
                    Double.parseDouble(valorStr),
                    LocalDate.parse(fechaStr),
                    profesional,
                    fileName); // se guarda en db

            response.sendRedirect("index.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-equipo.jsp?error=1");
        }
    }
}
