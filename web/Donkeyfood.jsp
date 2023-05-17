<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
  <head>
    <link rel="icon" href="assets/images/DonkeyFood.png">
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
      rel="stylesheet"
    />

    <title>DonkeyFood</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <link rel="stylesheet" href="assets/css/DFoodStyle.css" />
    <!---->

  </head>
<body>
      <div>    
            <div class="row">
                <div class="col-lg-1">
                    <div class="Logo">
                    <img src="assets/images/DonkeyFood.png" width="150px" alt="Logo_DonkeyFood" />
                    </div>
                </div>
                <div class="col-lg-6">
                <div class="Namebox">
                    <font color="#1d134b"><b><center>CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS N°9</center></b></font>
                </div>
                </div>
            </div>
          
      </div>
         
        <!-- **** Menu de la comida ****-->
        <section class="testimonials" id="testimonials">
          <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                  <h6>Menu</h6>
                  <h4><em>Destacados</em> del Dia</h4>
                  <a href="MenuDF.jsp"><h6 class="floating">Ver menu Completo ></h4></a>
                </div>
              </div>
              <div class="col-lg-12">
                <div
                  class="owl-testimonials owl-carousel"
                  style="position: relative; z-index: 5"
                >
                  <div class="item">
                    <img src="assets/images/hamburguesa.jpg" alt="Hamburguesa" sizes="20px">
                    <p>
                      Una buena hamburguesa para pasar el hambre
                    </p>
                    <h4>Hamburguesa</h4>
                    <span>35$</span>
                  </div>
                  <div class="item">
                    <img src="assets/images/Chilaquiles.jpg" alt="Chilaquiles">
                    <p>
                      Unos sabrosos chilaquiles acompañados de un bolillo
                    </p>
                    <h4>Chilaquiles</h4>
                    <span>30$</span>
                  </div>
                  <div class="item">
                    <img src="assets/images/Tortas.jpg" alt="Tortas">
                    <p>
                      Unas sabrosas y variadas tortas llenas de energia para pasar el dia
                    </p>
                    <h4>Tortas</h4>
                    <span>25$</span>
                  </div>
                  <div class="item">
                    <img src="assets/images/Pizza.jpg" alt="Rebanadas_de_pizza">
                    <p>
                      Rebanadas de pizza llenas de sabor y calentadas al momento
                    </p>
                    <h4>Rebanadas de pizza</h4>
                    <span>25$</span>
                  </div>
                  <div class="item">
                    <img src="assets/images/Pastes.jpg" alt="Rebanadas_de_pizza">
                    <p>
                      Deliciosos pastes calientitos, tanto dulces como salados listos para llevar
                    </p>
                    <h4>Pastes</h4>
                    <span>22$</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
    
        <section class="contact-us" id="contact-section">
          <div class="container">
            <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
              <li>
                <a href="facebook.com"><i class="fa fa-facebook"></i></a>
              </li>
              <li>
                <a href="twitter.com"><i class="fa fa-twitter"></i></a>
              </li>
            </ul>
          </div>
              <div class="col-lg-12">
                <p class="copyright">
                  Copyright © 2022 Lightvery, DonkeyFood. Todos Los Derechos Reservados.
                </p>
              </div>
            </div>
          </div>
        </section>
    
        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/lightbox.js"></script>
        <script src="assets/js/tabs.js"></script>
        <script src="assets/js/video.js"></script>
        <script src="assets/js/slick-slider.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
          //according to loftblog tut
          $(".nav li:first").addClass("active");
    
          var showSection = function showSection(section, isAnimate) {
            var direction = section.replace(/#/, ""),
              reqSection = $(".section").filter(
                '[data-section="' + direction + '"]'
              ),
              reqSectionPos = reqSection.offset().top - 0;
    
            if (isAnimate) {
              $("body, html").animate(
                {
                  scrollTop: reqSectionPos,
                },
                800
              );
            } else {
              $("body, html").scrollTop(reqSectionPos);
            }
          };
    
          var checkSection = function checkSection() {
            $(".section").each(function () {
              var $this = $(this),
                topEdge = $this.offset().top - 80,
                bottomEdge = topEdge + $this.height(),
                wScroll = $(window).scrollTop();
              if (topEdge < wScroll && bottomEdge > wScroll) {
                var currentId = $this.data("section"),
                  reqLink = $("a").filter("[href*=\\#" + currentId + "]");
                reqLink
                  .closest("li")
                  .addClass("active")
                  .siblings()
                  .removeClass("active");
              }
            });
          };
    
          $(".main-menu, .responsive-menu, .scroll-to-section").on(
            "click",
            "a",
            function (e) {
              e.preventDefault();
              showSection($(this).attr("href"), true);
            }
          );
    
          $(window).scroll(function () {
            checkSection();
          });
        </script>
</body>
</html>