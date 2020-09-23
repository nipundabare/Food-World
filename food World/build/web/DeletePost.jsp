<%-- 
    Document   : DeletePost
    Created on : 04-Jun-2019, 08:07:17
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
 <form name = "deletePost" action="deletePost" method="POST">
  
        <h2>Delete Posts</h2>
        <br><br>
        <center>
        <table id="productTable" 
               class="table table-bordered table-condensed table-striped">
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
                    <td><font color="black"><%=post.getProgid()%></font></td>
                    <td><font color="black"><%=post.getTitle()%></font></td>
                    <td><font color="black"><%=post.getDescription()%></font></td>
                    <td><img src="resources/<%= post.getImage()%>" height="100;" width="100"/></td>
                     <% } %>
                  </tr>  
                </tbody>
        </table>
      </center>
      <br><br>
                  Enter the Post ID which you want to DELETE<input type="text" font color="red"  name="id">&nbsp;<input type="Submit" class="btn btn-danger" value="Delete">

  </div>
</div>
 </form>

</body>
</html>

