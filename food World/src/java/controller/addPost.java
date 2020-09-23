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
import java.sql.SQLException;
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
@WebServlet(name = "addPost", urlPatterns = {"/addPost"})
@MultipartConfig(fileSizeThreshold=1024*1024*10,
        maxFileSize=1024*1024*1000,
        maxRequestSize=1024*1024*1000)
public class addPost extends HttpServlet {
    PrintWriter out=null;
    Connection conn=null;
    PreparedStatement statement=null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain,charset=UTF-8");
        try {
            out=response.getWriter();
            String folderName="resources";
            String uploadPath= request.getServletContext().getRealPath("") + File.separator +folderName;
            File dir = new File(uploadPath);
            if(!dir.exists()){
                dir.mkdirs();
            }
            int count = 0;
            int userid = 0;
            localpost cb = new localpost();

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
            
            //get the userID from Session
            HttpSession session = request.getSession(true);
            String name =(String)session.getAttribute("user");
            ResultSet uid = DB.search("SELECT id FROM `locals` WHERE email='"+name+"'");
            if (uid.next()) {userid= Integer.parseInt(uid.getString(1));}
            
            //Create auto increament ID for the Post
            ResultSet search = DB.search("SELECT COUNT(*) FROM `posts`");
            if (search.next()) {count += Integer.parseInt(search.getString(1));}
            String id = "" + count;
            
            try{
                    // connects to the database
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/villa","root","");

                // constructs SQL statement
                String sql = "insert into posts(id, title, description,img,uid) values(?,?,?,?,?)";
                statement = conn.prepareStatement(sql);
                statement.setString(1, id);
                statement.setString(2, Title);
                statement.setString(3, Desc);
                statement.setString(4, path);
                statement.setString(5, Integer.toString(userid));
                statement.executeUpdate();
                getServletContext().getRequestDispatcher("/user_admin.jsp").forward(request, response);
            }catch(Exception ex){
                PrintWriter writer = response.getWriter();
                writer.print(ex);
            }
            finally{
                    try{
                        if(statement !=null){
                            statement.close();
                        }
                        if(conn !=null){
                            conn.close();
                        }
                    } catch(SQLException e){
                        out.println(e);
                    }
                }
            }
            catch (Exception ex) {
                PrintWriter writer = response.getWriter();
                writer.print(ex);
            }
    }
}
