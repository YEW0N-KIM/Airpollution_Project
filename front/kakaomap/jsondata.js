// JSON 파일을 로드하기 위해 fetch 사용

const fs = require('fs');
const { feature } = require('topojson');

// JSON 파일 읽기
fs.readFile('korea.json', 'utf-8', (err, data) => {
    if (err) {
        console.error('Error reading file:', err);
        return;
    }
    const jsonData = JSON.parse(data);
    const features = jsonData.features;

    const sido = features.find(feature => feature.properties.CTP_ENG_NM == "Busan");
    const coordinates = sido.geometry.coordinates;
    console.log(coordinates);

    coordinates.forEach(innerArray => {
        innerArray.forEach(coord => {
            coord.forEach(value => {
                console.log(`X: ${value[0]}, Y: ${value[1]}`, ':',count);
            })
        });
    });
    

    // for (let i = 0; i < coordinates.length; i++) { // 첫 번째 차원: 지역
    //     for (let j = 0; j < coordinates[i].length; j++) { // 두 번째 차원: 폴리곤
    //       for (let k = 0; k < coordinates[i][j].length; k++) { // 세 번째 차원: 좌표 점
    //         const point = coordinates[i][j][k]; // [X, Y] 배열
    //         console.log(`지역 ${i + 1}, 폴리곤 ${j + 1}, 좌표 점 ${k + 1} - X: ${point[0]}, Y: ${point[1]}`);
    //       }
    //     }
    //   }
    
});

