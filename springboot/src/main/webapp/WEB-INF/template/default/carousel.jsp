<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}" />
<c:set var="imgUrl"
	value="${pageContext.request.contextPath}/resources/image" />
<style>
.container-fluid video {
	position: relative;
	z-index: 0;
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
}
</style>

<div id="carouselExampleSlidesOnly" class="carousel slide"
	data-bs-ride="carousel">
	<div class="carousel-inner">
		<video autoplay loop muted class="" style="width: 100%;">
			 <source src="https://www.goodoc.io/intro1.webm" type="video/mp4">
		</video>
		<div class="carousel-caption d-none d-md-block" style="padding-bottom : 30%;">
			<h1>������ ����ȭ �� ���� �ǷἭ�� <br> ���� �̸� �����ּ���</h1>
			
		</div>
	</div>

</div>
