var mapContainer = document.getElementById('map');
var mapOption = {
    center: new kakao.maps.LatLng(35.1798200522868, 129.075087492149),
    level: 13
};

var map = new kakao.maps.Map(mapContainer, mapOption);
var customOverlay = new kakao.maps.CustomOverlay({});

const areas = [{
    name: '부산',
    path: []
}];

fetch('korea_b2.json')
.then(response => {
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
})
.then(jsonData => {
    const features = jsonData.features;
    
    // 지역의 데이터 가져오기
    // 서울 11, 대구 27, 광주 29, 대전 30, 울산 31, 세종시 36, 충청북도 43, 강원도 51
    // 부산 26, 인천 28, 경기도 41, 충청남도 44, 전라북도 45, 전라남도 46, 경상북도 47, 경상남도 48, 제주도 50
    const region = "50";
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