/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author F.R.I.D.A.Y
 */
@WebServlet(name = "logindecline", urlPatterns = {"/logindecline"})
public class logindecline extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String  remove = request.getParameter("remove");
        String reject = request.getParameter("reject");
       
      try {

            if(reject.equals("reject")){
                DB.iud("DELETE FROM `locals` WHERE id = '"+Integer.parseInt(remove)+"'");
                response.sendRedirect("admin.jsp");
            }
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print(ex);

        }
    }


}
