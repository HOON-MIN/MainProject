<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������</title>
</head>
<body>
<h1> ���� ������ </h1>
<input type="button" value="���� ����ϱ�" onclick="location.href=''">
<input type="button" value="���� �α���" onclick="location.href=''">

	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	
function currentLocation() {
	// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ�
	if (navigator.geolocation) {

		// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // ����
			    lon = position.coords.longitude; // �浵

			var locPosition = new kakao.maps.LatLng(lat, lon); // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
			var message = '<div style="padding:5px;">����ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�

			// ��Ŀ�� ���������츦 ǥ���մϴ�
			displayMarker(locPosition, message);
		});
	} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

		var locPosition = new kakao.maps.LatLng(37.4812845080678, 126.952713197762),
			message = '���� ��ġ�� �� �� ���� �⺻ ��ġ�� �̵��մϴ�.'

		currentLatLon['lat'] = 33.450701
		currentLatLon['lon'] = 126.570667

		displayMarker(locPosition, message);
	}
	return true
}
//map.html
function displayMarker(locPosition, message) {
	var imageSize = new kakao.maps.Size(24, 35);
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	// ��Ŀ�� �����մϴ�
	var marker = new kakao.maps.Marker({
		map: map, 
		position: locPosition, 
		image : markerImage, 
	});

	var iwContent = message; // ���������쿡 ǥ���� ����
		iwRemoveable = true;

	// ���������츦 �����մϴ�
	var infowindow = new kakao.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});

	// ���������츦 ��Ŀ���� ǥ���մϴ�
	infowindow.open(map, marker);

	// ���� �߽���ǥ�� ������ġ�� �����մϴ�
	map.setCenter(locPosition);
}
var iwContent = message, // ���������쿡 ǥ���� ����
iwRemoveable = true;
//���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({
    content : iwContent,
    removable : iwRemoveable
});
//���������츦 ��Ŀ���� ǥ���մϴ�
infowindow.open(map, marker);
</script>
</body>
</html>