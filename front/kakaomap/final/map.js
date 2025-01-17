
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new kakao.maps.LatLng(37.566667, 126.978056),
    level: 5
};

var map = new kakao.maps.Map(mapContainer, mapOption);
var customOverlay = new kakao.maps.CustomOverlay({});
let title_sido ="";
let region ="";
document.addEventListener('DOMContentLoaded', function() {
   title_sido = document.getElementById("title_sido").textContent;
  
   switch (title_sido){
    case "서울":
        region ="11";
        mapOption.center = new kakao.maps.LatLng(37.566667, 126.978056);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "대구":
        region="27";
        mapOption.center = new kakao.maps.LatLng(35.871389, 128.601389);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "광주":
        region ="29";
        mapOption.center = new kakao.maps.LatLng(35.159444, 126.8525);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "대전":
        region ="30";
        mapOption.center = new kakao.maps.LatLng(36.350833, 127.385);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "울산":
        region ="31";
        mapOption.center = new kakao.maps.LatLng(35.538333, 129.311389);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "세종":
        region ="36";
        mapOption.center = new kakao.maps.LatLng(36.480556, 127.288889);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "충북":
        region ="43";
        mapOption.center = new kakao.maps.LatLng(36.8, 127.7);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "강원":
        region ="51";
        mapOption.center = new kakao.maps.LatLng(37.8228, 128.1555);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "부산":
        region ="26";
        mapOption.center = new kakao.maps.LatLng(35.1798200522868, 129.075087492149);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "인천":
        region ="28";
        mapOption.center = new kakao.maps.LatLng(37.4562557, 126.7052062);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "경기":
        region ="41"; //37° 30′ 동경 127° 15′
        mapOption.center = new kakao.maps.LatLng(37.30, 127.15);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "충남":
        region ="44";
        mapOption.center = new kakao.maps.LatLng(36.5184, 126.8);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "전북":
        region ="45";
        mapOption.center = new kakao.maps.LatLng(35.7175, 127.153);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "전남":
        region ="46";
        mapOption.center = new kakao.maps.LatLng(34.8679, 126.991);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "경북":
        region ="47";
        mapOption.center = new kakao.maps.LatLng(36.4919, 128.8889);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "경남":
        region ="48";
        mapOption.center = new kakao.maps.LatLng(35.4606, 128.2132);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
    case "제주도":
        region ="50";
        mapOption.center = new kakao.maps.LatLng(33.4890113, 126.4983023);
        map.setCenter(mapOption.center); 
        map.setLevel(11);
        break;
}
    
});

const areas = [{
    name: title_sido,
    path: []
}];

fetch('../korea_b2.json')
.then(response => {
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
})
.then(jsonData => {
    const features = jsonData.features;
    // const region = "50";

    
   
    // 지역의 데이터 가져오기
    // 서울 11, 대구 27, 광주 29, 대전 30, 울산 31, 세종시 36, 충청북도 43, 강원도 51
    // 부산 26, 인천 28, 경기도 41, 충청남도 44, 전라북도 45, 전라남도 46, 경상북도 47, 경상남도 48, 제주도 50
    
    const sido = features.find(feature => feature.properties.CTPRVN_CD === region);
    const coordinates = sido.geometry.coordinates;



    // 좌표 구문 선태
    const validRegions = ["11", "27", "29", "30", "31", "36", "43", "51"];
    const validRegions2 = ["26", "28", "41", "44", "45", "46", "47", "48", "50"];

    if(validRegions.includes(region)){
        coordinates.forEach(polygonCoordinates => {
            const path = polygonCoordinates.map(coord => new kakao.maps.LatLng(coord[1], coord[0]));
            areas[0].path.push(path);
        });
    } else if (validRegions2.includes(region)){
        coordinates.forEach(polygonCoordinates => {
            const path = polygonCoordinates[0].map(coord => new kakao.maps.LatLng(coord[1], coord[0]));
            areas[0].path.push(path);
        });
    } else{
        console.log("없는 지역코드 입니다.")
    }
    // 지도에 다각형 표시 함수 호출
    displayArea(areas[0]);
})
.catch(error => {
    console.error('Error fetching JSON:', error);
});


// 다각형 표시 함수
function displayArea(area) {
    var polygon = new kakao.maps.Polygon({
        map: map,
        path: area.path, // 다각형 path를 1차원 배열로 평평하게 만듭니다
        strokeWeight: 2,
        strokeColor: '#FF0000',
        strokeOpacity: 1,
        fillColor: '#00FF00',
        fillOpacity: 0.5
    });

    kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});
        customOverlay.setContent('<div class="area">' + area.name + '</div>');
        customOverlay.setPosition(mouseEvent.latLng);
        customOverlay.setMap(map);
    });

    kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {
        customOverlay.setPosition(mouseEvent.latLng);
    });

    kakao.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({fillColor: '#00FF00'}); // 원래의 fillColor로 변경
        customOverlay.setMap(null);
    });
}

document.addEventListener('DOMContentLoaded', function() {
    title_sido = document.getElementsByClassName(".so2Grade").textContent;
    switch (so2Grade) {
        case 1 :
            this.styleSheets
    }
 });