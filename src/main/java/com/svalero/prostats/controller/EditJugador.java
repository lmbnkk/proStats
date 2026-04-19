package com.svalero.prostats.controller;

import com.svalero.prostats.dao.EquipoDao;
import com.svalero.prostats.dao.JugadorDao;
import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.model.Jugador;
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

@WebServlet("/update-jugador")
@MultipartConfig
public class EditJugador extends HttpServlet {

    // datos viejos al formulario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        Jugador jugador = jugadorDao.getJugador(id);

        // carga equipos previamente
        EquipoDao equipoDao = Database.getJdbi().onDemand(EquipoDao.class);
        java.util.List<com.svalero.prostats.model.Equipo> equipos = equipoDao.getEquipos();

        request.setAttribute("equipos", equipos);
        request.setAttribute("jugador", jugador);
        request.getRequestDispatcher("update-jugador.jsp").forward(request, response);
    }

    // actualizar datos
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nickname = request.getParameter("nickname");
        int edad = Integer.parseInt(request.getParameter("edad"));
        double kda_ratio = Double.parseDouble(request.getParameter("kda_ratio"));
        LocalDate fecha_fin_contrato = LocalDate.parse(request.getParameter("fecha_fin_contrato"));
        boolean titular = request.getParameter("es_titular") != null;
        int id_equipo = Integer.parseInt(request.getParameter("id_equipo"));

        JugadorDao jugadorDao = Database.getJdbi().onDemand(JugadorDao.class);
        jugadorDao.updateJugador(nickname, edad, kda_ratio, fecha_fin_contrato, titular, id_equipo, id);

        response.sendRedirect("list-jugadores");
    }
}