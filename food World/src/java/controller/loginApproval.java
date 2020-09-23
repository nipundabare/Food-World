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
@WebServlet(name = "loginApproval", urlPatterns = {"/loginApproval"})
public class loginApproval extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String approval = request.getParameter("approve");
        String accept = request.getParameter("accept");    
      try {
            if (accept.equals("accept")) {
                DB.iud("UPDATE `locals` SET `status`= 'yes' WHERE id='"+Integer.parseInt(approval)+"'");
                response.sendRedirect("admin.jsp");
            } 
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print(ex);

        }
    }

}
