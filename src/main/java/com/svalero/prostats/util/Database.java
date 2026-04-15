package com.svalero.prostats.util;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

public class Database {
    public static Jdbi getJdbi() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Jdbi jdbi = Jdbi.create("jdbc:mariadb://localhost:3306/ProStats", "root", "1234");
        jdbi.installPlugin(new SqlObjectPlugin());
        return jdbi;
    }
}