package com.svalero.prostats.dao;

import com.svalero.prostats.model.Usuario;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

public interface UsuarioDao {

    @SqlQuery("SELECT * FROM usuarios WHERE username = ? AND password =?")
    @RegisterBeanMapper(Usuario.class)
    Usuario getUsuario(String username, String password);
}
