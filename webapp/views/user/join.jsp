<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>



<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>

<script>
$(function(){
	$("#join-form").submit(function(){
		if($("#agree-prov").is(":checked")==false){
			alert("약관에 동의 해야 합니다.")
			return false;
		}
		
		return true;
	});
	
	$("#blog-id").change(function(){
		$("#btn").show();
		$("#img-checkemail").hide();
	});
	
	
	$("#btn").click(function(){
		
		var id = $("#blog-id").val();
		
		if(id==""){
			return;
		}
		
		//console.log(email);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/checkid",//?email="+email,//요청 URL
			type:"get",						//통신 방식 get/post
			dataType:"json",				//수신 데이터 타입
			data:"id="+id,						//post방식인 경우 
											//서버에 전달할 파라미더 데이터
											//ex)a=checkemail&email=kickscar@gmail.com		
			contentType:"application/json",	//보내는 데이터가 JSON형식인 경우 
											//반드시 post 방식인 경우
											//data:"{"name":"안대혁","email":"kickscar@gmail.com"}"	
			
			success:function(response){		//성공시 callback
				if(response.result != "success"){
					return;
				}
			
				if(response.data == false){
					alert("이미 존재하는 아이디 입니다.");
					$("#blog-id").val("").focus();
					return;	
				}
				
				//사용가능 한 이메일
				$("#btn").hide();
				$("#img-checkemail").show();
				
				
			},
			error:function(jqXHR, status, error){	//실패시 callback
				console.error(status+":"+error);
			}
		});
		
	});
});

</script>

</head>
<body>
	<div class="center-content">
		<h1 class="logo" onclick="location.href='${pageContext.request.contextPath}/'">JBlog</h1>
		<c:import url="/views/include/user_header.jsp" />
		<form class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath}/user/join ">
			<label class="block-label" for="name">이름</label>
			<input id="name"name="name" type="text" value="">
			<br>
			<spring:hasBindErrors name="userVo">
				<c:if test="${errors.hasFieldErrors('name') }">
					<strong style="color:red">
					<c:set var="errorName" value="${errors.getFieldError('name').codes[0] }"/>
					<spring:message code="${errorName }" text="${errors.getFieldError( 'name' ).defaultMessage }"/>	
					</strong>
				</c:if>
			</spring:hasBindErrors>
			
			<label class="block-label" for="blog-id">아이디</label>
			<input id="blog-id" name="id" type="text"> 
			
			
			<input id="btn" type="button" value="id 중복체크">
			<img id="img-checkemail" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">

			<br>
			<spring:hasBindErrors name="userVo">
				<c:if test="${errors.hasFieldErrors('id') }">
					<strong style="color:red">
					<c:set var="errorId" value="${errors.getFieldError('id').codes[0] }"/>
					<spring:message code="${errorId }" text="${errors.getFieldError( 'id' ).defaultMessage }"/>					
					</strong>
				</c:if>
			</spring:hasBindErrors>
			
			<label class="block-label" for="password">패스워드</label>
			<input id="password" name="password" type="password" />
			<br>
			<spring:hasBindErrors name="userVo">
				<c:if test="${errors.hasFieldErrors('password') }">
					<strong style="color:red">
					<c:set var="errorPassword" value="${errors.getFieldError('password').codes[0] }"/>
					<spring:message code="${errorPassword }" text="${errors.getFieldError( 'password' ).defaultMessage }"/>			
					</strong>
				</c:if>
			</spring:hasBindErrors>

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">

		</form>
	</div>
</body>
</html>
