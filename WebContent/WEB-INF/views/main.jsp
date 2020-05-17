<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl을 통해 contextPath를 구하게 되면 jsessionid가 붙는 주소를 불러올 수도 있다. -->
<%-- <c:url var="root" value="/"/> --%>
<!-- 그렇기에 jstl을 통해서 contextPath를 구하는 것이 아니라 jsp가 기본적으로 제공하는 명령어를 통해 구하면
오류 발생이 없어진다. -->
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>GLUN | 글런</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css?after"/>
	<link rel="shortcut icon" href="image/glun_favicon.ico"/>
	<link rel="icon" href="image/glun_favicon.ico"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
	
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>	

<!-- 게시판 미리보기 부분 -->
<div class="container" style="margin-top:60px">

	<!-- Filtering -->
    <!-- <div id="filterMenu">
	     <ul class="navbar-nav">
			<li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			      	Gender
			      </a>
			      <div class="dropdown-menu">
					<a href="#" class="dropdown-item">Guys</a>
					<a href="#" class="dropdown-item">Girls</a>
					<a href="#" class="dropdown-item">Guys + Girls</a>
			      </div>
			</li>	        
	     </ul>
    </div> -->
        
	<div class="row">
        <!-- 게시판을 하나씩 꺼내오는 것 -->
		<c:forEach var="sub_list" items="${list }" varStatus="idx">
			<c:forEach var="obj" items="${sub_list }">
				<div class="col-md-3" style="margin-top:25px;">
		              <a class="card-text" href="${root }board/read?board_info_idx=${board_list[idx.index].board_info_idx}&content_idx=${obj.content_idx}&page=1">
			            <img src="${root }upload/${obj.content_file}" class="img-thumbnail" alt="...">
		              </a>
		        </div>
			</c:forEach>
		</c:forEach>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	
</body>
</html>









    