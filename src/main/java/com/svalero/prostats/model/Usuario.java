package com.svalero.prostats.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    private int id;
    private String username;
    private String password;
    private boolean esAdmin;
    private double credibilidad;
    private LocalDate fechaCreacion;
    private int nivel;
}
