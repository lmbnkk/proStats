package com.svalero.prostats.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Torneo {
    private int id;
    private String nombreEvento;
    private int maximoEquipos;
    private double premio;
    private LocalDate fechaEvento;
    private boolean esPresencial;
    private int idGanador;
}
