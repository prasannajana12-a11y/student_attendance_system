package com.attendance_pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("staff_id") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int staffId =  (Integer) session.getAttribute("staff_id");

        String[] studentIds =  request.getParameterValues("student_id");

        try {

            Connection con =  DBConnection.getConnection();

            String sql =
                "INSERT INTO attendance " +
                "(student_id, attendance_date, status, marked_by) " +
                "VALUES (?, CURDATE(), ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            for (String studentId : studentIds) {
                String status = request.getParameter( "status_" + studentId );
                ps.setInt(1,  Integer.parseInt(studentId) );
                ps.setString(  2, status );
                ps.setInt(3, staffId  );
                ps.addBatch();
            }
            ps.executeBatch();
            con.close();
            response.sendRedirect("success.jsp"  );

        } catch (Exception e) {

            e.printStackTrace();
            response.sendRedirect("Alert.jsp");
        }
    }
}