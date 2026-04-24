package com.svalero.prostats.dao;


import com.svalero.prostats.model.Torneo;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TorneoMapper implements RowMapper<Torneo> {

    @Override
    public Torneo map(ResultSet rs, StatementContext stc) throws SQLException {
        return new Torneo(
                rs.getInt("id"),
                rs.getString("nombre_evento"),
                rs.getInt("maximo_equipos"),
                rs.getDouble("premio"),
                rs.getDate("fecha_evento").toLocalDate(),
                rs.getBoolean("es_presencial")
        );
    }
}
