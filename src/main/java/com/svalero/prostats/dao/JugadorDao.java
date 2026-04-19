package com.svalero.prostats.dao;

import com.svalero.prostats.model.Jugador;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import java.time.LocalDate;
import java.util.List;

@RegisterRowMapper(JugadorMapper.class)
public interface JugadorDao {

    // C
    @SqlUpdate("INSERT INTO jugadores (nickname, edad, kda_ratio, fecha_fin_contrato, es_titular, id_equipo) VALUES (?, ?, ?, ?, ?, ?)")
    void addJugador(String nickname, int edad, double kda_ratio, LocalDate fecha_fin_contrato, boolean es_titular, int id_equipo);

    // R
    @SqlQuery("SELECT * FROM jugadores")
    List<Jugador> getJugadores();

    @SqlQuery("SELECT * FROM jugadores WHERE id = ?")
    Jugador getJugador(int id);

    // U
    @SqlUpdate("UPDATE jugadores SET nickname = ?, edad = ?, kda_ratio = ?, fecha_fin_contrato = ?, es_titular = ?, id_equipo = ? WHERE id = ?")
    void updateJugador(String nickname, int edad, double kda_ratio, LocalDate fecha_fin_contrato, boolean es_titular, int id_equipo, int id);

    // D
    @SqlUpdate("DELETE FROM jugadores WHERE id = ?")
    void deleteJugador(int id);
}
