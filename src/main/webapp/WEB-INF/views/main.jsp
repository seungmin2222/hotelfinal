<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>LuxuryHotel a Hotel Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  </head>
  <body>
    
  <jsp:include page="./inc/top.jsp"></jsp:include>
    <!-- END header -->

    <section class="index-site-hero overlay" data-stellar-background-ratio="0.5" style="background-image: url(${pageContext.request.contextPath}/resources/images/main01.jpg);">
<!--       <div class="container"> -->
<!--         <div class="row align-items-center site-hero-inner justify-content-center"> -->
<!--           <div class="col-md-12 text-center"> -->

<!--             <div class="mb-5 element-animate"> -->
<!--               <h1>Welcome To Our Luxury Rooms</h1> -->
<!--               <p>Discover our world's #1 Luxury Room For VIP.</p> -->
<!--               <p><a href="booknow.html" class="btn btn-primary">Book Now</a></p> -->
<!--             </div> -->

<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    </section>
    <!-- END section -->

    <section class="site-section" style="background:#e1e1e1;">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-4">
            <div class="heading-wrap text-center element-animate">
              <h4 class="sub-heading">STAY WITH OUR COZY ROOMS</h4>
              <h2 class="heading">
                 HEALING<br>
                 IN THE PLACE
              </h2>
              <p class="mb-5">????????? ????????? ?????? ??????</p>
              <p><a href="${pageContext.request.contextPath}/sub/facilities" class="btn btn-primary btn-sm">MORE ABOUT US</a></p>
            </div>
          </div>
          <div class="col-md-1"></div>
          <div class="col-md-7">
            <img src="${pageContext.request.contextPath}/resources/images/main02.png" alt="Image placeholder" class="img-md-fluid">
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

    <section class="site-section bg-light">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12 heading-wrap text-center">
            <h4 class="sub-heading">OUR COZY ROOMS</h4>
              <h2 class="heading">Featured Rooms</h2>
          </div>
        </div>
        <div class="row ">
          <div class="col-md-7">
            <div class="media d-block room mb-0">
              <figure>
                <img src="${pageContext.request.contextPath}/resources/images/main03_room01.png" alt="Generic placeholder image" class="img-fluid">
                <div class="overlap-text">
                  <span>
                    STANDARD ROOM
                  </span>
                </div>
              </figure>
              <div class="media-body">
                <h3 class="mt-0"><a href="${pageContext.request.contextPath}/sub/reservation2">Standard Room</a></h3>
                <ul class="room-specs">
                  <li><span class="ion-ios-people-outline"></span> 2 ???</li>
                  <li><span class="ion-ios-crop"></span> 22 m<sup>2</sup></li>
                </ul>
                <p>
                   ????????? ????????? ???????????? ????????? ???????????? ???????????? ???????????? ???????????? ???????????? ??????????????? ????????????<br>
                   ???????????????????????? ????????? ????????? ?????? ?????????????????? ?????? ??? ?????? ????????? ????????????.
                </p>
                <p><a href="${pageContext.request.contextPath}/sub/reservation2" class="btn btn-primary btn-sm">RESERVATION</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-5 room-thumbnail-absolute">
            <a href="${pageContext.request.contextPath}/sub/reservation2" class="media d-block room bg first-room" style="background-image: url(${pageContext.request.contextPath}/resources/images/main03_room02.png); ">
              <!-- <figure> -->
                <div class="overlap-text">
                  <span>
                    DELUXE ROOM
                  </span>
                </div>
              <!-- </figure> -->
            </a>

            <a href="${pageContext.request.contextPath}/sub/reservation2" class="media d-block room bg second-room" style="background-image: url(${pageContext.request.contextPath}/resources/images/main03_room03.png); ">
              <!-- <figure> -->
                <div class="overlap-text">
                  <span>
                    DELUXE ROOM
                  </span>
                </div>
              <!-- </figure> -->
            </a>
            
          </div>
        </div>
      </div>
    </section>

   
    
    <section class="section-cover" data-stellar-background-ratio="0.5" >
    <img alt="" src="${pageContext.request.contextPath}/resources/images/main04.jpg">
<!--       <div class="container"> -->
<!--         <div class="row justify-content-center align-items-center intro"> -->
<!--           <div class="col-md-9 text-center element-animate"> -->
<!--             <h2>Relax and Enjoy your Holiday</h2> -->
<!--             <p class="lead mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto quidem tempore expedita facere facilis, dolores!</p> -->
<!--             <div class="btn-play-wrap"><a href="https://vimeo.com/channels/staffpicks/93951774" class="btn-play popup-vimeo "><span class="ion-ios-play"></span></a></div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    </section>
    <!-- END section -->
    
    <section class="site-section bg-light">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12 heading-wrap text-center">
            <h4 class="sub-heading">OUR FACILITIES</h4>
              <h2 class="heading">Facilities</h2>
          </div>
        </div>
        <div class="row ">
          <div class="col-md-4">
            <div class="post-entry">
              <img src="${pageContext.request.contextPath}/resources/images/m_facilities_meeting.jpg" alt="Image placeholder" class="img-fluid">
              <div class="body-text">
                <div class="category">Facilities</div>
                <h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/meeting">Meeting</a></h3>
                <p class="mb-4">
               ???????????? ????????? ????????? ?????????, ????????? ????????? ???<br>
               ??????, ???????????? ??? ????????? ?????? ????????? ???????????????.
            </p>
                <p><a href="${pageContext.request.contextPath}/sub/meeting" class="btn btn-primary btn-outline-primary btn-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="post-entry">
              <img src="${pageContext.request.contextPath}/resources/images/m_facilities_flowershop.jpg" alt="Image placeholder" class="img-fluid">
              <div class="body-text">
                <div class="category">Facilities</div>
                <h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/flowerShop">Flower Shop</a></h3>
                <p class="mb-4">
               ????????? ????????? ??????????????? ??????????????? ????????? ??????????????????<br>
               ???????????? ?????? ?????? ????????? ?????? ????????? ????????? ?????????.
            </p>
                <p><a href="${pageContext.request.contextPath}/sub/flowerShop" class="btn btn-primary btn-outline-primary btn-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="post-entry">
              <img src="${pageContext.request.contextPath}/resources/images/m_facilities_wedding.jpg" alt="Image placeholder" class="img-fluid">
              <div class="body-text">
                <div class="category">Facilities</div>
                <h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/wedding">Wedding</a></h3>
                <p class="mb-4">
                   ????????? ??? ??? ?????? ????????? ????????? ???????????? ?????? ????????? ??????,<br>
                   ???????????? ????????? ?????? ??????????????? ?????????????????????.
                </p>
                <p><a href="${pageContext.request.contextPath}/sub/wedding" class="btn btn-primary btn-outline-primary btn-sm">Read More</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
   
   <jsp:include page="./inc/bottom.jsp"></jsp:include>
    <!-- END footer -->
    
    <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  </body>
</html>