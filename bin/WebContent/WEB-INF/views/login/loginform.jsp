<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Login 및 버튼을 감싸는 wrapper -->
<div id="wrapper">
	<span>LOGIN</span><br>
	
	
	<!-- Input 및 버튼을 감싸는 login -->
	<c:if test="${loginStatus == null}">
		<form method="post" action="login" id="login">
			<input type="text" id="userid" name="userid" placeholder="ID"/> 
			<input type="password" id="userpwd" name="userpwd" placeholder="PASSWORD"/>
			
			<!-- 아이디 저장 및 보안접속 표시 -->
			<div id="login_option">
				<div id="chk_remember">
					<input type="checkbox" id="rememberid" name="rememberid"/>
					<label for="rememberid" name="chk_remeber">아이디 저장</label>
				</div>
				<div id="secret_login">보안 접속</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<div id="login_btns">
				<div id="login_div">
					<button id="login_btn">로그인</button>
				</div>
			</div>
		</form>
	</c:if>
	
	<!-- 회원가입 버튼 -->
	<div id="login_div">
		<a type="button" id="signup_btn" href="signup">회원가입</a>
	</div>
	
	
	<!-- 로그인 관련 정보 조회 버튼 -->
	<div id="login_find">
		<a id="findid" href='findid'
			style="text-decoration: none; color:black; font-size: 0.8rem;"
			>아이디 찾기</a><br>
		<a id="findpwd" href='findpwd'
			style="text-decoration: none; color:black; font-size: 0.8rem;"
			>비밀번호 찾기</a><br>
		<a id="guestorder" href='guestorder'
			style="text-decoration: none; color:black; font-size: 0.8rem;"
			>비회원 주문 조회</a>
	</div>
	
	
	<!-- sns로 로그인하기 -->
	<div id="login_sns">
		<input type="image" id="login_btn_fb" name="login_btn_fb" src="" width="50px" height="50px"/>
		<input type="image" id="login_btn_ig" name="login_btn_ig" src="" width="50px" height="50px"/>
		<input type="image" id="login_btn_gg" name="login_btn_gg" src="" width="50px" height="50px"/>
		<input type="image" id="login_btn_nv" name="login_btn_nv" src="" width="50px" height="50px"/>			
	</div>
</div>