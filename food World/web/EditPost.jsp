<%-- 
    Document   : EditPosts
    Created on : 04-Jun-2019, 08:08:53
    Author     : F.R.I.D.A.Y
--%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page import="beans.localpost"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Villa user admin panel</title>
  <link href="Content/bootstrap.css" rel="stylesheet" />
  <link href="Content/newstyle.css" rel="stylesheet" />
  
  <script src="Scripts/jquery-1.11.0.min.js"></script>
  <script src="Scripts/bootstrap.min.js"></script>
  
</head>
<body>
  <div class="bg-imagedel"></div>
  <div class="bg-text">
 <form name = "editPost" action="editPost" method="POST" enctype="multipart/form-data">
  
        <h2>Edit Posts</h2>
        <br><br>
        <center>
            <table border="1px">
       <thead>
         <tr>
           <th>Post ID</th>
           <th>Post Title</th>
           <th>Post Description</th>
           <th>Image</th>
         </tr>
       </thead>
         <tbody>
              <%
            ArrayList<localpost> posts = (ArrayList<localpost>) request.getAttribute("progects");
            for (localpost post : posts) {
                                            %>
               <tr>
                 <td><%=post.getProgid()%></td>
                 <td><%=post.getTitle()%></td>
                 <td><%=post.getDescription()%></td>
                 <td><img src="resources/<%= post.getImage()%>" height="100;" width="100"/></td>
                  <% } %>
               </tr>  
             </tbody>
     </table>
     </center>
     <br><br>
     <h3>Enter Your New Details</h3>
     <center>
     <div class="row">
        <div class="col-sm-6">
          <div class="panel panel-primary">
            <div class="panel-heading">
              Posts Information
            </div>
            <div class="panel-body">
                <div class="form-group">
                <label for="productname">
                 <font color="black"> Post ID</font>
                </label>
                <input type="text" class="form-control" value="ID" id="Title" name="ID"/>
              </div>
              <div class="form-group">
                <label for="productname">
                    <font color="black"> Post Title </font>
                </label>
                <input type="text" class="form-control" value="Title" id="Title" name="Titles"/>
              </div>
              <div class="form-group">
                <label for="introdate">
                    <font color="black"> Post Description </font>
                </label>
                <input type="text" class="form-control" value="Description" id="Description" name="Description"/>
              </div>
                 <div class="form-group">
                <label for="productname">
                    <font color="black"> Image </font>
                </label>
                <input type="file" class="form-control" value="upload your image" id="file" name="file"/>
              </div>
            </div>
            <div class="panel-footer">
              <div class="row">
                <div class="col-xs-12">
                  <Input type="submit" id="updateButton" class="btn btn-primary" value="Add">
  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </center>
  </div>
</div>
 </form>

</body>
</html>
