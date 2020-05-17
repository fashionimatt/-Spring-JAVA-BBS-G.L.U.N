<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md navbar-custom bg-white fixed-top" id="topMenu" style="margin:0px 10px 2px 10px; border-bottom:1px solid #dddddd;">

	<!-- GLUN 로고 -->
	<a class="navbar-brand" href="${root }main">
		<img src="image/glun_logo.png" alt="" loading="lazy"/>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
	        aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>        
	</button>
	
	<!-- 메뉴 구성 -->
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<c:forEach var="obj" items="${topMenuList }">
				<li class="nav-item" style:"color:black">
					<a href="${root }board/main?board_info_idx=${obj.board_info_idx}" class="nav-link">${obj.board_info_name}</a>
				</li>
			</c:forEach>
		</ul>
		
		<!-- 회원 정보 관리 -->
		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				        <image src="image/person.png" alt="" style="width:20px; height:20px;"/>
				      </a>
				      <div class="dropdown-menu dropdown-menu-right">
						<a href="${root }user/modify" class="dropdown-item">정보수정</a>
						<a href="${root }user/logout" class="dropdown-item">로그아웃</a>
				      </div>
				    </li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a href="${root }user/login" class="nav-link">로그인</a>
					</li>
					<li class="nav-item">
						<a href="${root }user/join" class="nav-link">회원가입</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
