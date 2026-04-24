# ProStats - Análisis de eSports (AA2)

Aplicación web que actúa como base de datos para el análisis de equipos, jugadores y competiciones de eSports. 
Este proyecto ha sido desarrollado como parte de la Actividad de Aprendizaje de la 2ª Evaluación (AA2) para los módulos de Programación y Bases de Datos.

## Tecnologías

* Java 25
* Jakarta EE 10 (Servlet API 6.1, JSP 3.0)
* MariaDB con **JDBI 3**
* Maven
* Lombok 1.18.42.

## Requisitos

Para ejecutar este proyecto, es imprescindible contar con:

1.  **JDK 25**
2.  **Apache Tomcat 10.1.x o superior** (se ha utilizado Tomcat 11.0.18)
3.  **MariaDB Server**

## Configuración

### 1. Base de Datos
1. Ejecuta el script SQL proporcionado en tu gestor de base de datos.
2. El script creará las tablas (`usuarios`, `equipos`, `jugadores`, `torneos`) e insertará los datos de prueba iniciales.

### 2. Configuración en IntelliJ
1. Abre el proyecto como un proyecto Maven.
2. Configura un servidor **Tomcat 10.1** en las opciones de ejecución.
3. En la pestaña **Deployment**, añade el artefacto `ProStats:war exploded`.
4. Establece el **Application Context** a `/ProStats`.

### 3. Gestión de Imágenes
* Asegúrate de que exista la carpeta `src/main/webapp/uploads`.

## Roles

Se han establecido 2 niveles de acceso: *admin - user*.

Parte de los usuarios creados son:

| Usuario | Contraseña | Rol | Permisos |
| :--- | :--- | :--- | :--- |
| `admin` | `admin` | **Administrador** | CRUD Total |
| `user1` | `user1` | **Usuario** | Consulta y Búsqueda |
