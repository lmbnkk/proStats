package com.svalero.prostats.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Equipo {
    private int id;
    private String nombre;
    private int puestoRanking;
    private double valorMercado;
    private LocalDate fechaFundacion;
    private boolean esProfesional;
    private String fotoPerfil;
}