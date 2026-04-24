package com.svalero.prostats.dao;

import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.model.Torneo;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import java.time.LocalDate;
import java.util.List;

@RegisterRowMapper(TorneoMapper.class)
public interface TorneoDao {

    // C
    @SqlUpdate("INSERT INTO torneos (nombre_evento, maximo_equipos, premio, fecha_evento, es_presencial) VALUES (?, ?, ?, ?, ?)")
    void addTorneo(String nombre_evento, int maximo_equipos, double premio, LocalDate fecha_evento, boolean es_presencial);

    // R
    @SqlQuery("SELECT * FROM torneos")
    List<Torneo>  getTorneos();

    @SqlQuery("SELECT * FROM torneos WHERE id = ?")
    Torneo getTorneo(int id);

    // U
    @SqlUpdate("UPDATE torneos SET nombre_evento = ?, maximo_equipos = ?, premio = ?, fecha_evento = ?, es_presencial = ? WHERE id = ?")
    void updateTorneo(String nombre_evento, int maximo_equipos, double premio, LocalDate fecha_evento, boolean es_presencial, int id);

    // D
    @SqlUpdate("DELETE FROM torneos WHERE id = ?")
    void deleteTorneo(int id);

    // Búsqueda
    @SqlQuery("SELECT * FROM torneos WHERE nombre_evento LIKE ? AND (es_presencial = ? OR ? = -1)")
    List<Torneo> searchTorneos(String nombre, int esPresencial, int comprobacion);
}
