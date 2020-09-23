/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.localpost;
import beans.loginbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author F.R.I.D.A.Y
 */
@WebServlet(name = "login_foreign", urlPatterns = {"/login_foreign"})
public class login_foreign extends HttpServlet {
    int userid = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<localpost> pd = progectdetails("10");
            request.setAttribute("progects", pd);
            
            loginbean ub = new loginbean();
            ub.setEmail(request.getParameter("email"));
            ub.setPassword(request.getParameter("pass"));
            
            String pass = ub.getPassword();
            String email= ub.getEmail();
            Cookie loginCookie = new Cookie("user",email);
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            
            String sql = "SELECT * FROM `foreigners` WHERE `email` ='"+email+"' AND `pwd` = '"+pass+"'";
            ResultSet search = DB.search(sql);
            if (search.next()) {

                HttpSession session = request.getSession(true);
                session.setAttribute("user", email);
                RequestDispatcher r = request.getRequestDispatcher("foreignindex.jsp?message=Hello+" + email + "");
                r.forward(request, response);
                
            } else {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login_foreign.jsp?message=<font color=red>Either user name or password is wrong.</font>");
			rd.include(request, response);
            }
        } catch (Exception ex) {
             PrintWriter out = response.getWriter();
             out.print(ex);
        }
    }
    public List<localpost> progectdetails(String name) throws Exception {
        ArrayList<localpost> progs = new ArrayList<localpost>();
        ResultSet rs = DB.search("SELECT * FROM `posts` WHERE `uid` !='"+name+"'");
        while (rs.next()) {
            localpost pb = new localpost();
            pb.setProgid(rs.getString(1));
            pb.setTitle(rs.getString(2));
            pb.setDescription(rs.getString(3));
            pb.setImage(rs.getString(4));
            pb.setUid(Integer.parseInt(rs.getString(5)));
            progs.add(pb);
        }

        return progs;
    }
}

    


