<%-- 
    Document   : home
    Created on : Sep 19, 2023, 2:19:27 AM
    Author     : lam12
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="courses-master/assets/img/favicon.ico">
        <!-- CSS here -->
        <link rel="stylesheet" href="courses-master/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/slicknav.css">
        <link rel="stylesheet" href="courses-master/assets/css/flaticon.css">
        <link rel="stylesheet" href="courses-master/assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="courses-master/assets/css/gijgo.css">
        <link rel="stylesheet" href="courses-master/assets/css/animate.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/animated-headline.css">
        <link rel="stylesheet" href="courses-master/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="courses-master/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/themify-icons.css">
        <link rel="stylesheet" href="courses-master/assets/css/slick.css">
        <link rel="stylesheet" href="courses-master/assets/css/nice-select.css">
        <link rel="stylesheet" href="courses-master/assets/css/style.css">
        <link rel="stylesheet" href="./css/slider.css">
        <link rel="stylesheet" href="./css/time.css">

        <style>
            #notification {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                text-align: center;
            }
        </style>
        <script>
            // JavaScript để hiển thị thanh thông báo từ trên xuống
            window.onload = function () {
                // Lấy thông điệp từ phạm vi của request
                var message = "<c:out value='${message}' />";

                // Kiểm tra nếu có thông điệp thì hiển thị thanh thông báo
                if (message) {
                    var notification = document.getElementById('notification');
                    notification.innerHTML = message;
                    notification.style.display = 'block';

                    // Tự động ẩn thông báo sau 3 giây (3000 milliseconds)
                    setTimeout(function () {
                        notification.style.display = 'none';
                    }, 3000);
                }
            };
        </script>

    </head>

    <body>
        <div id="notification"></div>
        <jsp:include page="header.jsp"></jsp:include> 

            <main>
                <!--? slider Area Start-->
                <section class="slider-area ">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height d-flex align-items-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-7 col-md-12">
                                        <div class="hero__caption">
                                            <h1 data-animation="fadeInLeft" data-delay="0.2s">Welcome to<br> HolaLearn</h1>
                                            <p data-animation="fadeInLeft" data-delay="0.4s">Build skills with courses, certificates, and degrees online from world-class universities and companies</p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
                </section>
                <!-- ? services-area -->
                <div class="services-area">
                    <div class="container">
                        <div class="row justify-content-sm-center">
                            <div class="col-lg-4 col-md-6 col-sm-8">
                                <div class="single-services mb-30">
                                    <div class="features-icon">
                                        <img src="courses-master/assets/img/icon/icon1.svg" alt="">
                                    </div>
                                    <div class="features-caption">
                                        <h3>60+ UX courses</h3>
                                        <p>The automated process all your website tasks.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-8">
                                <div class="single-services mb-30">
                                    <div class="features-icon">
                                        <img src="courses-master/assets/img/icon/icon2.svg" alt="">
                                    </div>
                                    <div class="features-caption">
                                        <h3>Expert instructors</h3>
                                        <p>The automated process all your website tasks.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-8">
                                <div class="single-services mb-30">
                                    <div class="features-icon">
                                        <img src="courses-master/assets/img/icon/icon3.svg" alt="">
                                    </div>
                                    <div class="features-caption">
                                        <h3>Life time access</h3>
                                        <p>The automated process all your website tasks.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Courses area start -->
                <div class="game-section" >
                    <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Season Discount</h2>

                    <div class="courses-area section-padding40 fix">
                        <div class="container">

                            <div class="courses-actives">
                                <!-- Single -->
                            <jsp:useBean id="k" class="dto.SliderDAO" scope="request"/>
                            <c:forEach items="${k.allSliderDiscount}" var="m">
                                <div class="properties pb-20">
                                    <div class="properties__card">
                                        <div class="properties__img overlay1">
                                            <a href="#"><img src="data:image/jpeg;base64,${m.image}" alt=""></a>
                                        </div>
                                        <div class="properties__caption">
                                            <c:set var="endTime" value="${fn:substring(m.endtime, 0, 19)}" />
                                            <c:set var="currentDateTime" value="${java.time.LocalDateTime.now()}" />

                                            <%-- Chuyển đổi chuỗi thành đối tượng LocalDateTime --%>
                                            <c:set var="endTimeDateTime" value="${java.time.LocalDateTime.parse(endTime)}" />

                                            <c:choose>
                                                <%-- So sánh thời gian --%>
                                                <c:when test="${endTimeDateTime.isAfter(currentDateTime)}">
                                                    <time class="countdown" date-time="${m.endtime} 23:59:59" style="--accent: red"></time>
                                                    <button disabled class="border-btn border-btn2">Find out more</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <time class="countdown" date-time="${m.endtime} 23:59:59" style="--accent: red"></time>
                                                    <button class="border-btn border-btn2" onclick="window.location.href = 'sliderdetail?id=${m.id}'">Find out more</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- Single -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="courses-area section-padding40 fix">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Best Rating Subject</h2>
                            </div>
                        </div>
                    </div>
                    <div class="courses-actives">
                        <!-- Single -->
                        <jsp:useBean id="s" class="dto.SubjectDAO" scope="request"/>
                        <c:forEach var="i" items="${s.top5MostRatedSubjects}">
                            <div class="properties pb-20 subject_card">
                                <div class="properties__card">
                                    <div class="properties__img overlay1">
                                        <a href="#"><img src="data:image/jpeg;base64,${i.image}" alt=""></a>
                                    </div>
                                    <div class="properties__caption">
                                        <!--<p>User Experience</p>-->
                                        <h3 class="text-nowrap text-truncate"><a href="#">${i.subject_name}</a></h3>
                                        <p class="limited-height">
                                            ${i.description}          
                                        </p>
                                        <div class="properties__footer d-flex justify-content-between align-items-center">
                                            <div class="restaurant-name">
                                                <div class="rating">
                                                    <c:forEach begin="1" end="${Math.floor(i.rate_subject)}" varStatus="loop">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:if test="${i.rate_subject > Math.floor(i.rate_subject) && i.rate_subject < Math.floor(i.rate_subject) + 1}">
                                                        <i class="fa-star-half"></i>
                                                    </c:if>
                                                    <c:forEach begin="${Math.ceil(i.rate_subject) + 1}" end="5" varStatus="loop">
                                                        <span class="star-icon"><i class="fa fa-star"></i></span>
                                                        </c:forEach>
                                                </div>
                                                <p><span>(${i.rate_subject})</span> rating</p>
                                            </div>
                                            <div class="price">
                                                <span>$${i.price}</span>
                                            </div>
                                        </div>
                                        <a href="subjectdetail?category_id=${i.category_id}&subject_id=${i.subject_id}" class="border-btn border-btn2">Find out more</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Single -->
                    </div>
                </div>
            </div>
            <!-- Courses area End -->
            <!--? About Area-1 Start -->
            <section class="about-area1 fix pt-10">
                <div class="support-wrapper align-items-center">
                    <div class="left-content1">
                        <div class="about-icon">
                            <img src="courses-master/assets/img/icon/about.svg" alt="">
                        </div>
                        <!-- section tittle -->
                        <div class="section-tittle section-tittle2 mb-55">
                            <div class="front-text">
                                <h2 class="">Learn new skills online with top educators</h2>
                                <p>The automated process all your website tasks. Discover tools and 
                                    techniques to engage effectively with vulnerable children and young 
                                    people.</p>
                            </div>
                        </div>
                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Techniques to engage effectively with vulnerable children and young people.</p>
                            </div>
                        </div>
                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Join millions of people from around the world  learning together.</p>
                            </div>
                        </div>

                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Join millions of people from around the world learning together. Online learning is as easy and natural.</p>
                            </div>
                        </div>
                    </div>
                    <div class="right-content1">
                        <!-- img -->
                        <div class="right-img">
                            <img src="courses-master/assets/img/gallery/about.png" alt="">

                            <div class="video-icon" >
                                <a class="popup-video btn-icon" href="https://www.youtube.com/watch?v=wqQ0pmWp170"><i class="fas fa-play"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About Area End -->
            <!--? top subjects Area Start -->
            <div class="topic-area section-padding40">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Explore new subjects</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <jsp:useBean id="su" class="dto.SubjectDAO" scope="request"/>
                        <c:forEach var="i" items="${su.top4NewestSubject}">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="single-topic text-center mb-30">
                                    <div class="topic-img">
                                        <img src="data:image/jpeg;base64,${i.image}" style="width: 270px; height: 230px; border-radius: 5px" alt="Image">
                                        <div class="topic-content-box">
                                            <div class="topic-content">
                                                <h3><a href="subjectdetail?category_id=${i.category_id}&subject_id=${i.subject_id}">${i.subject_name}</a></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-xl-12">
                            <div class="section-tittle text-center mt-20">
                                <a href="subjectlist" class="border-btn">View More Subjects</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- top subjects End -->
            <!--? About Area-3 Start -->
            <section class="about-area3 fix">
                <div class="support-wrapper align-items-center">
                    <div class="right-content3">
                        <!-- img -->
                        <div class="right-img">
                            <img src="courses-master/assets/img/gallery/about3.png" alt="">
                        </div>
                    </div>
                    <div class="left-content3">
                        <!-- section tittle -->
                        <div class="section-tittle section-tittle2 mb-20">
                            <div class="front-text">
                                <h2 class="">Learner outcomes on courses you will take</h2>
                            </div>
                        </div>
                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Techniques to engage effectively with vulnerable children and young people.</p>
                            </div>
                        </div>
                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Join millions of people from around the world
                                    learning together.</p>
                            </div>
                        </div>
                        <div class="single-features">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/right-icon.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <p>Join millions of people from around the world learning together.
                                    Online learning is as easy and natural.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About Area End -->
            <!--? Team -->
            <section class="team-area section-padding40 fix">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Most favorite lecturers</h2>
                            </div>
                        </div>
                    </div>
                    <div class="team-active">
                        <jsp:useBean id="lec" class="dto.AccountDAO" scope="request"/>
                        <c:forEach var="i" items="${lec.top5Lecturers}">
                            <div class="single-cat text-center">
                                <div class="cat-icon">
                                    <c:if test="${i.avatar == null}">
                                        <img class="image-container" src="courses-master/assets/img/lecturer/defaultavatar.jpg" alt="">
                                    </c:if>
                                    <c:if test="${i.avatar != null}">
                                        <img class="image-container" src="data:image/jpeg;base64,${i.avatar}" alt="">
                                    </c:if>
                                </div>
                                <div class="cat-cap">
                                    <h5><a href="services.html">${i.fullname}</a></h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- Services End -->

            <!--? About Area-2 Start -->
            <section class="about-area2 fix pb-padding">
                <div class="support-wrapper align-items-center">
                    <div class="right-content2">
                        <!-- img -->
                        <div class="right-img">
                            <img src="courses-master/assets/img/gallery/about2.png" alt="">
                        </div>
                    </div>
                    <div class="left-content2">
                        <!-- section tittle -->
                        <div class="section-tittle section-tittle2 mb-20">
                            <div class="front-text">
                                <h2 class="">Take the next step
                                    toward your personal
                                    and professional goals
                                    with us.</h2>
                                <p>The automated process all your website tasks. Discover tools and techniques to engage effectively with vulnerable children and young people.</p>
                                <a href="#" class="btn">Join now for Free</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- About Area End -->
        </main>

        <footer>
            <div class="footer-wrappper footer-bg">
                <!-- Footer Start-->
                <div class="footer-area footer-padding">
                    <div class="container">
                        <div class="row justify-content-between">
                            <div class="col-xl-4 col-lg-5 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="single-footer-caption mb-30">
                                        <!-- logo -->
                                        <div class="footer-logo mb-25">
                                            <a href="home"><img src="courses-master/assets/img/logo/logo2_footer.png" alt=""></a>
                                        </div>
                                        <div class="footer-tittle">
                                            <div class="footer-pera">
                                                <p>The automated process starts as soon as your clothes go into the machine.</p>
                                            </div>
                                        </div>
                                        <!-- social -->
                                        <div class="footer-social">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                            <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Our solutions</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Support</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Company</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer-bottom area -->
                <div class="footer-bottom-area">
                    <div class="container">
                        <div class="footer-border">
                            <div class="row d-flex align-items-center">
                                <div class="col-xl-12 ">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End-->
            </div>
        </footer> 

        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- JS here -->
        <script src="courses-master/assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="https://kit.fontawesome.com/79182c8e6c.js" crossorigin="anonymous"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="courses-master/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="courses-master/assets/js/popper.min.js"></script>
        <script src="courses-master/assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="courses-master/assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="courses-master/assets/js/owl.carousel.min.js"></script>
        <script src="courses-master/assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="courses-master/assets/js/wow.min.js"></script>
        <script src="courses-master/assets/js/animated.headline.js"></script>
        <script src="courses-master/assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="courses-master/assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="courses-master/assets/js/jquery.nice-select.min.js"></script>
        <script src="courses-master/assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="courses-master/assets/js/jquery.counterup.min.js"></script>
        <script src="courses-master/assets/js/waypoints.min.js"></script>
        <script src="courses-master/assets/js/jquery.countdown.min.js"></script>
        <script src="courses-master/assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="courses-master/assets/js/contact.js"></script>
        <script src="courses-master/assets/js/jquery.form.js"></script>
        <script src="courses-master/assets/js/jquery.validate.min.js"></script>
        <script src="courses-master/assets/js/mail-script.js"></script>
        <script src="courses-master/assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="courses-master/assets/js/plugins.js"></script>
        <script src="courses-master/assets/js/main.js"></script>

    </body>
    <script>
                                                        $(".custom-carousel").owlCarousel({
                                                            autoWidth: true,
                                                            loop: true
                                                        });
                                                        $(document).ready(function () {
                                                            $(".custom-carousel .item").click(function () {
                                                                $(".custom-carousel .item").not($(this)).removeClass("active");
                                                                $(this).toggleClass("active");
                                                            });
                                                        });

    </script>
    <script>
        class Countdown {
            constructor(el) {
                this.el = el;
                this.targetDate = new Date(el.getAttribute("date-time"));
                this.createCountDownParts();
                this.countdownFunction();
                this.countdownLoopId = setInterval(this.countdownFunction.bind(this), 1000);
            }
            createCountDownParts() {
                ["days", "hours", "minutes", "seconds"].forEach(part => {
                    const partEl = document.createElement("div");
                    partEl.classList.add("part", part);
                    const textEl = document.createElement("div");
                    textEl.classList.add("text");
                    textEl.innerText = part;
                    const numberEl = document.createElement("div");
                    numberEl.classList.add("number");
                    numberEl.innerText = 0;
                    partEl.append(numberEl, textEl);
                    this.el.append(partEl);
                    this[part] = numberEl;
                })
            }

            countdownFunction() {
                const currentDate = new Date();
                if (currentDate > this.targetDate) {
                    clearInterval(this.intervalId);
                    const buttonEls = this.el.querySelectorAll(".border-btn");
                    buttonEls.forEach((buttonEl) => {
                        buttonEl.setAttribute("disabled", "disabled");
                    });
                    return;
                }

                const remaining = this.getRemaining(this.targetDate, currentDate);
                Object.entries(remaining).forEach(([part, value]) => {
                    this[part].style.setProperty("--value", value);
                    this[part].innerText = value;
                });
            }

            getRemaining(target, now) {
                let seconds = Math.floor((target - (now)) / 1000);
                let minutes = Math.floor(seconds / 60);
                let hours = Math.floor(minutes / 60);
                let days = Math.floor(hours / 24);
                hours = hours - (days * 24);
                minutes = minutes - (days * 24 * 60) - (hours * 60);
                seconds = seconds - (days * 24 * 60 * 60) - (hours * 60 * 60) - (minutes * 60);
                return {days, hours, minutes, seconds};
            }

        }

        const countdownEls = document.querySelectorAll(".countdown") || [];
        countdownEls.forEach(countdownEl => new Countdown(countdownEl));

    </script>


</script>
</html>
