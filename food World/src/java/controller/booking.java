/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author F.R.I.D.A.Y
 */
@WebServlet(name = "booking", urlPatterns = {"/booking"})
public class booking extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            int userid=0;
            int count=0;
            String date = request.getParameter("date");
            String phone= request.getParameter("phone");
            String time=request.getParameter("time");
            String food=request.getParameter("food");
            String number_people = request.getParameter("number_people");

            try{
                HttpSession session = request.getSession(true);
                String name =(String)session.getAttribute("user");
                String pid =(String)session.getAttribute("pid");
                
                ResultSet search = DB.search("SELECT COUNT(*) FROM `bookings`");
                if (search.next()) {
                count += Integer.parseInt(search.getString(1));
                 }
            String id = "" + count;
                
            ResultSet uid = DB.search("SELECT id FROM `foreigners` WHERE email='"+name+"'");
            if (uid.next()) {
                    userid = Integer.parseInt(uid.getString(1));
                    DB.iud("INSERT INTO `bookings`(`bid`,`uid`,`pid`,`date`, `phone`, `time`, `food`, `number_people`) VALUES ('"+id+"','"+userid+"','"+pid+"','"+date+"','"+phone+"','"+time+"','"+food+"','"+number_people+"')");
                    response.sendRedirect("foreignindex.jsp");
            } 
            }catch (Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        }
    }
}
