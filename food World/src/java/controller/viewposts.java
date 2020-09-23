/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.localpost;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Randika
 */
@WebServlet(name = "viewposts", urlPatterns = {"/viewposts"})
public class viewposts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            
            List<localpost> pd = progectdetails("100");
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("index.jsp");
            r.forward(request, response);

        } catch (Exception ex) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
     public List<localpost> progectdetails(String id) throws Exception {
        ArrayList<localpost> progs = new ArrayList<localpost>();
        ResultSet rs = DB.search("SELECT * FROM `posts` WHERE `uid` !='"+id+"'");
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
