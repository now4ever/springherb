<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>자료실 글 목록 - 허브몰</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mystyle.css'/>" />
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList .box2 tbody tr').hover(function(){
			$(this).css('background',"skyblue");
		}, function(){
			$(this).css('background',"");
		});
	});
	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
	
</script>

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>

<h2>자료실</h2>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord} 건 검색되었습니다.</p>
</c:if>

<!-- 페이징 처리를 위한 form -->
<form action="<c:url value='/reBoard/list.do'/>" 
	name="frmPage" method="post">
	<input type="text" name="currentPage"><br>
	<input type="text" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="text" name="searchKeyword" value="${param.searchKeyword }"><br>	
</form>

<div class="divList">
<table class="box2"
	 	summary="자료실에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>자료실</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody> 
		<c:if test="${empty list }">
			<tr>
				<td colspan="5" class="align_center">데이터가 없습니다.</td>
			</tr>
		</c:if>		
		<c:if test="${!empty list }">			 
		  	<!--게시판 내용 반복문 시작  -->		
		  	<c:forEach var="vo" items="${list }">			 
				<tr class="align_center">
					<td>${vo.no}</td>
					<td class="align_left">
						<c:if test="${vo.delFlag == 'Y'}">
							<span style="color:gray">삭제된 글입니다.</span>
						</c:if>
						<c:if test="${vo.delFlag != 'Y'}">						
							<!-- 파일이 첨부된 경우에만 파일 이미지 보여주기 -->
							<c:if test="${!empty vo.fileName }">
								<img src="<c:url value='/resources/images/file.gif'/>" 
									alt="파일 이미지">
							</c:if>
						
							<!-- 답변글인 경우 계층적으로 화살표 이미지 보여주기 -->
							<c:if test="${vo.step>0 }">
								<c:forEach var="k" begin="1" end="${vo.step }">
									&nbsp;
								</c:forEach>
								<img src="<c:url value='/resources/images/re.gif'/>">
							</c:if>
							
							<!-- 제목이 긴 경우 일부만 보여주기 -->
							<a href
						="<c:url value='/reBoard/countUpdate.do?no=${vo.no}'/>">
								<c:if test="${fn:length(vo.title)>30 }">
									${fn:substring(vo.title, 0, 30) }...
								</c:if>
								<c:if test="${fn:length(vo.title)<=30 }">
									${vo.title}
								</c:if>							
							</a>
							<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
							<c:if test="${vo.newImgTerm < 24 }">
								<img src="<c:url value='/resources/images/new.gif'/>">
							</c:if>
						</c:if>	
					</td>
					<td>${vo.name}</td>
					<td>
						<fmt:formatDate value="${vo.regdate }" 
							pattern="yyyy-MM-dd"/>
					<td>${vo.readcount}</td>		
				</tr> 
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	  </tbody>
</table>	   
</div>

<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold">${i}</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageProc(${i})">[${i}]</a>
		</c:if>
	</c:forEach>
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>

<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/reBoard/list.do"/>'>
        <select name="searchCondition">
            <option value="title" 
            	<c:if test="${param.searchCondition == 'title' }">            	
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="content"
            	<c:if test="${param.searchCondition == 'content' }">            	
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition == 'name' }">            	
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword }">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <a href='<c:url value="/reBoard/write.do" />'> 글쓰기</a>
</div>

</body>
</html>

