<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자료실 상세보기 - 허브몰</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mystyle.css'/>" />
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.name}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.regdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.readcount}</span>
		</div>
		<div>
			<span class="sp1">첨부파일</span> 
			<c:if test="${!empty vo.fileName }">
				<a href="<c:url value='/reBoard/download.do?no=${vo.no }&fileName=${vo.fileName }&originalFileName=${vo.originalFileName }'/>">
					<span>${fileInfo }</span>
				</a>
				<span>
					다운 : ${vo.downCount}	
				</span>
			</c:if>
		</div>
		
		<div class="lastDiv">			
			<% pageContext.setAttribute("newLine", "\r\n"); %>			
			<p class="content">${fn:replace(vo.content, newLine, "<br>")}
			</p>
		</div>
		<div class="center">
			<a href="<c:url value='/reBoard/edit.do?no=${param.no}'/>">
				수정</a> |
        	<a href="<c:url value='/reBoard/delete.do?no=${param.no}&groupNo=${vo.groupNo}&step=${vo.step}&fileName=${vo.fileName }'/>">
        		삭제</a> |
        	<a href="<c:url value='/reBoard/reply.do?no=${param.no}'/>">
        		답변</a> |        		
        	<a href="<c:url value='/reBoard/list.do'/>">목록</a>			
		</div>
	</div>

	
</body>
</html>