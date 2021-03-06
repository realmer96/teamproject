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
	href="<%=application.getContextPath()%>/resources/css/item_detail/item_detail_review.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/item_detail/item_detail.css">
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
					<h5 class="card-title  text-white">개인별 리뷰</h5>
				</div>
			</div>

			<!-- reviewlist -->
			<div class="mt-2">
				<c:forEach var="review" items="${reviewList}">
					<jsp:include page="/WEB-INF/views/mypage/reviewupdate.jsp">
						<jsp:param value="${review.orderCode}" name="ordercode" />
						<jsp:param value="${review.productCode}" name="productcode" />
						<jsp:param value="${review.reviewPoint}" name="reviewpoint" />
						<jsp:param value="${review.reviewContents}" name="reviewcontents" />
						<jsp:param value="${review.reviewLikes}" name="reviewlikes" />
						<jsp:param value="${review.reviewIsimage}" name="reviewisimage" />
					</jsp:include>
					<div class="p-3" style="width: 25%; display: inline-block;">
						<div class="card" style="height: 25rem;">
							<div class="card-body">
								<h5 class="card-title">${review.productCode}</h5>
								<h6 class="card-subtitle mb-2 text-muted">${review.userId}</h6>
								<div class="review_point_stars mb-1">
									<c:forEach begin="1" end="${review.reviewPoint}">
										<span class="review_point_star"
											style="background-image:url('<%=application.getContextPath()%>/resources/img/review/point_star.png');"></span>
									</c:forEach>
								</div>
								<c:if test="${review.reviewIsimage == 0}">
									<p class="card-text">${review.reviewContents}</p>
								</c:if>
								<c:if test="${review.reviewIsimage != 0}">
									<img class="rounded" src="<%=application.getContextPath()%>/item/battach?ordercode=${review.orderCode}" style="position: absolute; right: 20%;" width="60%" height="50%"/>
								</c:if>
							</div>
							<div class="card-footer bg-transparent text-end">
								<a data-toggle="modal"
									href="#reviewreadModal${review.orderCode}"
									class="btn btn-primary">리뷰수정</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>



			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
		<!-- 우측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/right_area.jsp" />
	</div>
</body>
</html>