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
//     features.forEach(sido => {
//         console.log(sido);
//    });

    const sido = features.find(feature => feature.properties.CTP_ENG_NM == "Busan");
    const coordinates = sido.geometry.coordinates;
    console.log(coordinates);
});

