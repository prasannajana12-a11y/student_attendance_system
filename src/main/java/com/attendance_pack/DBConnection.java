package com.attendance_pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

     static  String URL = "jdbc:mysql://localhost:3306/student_attendance";

    static  String USER = "root";

    static  String PASSWORD ="jana";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("MySQL Connected Successfully!");

            return con;

        } catch (Exception e) {

            System.out.println("MySQL Connection Failed!");

            e.printStackTrace();

            return null;
        }
    }
}