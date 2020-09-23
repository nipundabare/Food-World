<%-- 
    Document   : index
    Created on : 01-Jun-2019, 19:00:19
    Author     : F.R.I.D.A.Y
--%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page import="beans.localpost"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Colorlib Villa</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/aos.css">
    
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"><a href="welcome.jsp"><em>Food World</em></a></div>
          <div class="col-8">

            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6">
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                      </ul>
                    </div>
                    <div class="col-md-6 extra-info">
                      <div class="row">
                        <div class="col-md-6 mb-5">
                          <h3>Contact Info</h3>
                          <p>"Nimali",Duwa temple Rd <br> Kaluthara</p>
                          <p>foodworld@gmail.com</p>
                          <p>+94777777777</p>
                          
                        </div>
                        <div class="col-md-6">
                          <h3>Connect With Us</h3>
                          <ul class="list-unstyled">
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->

    <section class="site-hero overlay" style="background-image: url(img/hero_1.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Welcome to <em>Food World</em></h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">Discover our Local hotel &amp; restaurant </p>
            <p data-aos="fade-up" data-aos-delay="100"><a href="signup.jsp" class="btn uppercase btn-primary mr-md-2 mr-0 mb-3 d-sm-inline d-block">Sign Up</a> <a href="signin.jsp" class="btn uppercase btn-outline-light d-sm-inline d-block">Sign in</a></p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

    <section class="section visit-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="heading" data-aos="fade-right">You Can Visit</h2>
          </div>
        </div>
           
        <div class="row">
          <%
            ArrayList<localpost> posts = (ArrayList<localpost>) request.getAttribute("progects");
            for (localpost post : posts) {
                                            %>
               <div class="col-lg-3 col-md-6 visit mb-3" data-aos="fade-right">
                    <a href="#"><img src="resources/<%= post.getImage()%>" height="250;" width="250" style="border-radius: 8px;" /></a>
                    <h3><a href="#"><%=post.getTitle()%></a></h3>
                    <div class="reviews-star float-left">
                     <%=post.getDescription()%>
                    </div>
                    <span class="reviews-count float-right">
                      3,239 reviews
                    </span>
                </div>
               <% } %> 
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

    <section class="section slider-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up">You stay at home. We deliver.</h2>
            <p class="lead" data-aos="fade-up" data-aos-delay="100">Online food ordering is the process of ordering food from a website or other application. The product is mainly about ready-to-eat food. This provides a great advantage for the customers without having to waste time or money to go out and bring food the food can be delivered to their door step itself.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="10">
              <div class="slider-item">
                <img src="img/img- (1).jpg" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="img/img- (2).jpg" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="img/678.jpg" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="img/img- (5).jpg" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="img/img- (69).jpg" alt="Image placeholder" class="img-fluid">
              </div>
              
            </div>
            <!-- END slider -->
          </div>

          <div class="col-md-12 text-center"><a href="#" class="">View More Photos</a></div>
        
        </div>
      </div>
    </section>
    <!-- END section -->
    
    <section class="section blog-post-entry bg-pattern">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up">Recent Blog Post</h2>
            <p class="lead" data-aos="fade-up">Our recent blog posts by most famous bloggers in the world.  </p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="100">

            <div class="media media-custom d-block mb-4">
              <a href="#" class="mb-4 d-block"><img src="img/vine.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">Five Reasons to visit food and wine events</a></h2>
              </div>
            </div>

          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="200">
            <div class="media media-custom d-block mb-4">
              <a href="#" class="mb-4 d-block"><img src="img/carnival.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">Five Reasons to visit food carnivals</a></h2>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="300">
            <div class="media media-custom d-block mb-4">
              <a href="#" class="mb-4 d-block"><img src="img/street food.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">Five Reasons to eat street food</a></h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Terms &amp; Conditions</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Help</a></li>
             <li><a href="#">Rooms</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">Our Location</a></li>
              <li><a href="#">The Hosts</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li><a href="#">Restaurant</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <p><span class="d-block">Address:</span> <span> "Nimali" Duwa Temple Road<br>Kaluthara</span></p>
            <p><span class="d-block">Phone:</span> <span> +94773851530</span></p>
            <p><span class="d-block">Email:</span> <span> foodworld@gmail.com</span></p>
          </div>
          <div class="col-md-3 mb-5">
            <p>Sign up for our newsletter</p>
            <form action="#" class="footer-newsletter">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Your email...">
                <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            
          <p class="col-md-6 text-right social">
            <a href="#"><span class="fa fa-tripadvisor"></span></a>
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
          </p>
        </div>
      </div>
    </footer>
    
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>