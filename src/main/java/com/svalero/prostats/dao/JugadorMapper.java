package com.svalero.prostats.dao;

import com.svalero.prostats.model.Jugador;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JugadorMapper implements RowMapper<Jugador> {

    @Override
    public Jugador map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Jugador(
                rs.getInt("id"),
                rs.getString("nickname"),
                rs.getInt("edad"),
                rs.getDouble("kda_ratio"),
                rs.getDate("fecha_fin_contrato").toLocalDate(),
                rs.getBoolean("es_titular"),
                rs.getInt("id_equipo")
        );
    }
}
