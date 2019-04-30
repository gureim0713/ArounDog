<%@page import="com.aroundog.model.domain.Notice"%>
<%@page import="com.aroundog.model.domain.FreeComment"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Notice> noticeList=(List)request.getAttribute("noticeList");
	Pager pager=(Pager)request.getAttribute("pager");	
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/user/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Animal Shelter</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--
	CSS
	============================================= -->
	<link rel="stylesheet" href="/user/css/linearicons.css">
	<link rel="stylesheet" href="/user/css/font-awesome.min.css">
	<link rel="stylesheet" href="/user/css/bootstrap.css">
	<link rel="stylesheet" href="/user/css/magnific-popup.css">
	<link rel="stylesheet" href="/user/css/nice-select.css">							
	<link rel="stylesheet" href="/user/css/animate.min.css">
	<link rel="stylesheet" href="/user/css/owl.carousel.css">
	<link rel="stylesheet" href="/user/css/freeboard.css">
	
<style>
#lockIcon{
	margin-left:6px;
}
#category-name{
	display:inline;
	color:#d94013;
}
.table-head{
	padding:25px 0px;
}

.banner-area-min {
  background: url(/user/img/aroundog/banner3.jpg) center;
  background-size: cover;
}

.banner-area-min .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-area-min .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/user/inc/header.jsp" %>
	  
	<!-- start banner Area -->
	<section class="banner-area-min relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Notice Board	
					</h1>	
					<p class="text-white link-nav">공지사항 게시판 입니다.</p>
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->	

	

	<!-- Start Align Area -->
	<!-- 제일 상단 이미지 -->
	<div class="whole-wrap">
		<div class="container">
		
			<!-- 실제 테이블 -->
			<div class="section-top-border">

				
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="notice_id">#</div>
							<div class="title-notice">제목</div>
							<div class="regdate-notice">등록일</div>
							<div class="hit-notice">조회수</div>
						</div>
						<%int cnt=0; %>
						<%int num=pager.getNum(); %>
						<%int curPos=pager.getCurPos(); %>
						<%for(int i=0;i<pager.getPageSize();i++){ %>
						<%if(num<1)break; %>
						<%Notice notice=noticeList.get(curPos++); %>
						<div class="table-row">
							<div class="notice_id"><%=num-- %></div>
							<div class="title-notice" ><div id="category-name">[공지사항] </div>  <a href="/user/notice/detail/<%=notice.getNotice_id() %>" id="aTag"> <%=notice.getTitle() %></a>												
							</div>					
							<div class="regdate-notice"><%=notice.getRegdate() %></div>
							<div class="hit-notice"><%=notice.getHit() %></div>
						</div>
						<%} %>
						
						<!-- 글 등록 버튼 -->
						<div class="table-row">
						</div>
						<!-- 페이져 -->
						<nav class="blog-pagination justify-content-center d-flex">
	                        <ul class="pagination">
	                            <li class="page-item">
	                            	<%if(pager.getFirstPage()-1>0){ %>
		                                <a href="/user/notices?currentPage=<%=pager.getFirstPage()-1%>" class="page-link" aria-label="Previous">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
		                                </a>
	                                <%}else{ %>
		                                <a href="javascript:alert('첫 페이지입니다')" class="page-link" aria-label="Previous">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
		                                </a>
	                                <%} %>
	                            </li>
	                            
	                            <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
								<%if(i>pager.getTotalPage())break; %>
	                            <li class="page-item"><a href="/user/notices?currentPage=<%=i %>" class="page-link"><%=i %></a></li>	                            
	                            <%} %>
	                            
	                            <li class="page-item">
	                            	<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
		                                <a href="/user/notices?currentPage=<%=pager.getLastPage()+1%>" class="page-link" aria-label="Next">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-right"></span>
		                                    </span>
		                                </a>
	                                <%}else{ %>
		                                <a href="javascript:alert('마지막 페이지입니다')" class="page-link" aria-label="Next">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-right"></span>
		                                    </span>
		                                </a>
	                                <%} %>
	                            </li>
	                        </ul>
	                    </nav>
						
									
						
					</div>			
				</div>			
			</div>
		
		
			<div class="section-top-border">
				<div class="row gallery-item">
					<div class="col-md-4">
						<a href="/user/img/elements/0.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/0.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/user/img/elements/1.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/1.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/user/img/elements/2.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/2.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/user/img/elements/3.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/3.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/user/img/elements/4.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/4.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/user/img/elements/g6.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/g6.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/user/img/elements/g7.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/g7.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/user/img/elements/g8.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/user/img/elements/g8.jpg);"></div></a>
					</div>
				</div>
			</div>
			
		
		
			
			
			
			
			
			
		</div>
	</div>
	<!-- End Align Area -->

<!-- 여기가 제일 밑에 검은 about나오는 곳 -->
	<!-- start footer Area -->		
	<footer class="footer-area">
		<div class="container">
			<div class="row pt-120 pb-80">
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Few would argue that, despite the advanc ements off eminism over the past three decades, women still face a double standard when it comes to their behavior. While menâs borderline-inappropriate behavior. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>Useful Links</h6>
						<div class="row">
							<ul class="col footer-nav">
								<li><a href="#">Home</a></li>
								<li><a href="#">Service</a></li>
								<li><a href="#">About</a></li>
								<li><a href="#">Case Study</a></li>
							</ul>
							<ul class="col footer-nav">
								<li><a href="#">Pricing</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Blog</a></li>
							</ul>									
						</div>
					</div>
				</div>						
				<div class="col-lg-4  col-md-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Contact Us</h6>
						<ul class="list-contact">
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-home"></span>
								</div>
								<div class="detail">
									<h4>Binghamton, New York</h4>
									<p>
										4343 Hinkle Deegan Lake Road
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-phone-handset"></span>
								</div>
								<div class="detail">
									<h4>00 (953) 9865 562</h4>
									<p>
										Mon to Fri 9am to 6 pm
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-envelope"></span>
								</div>
								<div class="detail">
									<h4>support@colorlib.com</h4>
									<p>
										Send us your query anytime!
									</p>
								</div>	
							</li>																		
						</ul>
					</div>
				</div>						
			</div>
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					<div class="col-lg-4 col-sm-6 footer-social">
						<a href="#"><i class="fa fa-facebook"></i></a>
						<a href="#"><i class="fa fa-twitter"></i></a>
						<a href="#"><i class="fa fa-dribbble"></i></a>
						<a href="#"><i class="fa fa-behance"></i></a>
					</div>
				</div>						
			</div>
		</div>
	</footer>
	<!-- End footer Area -->	

	<script src="/user/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="/user/js/vendor/bootstrap.min.js"></script>			
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
 			<script src="/user/js/easing.min.js"></script>			
		<script src="/user/js/hoverIntent.js"></script>
		<script src="/user/js/superfish.min.js"></script>	
		<script src="/user/js/jquery.ajaxchimp.min.js"></script>
		<script src="/user/js/jquery.magnific-popup.min.js"></script>	
		<script src="/user/js/owl.carousel.min.js"></script>						
		<script src="/user/js/jquery.nice-select.min.js"></script>							
		<script src="/user/js/mail-script.js"></script>	
		<script src="/user/js/main.js"></script>	
	</body>
</html>