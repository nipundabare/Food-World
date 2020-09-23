/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.localpost;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "deletePost", urlPatterns = {"/deletePost"})
public class deletePost extends HttpServlet {
    int userid = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("user").toString();
            List<localpost> pd = progectdetails(name);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("DeletePost.jsp");
            r.forward(request, response);
        }catch(Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ID = request.getParameter("id");
      try {
                DB.iud("DELETE FROM `posts` WHERE id='"+Integer.parseInt(ID)+"'");
                response.sendRedirect("user_admin.jsp");
        }catch (Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        } 
    }
      public List<localpost> progectdetails(String name) throws Exception {
        ArrayList<localpost> progs = new ArrayList<localpost>();
        ResultSet uid = DB.search("SELECT id FROM `locals` WHERE email='"+name+"'");
            if (uid.next()) {
                userid= Integer.parseInt(uid.getString(1));
            }
        ResultSet rs = DB.search("SELECT * FROM `posts` WHERE `uid` ='"+userid+"'");
        while (rs.next()) {
            localpost pb = new localpost();
            pb.setProgid(rs.getString(1));
            pb.setTitle(rs.getString(2));
            pb.setDescription(rs.getString(3));
            pb.setImage(rs.getString(4));
            progs.add(pb);
        }
        return progs;
    }
}
