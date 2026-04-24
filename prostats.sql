CREATE DATABASE IF NOT EXISTS ProStats;

USE ProStats;

CREATE TABLE IF NOT EXISTS usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(100) UNIQUE NOT NULL,
	password VARCHAR(100) NOT NULL,
	es_admin BOOLEAN DEFAULT FALSE,
	credibilidad DECIMAL (10,2) DEFAULT 0.00,
	fecha_creacion DATE,
	nivel INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS equipos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	puesto_ranking INT DEFAULT 0,
	valor_mercado DECIMAL (10,2) DEFAULT 0.00,
	fecha_fundacion DATE,
	es_profesional BOOLEAN DEFAULT TRUE,
	foto_perfil VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS jugadores (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nickname VARCHAR(100) UNIQUE NOT NULL,
	edad INT DEFAULT 0,
	kda_ratio DECIMAL (10,2) DEFAULT 0.00,
	fecha_fin_contrato DATE,
	es_titular BOOLEAN DEFAULT TRUE,
	id_equipo INT,
	FOREIGN KEY (id_equipo) REFERENCES equipos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS torneos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre_evento VARCHAR(100) UNIQUE NOT NULL,
	maximo_equipos INT DEFAULT 0,
	premio DECIMAL (10,2) DEFAULT 0.00,
	fecha_evento DATE,
	es_presencial BOOLEAN DEFAULT TRUE
);


-- 1. USUARIOS (Admin y Usuarios estándar)
INSERT INTO usuarios (username, password, es_admin, credibilidad, fecha_creacion, nivel) VALUES 
('admin', 'admin', TRUE, 100.00, '2026-01-01', 99),
('user1', 'user1', FALSE, 85.50, '2026-02-15', 10),
('user2', 'user2', FALSE, 50.00, '2026-03-10', 5),
('user3', 'user3', FALSE, 90.00, '2026-01-20', 20),
('user4', 'user4', FALSE, 10.00, '2026-04-01', 1);

-- 2. EQUIPOS (Referencia para los jugadores)
INSERT INTO equipos (nombre, puesto_ranking, valor_mercado, fecha_fundacion, es_profesional, foto_perfil) VALUES 
('G2 Esports', 1, 5000000.00, '2014-02-24', TRUE, 'g2.png'),
('KOI', 15, 1200000.00, '2021-12-15', TRUE, 'koi.png'),
('Heretics', 8, 2500000.00, '2016-08-24', TRUE, 'heretics.png'),
('Team Liquid', 3, 4800000.00, '2000-01-01', TRUE, 'liquid.png'),
('Fenix Gaming', 100, 5000.00, '2025-05-10', FALSE, 'fenix.png');

-- 3. JUGADORES (Relacionados con los equipos mediante id_equipo)
INSERT INTO jugadores (nickname, edad, kda_ratio, fecha_fin_contrato, es_titular, id_equipo) VALUES 
('Caps', 24, 4.50, '2026-11-20', TRUE, 1),
('Elyoya', 23, 3.80, '2027-10-15', TRUE, 3),
('Flakked', 22, 4.10, '2026-12-30', TRUE, 3),
('elPepe', 28, 2.90, '2026-06-01', FALSE, 4),
('Savage_Amateur', 19, 1.20, '2026-08-15', FALSE, 5);

-- 4. TORNEOS
INSERT INTO torneos (nombre_evento, maximo_equipos, premio, fecha_evento, es_presencial) VALUES 
('Major Zaragoza 2026', 16, 1000000.00, '2026-05-20', TRUE),
('MSI London', 12, 500000.00, '2026-07-15', TRUE),
('Open Cup Online', 64, 10000.00, '2026-04-30', FALSE),
('Regional Amateur', 8, 500.00, '2026-09-10', TRUE),
('World Championship', 24, 2500000.00, '2026-11-01', TRUE);