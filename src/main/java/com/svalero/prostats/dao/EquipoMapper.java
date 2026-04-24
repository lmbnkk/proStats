package com.svalero.prostats.dao;

import com.svalero.prostats.model.Equipo;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class EquipoMapper implements RowMapper<Equipo> {

    @Override
    public Equipo map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Equipo(
                rs.getInt("id"),
                rs.getString("nombre"),
                rs.getInt("puesto_ranking"),
                rs.getDouble("valor_mercado"),
                rs.getDate("fecha_fundacion").toLocalDate(),
                rs.getBoolean("es_profesional"),
                rs.getString("foto_perfil")
        );
    }
}