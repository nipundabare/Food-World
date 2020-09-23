/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.localpost;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author F.R.I.D.A.Y
 */
@WebServlet(name = "editPost", urlPatterns = {"/editPost"})
@MultipartConfig(fileSizeThreshold=1024*1024*10,
        maxFileSize=1024*1024*1000,
        maxRequestSize=1024*1024*1000)
public class editPost extends HttpServlet {
    int userid = 0;
    PrintWriter out=null;
    Connection conn=null;
    PreparedStatement statement=null;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             
            
            HttpSession session = request.getSession();
            String name = session.getAttribute("user").toString();
            List<localpost> pd = progectdetails(name);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("EditPost.jsp");
            r.forward(request, response);

        }catch(Exception ex){
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            out=response.getWriter();
            String folderName="resources";
            String uploadPath= request.getServletContext().getRealPath("") + File.separator +folderName;
            File dir = new File(uploadPath);
            if(!dir.exists()){
                dir.mkdirs();
            }
            
            localpost cb = new localpost();
            String ID = request.getParameter("ID");
            cb.setTitle(request.getParameter("Titles"));
            cb.setDescription(request.getParameter("Description"));
            Part filePart = request.getPart("file");
            String Title = cb.getTitle();
            String Desc = cb.getDescription();
            String fileName=filePart.getSubmittedFileName();
            String path= File.separator + fileName;
            System.out.println("fileName: "+fileName);
              System.out.println("Path: "+uploadPath);
                System.out.println("Name: "+Title);
            InputStream is = filePart.getInputStream();
            Files.copy(is,Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
            
            DB.iud("UPDATE `posts` SET `title`='"+Title+"',`description`='"+Desc+"',`img`='"+path+"' WHERE `id` ='"+ID+"'");
            getServletContext().getRequestDispatcher("/user_admin.jsp").forward(request, response);
            }
            catch (Exception ex) {
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
