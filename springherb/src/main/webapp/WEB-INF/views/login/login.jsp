<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
	.error{
		color: red;
		display: none;
	}
</style>
<Script type="text/javascript">
	$(function(){
		$('#lg_submit').click(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					$(this).next().show();
					event.preventDefault();
					$(item).focus();
				}else{
					$(this).next().hide();					
				}
			});
		});
	});
</Script>
<article class="simpleForm">
	<form name="frmLogin" method="post"	action="<c:url value='/login/login'/>">
		<fieldset>
			<legend>로그인</legend>
			<div>
				<label for="userid" class="label">아이디</label>
				<input type="text" name="userid" id="userid" class="infobox"
					value="${cookie.ck_userid.value }">
				<span class="error">아이디를 입력하세요</span>
			</div>
			<div>
				<label for="pwd" class="label">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="infobox">
				<span class="error">비밀번호를 입력하세요</span>
			</div>
			<div class="align_center">
				<input type="submit" id="lg_submit" value="로그인">
				<input type="checkbox" name="chkSave" id="chkSave"
					<c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>
				>
				<label for="chkSave">아이디 저장하기</label>
			</div>
		</fieldset>
	</form>
</article>
			

<%@ include file="../inc/bottom.jsp" %>
