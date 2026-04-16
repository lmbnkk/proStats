package com.svalero.prostats.controller;

import com.svalero.prostats.dao.UsuarioDao;
import com.svalero.prostats.model.Usuario;
import com.svalero.prostats.util.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// se activa al enviar /login
@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    // doPost esconde los datos
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // el servlet coge los datos del formulario
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // se crea una instancia de la interfaz
        UsuarioDao usuarioDao = Database.getJdbi().onDemand(UsuarioDao.class);

        // se busca al usuario
        Usuario usuario = usuarioDao.getUsuario(user,pass);

        if (usuario != null) {

            // login válido
            HttpSession session = request.getSession();
            session.setAttribute("usuarioActual", usuario);

            // se redirige al index
            response.sendRedirect("index.jsp");

        } else {

            // login error
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
