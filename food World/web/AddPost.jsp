
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Villa user admin panel</title>
  <link href="Content/bootstrap.css" rel="stylesheet" />
  <link href="Content/newstyle.css" rel="stylesheet" />
  <script src="Scripts/jquery-1.11.0.min.js"></script>
  <script src="Scripts/bootstrap.min.js"></script>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<style type="text/css">
.form-style-8{
	font-family: 'Open Sans Condensed', arial, sans;
	width: 500px;
	padding: 30px;
	background: #FFFFFF;
	margin: 50px auto;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-webkit-box-shadow:  0px 0px 15px rgba(0, 0, 0, 0.22);

}
.form-style-8 h2{
	background: #2B60DE;
	text-transform: uppercase;
	font-family: 'Open Sans Condensed', sans-serif;
	color: white;
	font-size: 18px;
	font-weight: 100;
	padding: 20px;
	margin: -30px -30px 30px -30px;
}
.form-style-8 input[type="text"],
.form-style-8 input[type="date"],
.form-style-8 input[type="datetime"],
.form-style-8 input[type="email"],
.form-style-8 input[type="number"],
.form-style-8 input[type="search"],
.form-style-8 input[type="time"],
.form-style-8 input[type="url"],
.form-style-8 input[type="password"],
.form-style-8 textarea,
.form-style-8 select 
{
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	width: 100%;
	padding: 7px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	margin-bottom: 10px;
	font: 16px Arial, Helvetica, sans-serif;
	height: 45px;
}
.form-style-8 textarea{
	resize:none;
	overflow: hidden;
}
.form-style-8 input[type="button"], 
.form-style-8 input[type="submit"]{
	-moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	-webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	box-shadow: inset 0px 1px 0px 0px #45D6D6;
	background-color: #2CBBBB;
	border: 1px solid #27A0A0;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	font-family: 'Open Sans Condensed', sans-serif;
	font-size: 14px;
	padding: 8px 18px;
	text-decoration: none;
	text-transform: uppercase;
}
.form-style-8 input[type="button"]:hover, 
.form-style-8 input[type="submit"]:hover {
	background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
	background-color:#34CACA;
}
</style>
</head>
<body>
	<div class="bg-image"></div>
	<div class="bg-text">
  <font color ="white" size="5px"><b>Welcome <em><%=session.getAttribute("user")%></em></b></font>
  
  <center>
      <center><font color="white"><h2>Add Post</h2></font></center>
  <div class="form-style-8">
      <b><h2>Post Information</h2></b>
  <form name = "addPost" action="addPost" method="POST" enctype="multipart/form-data" >
    <font color="black" size="3px"><b>Title Of The Post</b></font>
    <br>
  <input type="text" class="form-control" value="Title" id="Title" name="Titles"/>
  <br>
  <font color="black" size="3px"><b>Post Description</b></font>
  <br>
  <input type="text" class="form-control" value="Description" id="Description" name="Description"/>
  <br>
  <font color="black" size="3px"><b>Select A Image</b></font>
  <br>
  <input type="file"  value="upload your image" id="file" name="file"/>
  <br><br>
  <input type="submit" id="updateButton" class="btn btn-primary" value="Add">
  </form>
</div>
</div>
</center>
</body>
</html>

