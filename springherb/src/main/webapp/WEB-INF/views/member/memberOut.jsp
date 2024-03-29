<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#submit').click(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else{
				if(!confirm('회원탈퇴하시겠습니까?')){
					event.preventDefault();
				}
			}
			
		});
	});
</script>	

<article class="simpleForm">
	<form name="frmOut" method="post" action="<c:url value='/member/memberOut'/>" >
		<fieldset>	<legend>회원 탈퇴</legend>
			<p class="p">회원탈퇴하시겠습니까?</p>
			<div> 	<label for="pwd"  class="p">비밀번호</label>
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="align_center">
				<input type="submit" id="submit" value="회원탈퇴">
				<input type="reset" value="취소">
			</div>
		</fieldset>	
	</form>
</article>

<%@include file="../inc/bottom.jsp" %>
