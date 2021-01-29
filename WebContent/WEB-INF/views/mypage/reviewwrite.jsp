<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=application.getContextPath()%>/resources/img/title/heart.svg">
<title>homepage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/imageCard/imageCard.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/base_element/breadcrumb.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/base_element/footermen.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/base_element/homepage.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/productSlideshow/slideshow.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/index/index.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/index/header.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/index/left_area.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/index/right_area.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/base_element/homepage.css">
<!-- 아이콘 사용 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div class="wrap_content">
		<!-- 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/left_area.jsp" />

		<!-- 내용 -->
		<div id="header">
			<%-- 중앙 --%>
			<script type="text/javascript">
						$(function() {
							$.ajax({
								url : "<%=application.getContextPath()%>/header",
						method : "get",
						success : function(data) {
							$("#headerpart").html(data);
						}
					});
				});
			</script>
			<div id="headerpart"></div>

			<br /> <br /> <br /> <br />
			<div class="card text-white bg-dark mb-3">
				<div class="card-body text-white">
					<h5 class="card-title  text-white">상품리뷰</h5>	
				</div>
			</div>
			<!-- review write form -->
			<form enctype="multipart/form-data" name="reviewwriteform" action="reviewwrite" method="post">
				<input type="hidden" name="orderCode" value="${ordercode}"/>
				<input type="hidden" name="productCode" value="${productcode}"/>
				<div class="form-group">
					<label>상품 별점</label><br />
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="reviewPoint" id="inlineRadio1" value="1">
						<label class="form-check-label" for="inlineRadio1">1</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="reviewPoint" id="inlineRadio2" value="2">
						<label class="form-check-label" for="inlineRadio2">2</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="reviewPoint" id="inlineRadio3" value="3">
						<label class="form-check-label" for="inlineRadio3">3</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="reviewPoint" id="inlineRadio4" value="4">
						<label class="form-check-label" for="inlineRadio3">4</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="reviewPoint" id="inlineRadio5" value="5">
						<label class="form-check-label" for="inlineRadio3">5</label>
					</div>
				</div>
				
				<div class="form-group">
					<label for="reviewContents">리뷰내용</label>
					<textarea class="form-control" id="reviewContents" name="reviewContents"
						rows="5" cols="50"></textarea>
				</div>
				<button class="btn btn-primary">저장</button>
				<a href="orderlist" class="btn btn-danger">취소</a>
			</form>


			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
		<!-- 우측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/right_area.jsp" />
	</div>

</body>
</html>