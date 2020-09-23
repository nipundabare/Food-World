<%-- 
    Document   : user_admin
    Created on : 04-Jun-2019, 08:07:51
    Author     : F.R.I.D.A.Y
--%>

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
  
  <div class="bg-image"></div>

 

  <div class="bg-text">
    <font color="white"> <h1>Admin panel for your profile</h1></font><br><br>
                  <em>Hello<%=session.getAttribute("user")%></em> <br><br>
    <a class="list-group-item2" href="AddPost.jsp">Add Posts to your profile</a>
          <a class="list-group-item2" href="deletePost">Delete Posts to your profile</a>
          <a class="list-group-item2" href="editPost">Edit Posts to your profile</a>
          <a class="list-group-item2" href="logout">Log out</a>
  </div> 
</body>
</html>