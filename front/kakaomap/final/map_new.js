var mapContainer = document.getElementById('map');
var mapOption = {
    center: new kakao.maps.LatLng(37.566667, 126.978056),
    level: 5
};

var map = new kakao.maps.Map(mapContainer, mapOption);
var customOverlay = new kakao.maps.CustomOverlay({});

document.addEventListener('DOMContentLoaded', function() {
    fetch('../korea_b2.json')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(jsonData => {
        const features = jsonData.features;

        features.forEach(feature => {
            const properties = feature.properties;
            const geometry = feature.geometry;
            const region = feature.
            const validRegions = ["11", "27", "29", "30", "31", "36", "43", "51"];
            const validRegions2 = ["26", "28", "41", "44", "45", "46", "47", "48", "50"];

            if (geometry.type === 'Polygon' && validRegions.includes(region)){
                const path = geometry.coordinates[0].map(coord => new kakao.maps.LatLng(coord[1], coord[0]));

                var polygon = new kakao.maps.Polygon({
                    map: map,
                    path: path,
                    strokeWeight: 2,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1,
                    fillColor: '#00FF00',
                    fillOpacity: 0.5
                });

                kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
                    polygon.setOptions({fillColor: '#09f'});
                    customOverlay.setContent('<div class="area">' + properties.CTP_ENG_NM + '</div>');
                    customOverlay.setPosition(mouseEvent.latLng);
                    customOverlay.setMap(map);
                });

                kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {
                    customOverlay.setPosition(mouseEvent.latLng);
                });

                kakao.maps.event.addListener(polygon, 'mouseout', function () {
                    polygon.setOptions({fillColor: '#00FF00'});
                    customOverlay.setMap(null);
                });
            } else if(geometry.type === 'Polygon' && validRegions2.includes(region)){
                var polygon = new kakao.maps.Polygon({
                    map: map,
                    path: path,
                    strokeWeight: 2,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1,
                    fillColor: '#00FF00',
                    fillOpacity: 0.5
                });

                kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
                    polygon.setOptions({fillColor: '#09f'});
                    customOverlay.setContent('<div class="area">' + properties.CTP_ENG_NM + '</div>');
                    customOverlay.setPosition(mouseEvent.latLng);
                    customOverlay.setMap(map);
                });

                kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {
                    customOverlay.setPosition(mouseEvent.latLng);
                });

                kakao.maps.event.addListener(polygon, 'mouseout', function () {
                    polygon.setOptions({fillColor: '#00FF00'});
                    customOverlay.setMap(null);
                });
            }
        });
    })
    .catch(error => {
        console.error('Error fetching JSON:', error);
    });
});