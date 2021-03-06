<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>www.stylenanda.com</title>
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/imageCard/imageCard.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/base_element/footermen.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/index/index.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/index/header.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/index/left_area.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/index/right_area.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/item_detail/item_detail_review.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/item_detail/item_detail.css">
	<!-- 아이콘 사용 -->
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<body>
	<div class="wrap">
		<div class="wrap_content">
			<!-- 좌측 메뉴 -->
			<jsp:include page="/WEB-INF/views/include/left_area.jsp" />

			<!-- 내용 -->
			<div class="wrapper">
				<div id="header">
					<%-- 중앙 --%>
					<jsp:include page="/WEB-INF/views/include/header.jsp" />

					<jsp:include page="/WEB-INF/views/item_detail/detail.jsp" />
						
					<!-- 제품 리스트 스크립트 -->
					<script type="text/javascript">
						$(function() {
							$.ajax({
								url : "reviewstar5=6&star5=1&star4=3&star3=2&star2=0&star1=2",
								method : "get",
								success : function(data) {
									$("#reviewpage").html(data);
								}
							});
						});
					</script>
					<div id="reviewpage"></div>

					<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</div>
			</div>

			<!-- 우측 메뉴 -->
			<jsp:include page="/WEB-INF/views/include/right_area.jsp" />
		</div>
	</div>
</body>
</html>
