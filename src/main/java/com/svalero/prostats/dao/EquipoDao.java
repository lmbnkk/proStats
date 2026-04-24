package com.svalero.prostats.dao;

import com.svalero.prostats.model.Equipo;
import com.svalero.prostats.model.Jugador;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import java.time.LocalDate;
import java.util.List;

@RegisterRowMapper(EquipoMapper.class)
public interface EquipoDao {

    // C
    @SqlUpdate("INSERT INTO equipos (nombre, puesto_ranking, valor_mercado, fecha_fundacion, es_profesional, foto_perfil) VALUES (?, ?, ?, ?, ?, ?)")
    void addEquipo(String nombre, int ranking, double valor, LocalDate fecha, boolean profesional, String foto);

    // R
    @SqlQuery("SELECT * FROM equipos")
    List<Equipo> getEquipos();

    @SqlQuery("SELECT * FROM equipos WHERE id = ?")
    Equipo getEquipo(int id);

    // U
    @SqlUpdate("UPDATE equipos SET nombre = ?, puesto_ranking = ?, valor_mercado = ?, fecha_fundacion = ?, es_profesional = ?, foto_perfil = ? WHERE id = ?")
    void updateEquipo(String nombre, int ranking, double valor, LocalDate fecha, boolean profesional, String foto, int id);

    // D
    @SqlUpdate("DELETE FROM equipos WHERE id = ?")
    void deleteEquipo(int id);

    // Búsqueda
    @SqlQuery("SELECT * FROM equipos WHERE nombre LIKE ? AND (es_profesional = ? OR ? = -1)")
    List<Equipo> searchEquipos(String nombre, int esProfesional, int comprobacion);
}