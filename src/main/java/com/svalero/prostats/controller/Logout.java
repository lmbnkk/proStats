package com.svalero.prostats.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class Logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // sesión del usuario
        HttpSession session = request.getSession();

        // se cierra la sesión
        session.invalidate();

        // redirección a index
        response.sendRedirect("index.jsp");
    }
}