<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>	

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
	<h1 class="boardHeader">${boardInfoName}</h1>
	<div class="row">
		<c:forEach var="obj" items="${contentList}">
			<div class="col-md-4" style="margin-top:25px;">
				<div class="card">
						<a href="${root }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}">
							<img class="card-img-top" src="${root }upload/${obj.content_file}" alt="Card image cap">
					  	</a>
					<div class="card-body">
						<a href="${root }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}">
					  		<h5 class="card-title">${obj.content_subject }</h5>
					  	</a>
					    <p class="card-text"><small class="text-muted">${obj.content_writer_name }</small></p>
					    <p class="card-text"><small class="text-muted">${obj.content_date }</small></p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="d-none d-md-block" style="margin-top:20px;">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <=0 }">
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				
					
					<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
						<c:choose>
						<c:when test="${idx == pageBean.currentPage }">
							<li class="page-item active">
								<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">${idx }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">${idx }</a>
							</li>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt }">
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
	
	<div class="text-right">
		<a href="${root }board/write?board_info_idx=${board_info_idx}" class="btn btn-outline-dark">글쓰기</a>
	</div>
			
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>


    