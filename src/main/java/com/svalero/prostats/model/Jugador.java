package com.svalero.prostats.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jugador {
    private int id;
    private String nickname;
    private int edad;
    private double kda_ratio;
    private LocalDate fechaFinContrato;
    private boolean esTitular;
    private int idEquipo;
}
