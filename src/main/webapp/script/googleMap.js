/**
         * Google Map API 주소의 callback 파라미터와 동일한 이름의 함수이다.
         * Google Map API에서 콜백으로 실행시킨다.
         */

        var inputStatus = null;
        
        var myMap = null;

        
        

        function initMap() {

            // 클릭 이벤트 실행
            document.getElementById('address').addEventListener('keyup',function(key){
                if(key.keyCode == 13){
                    inputStatus = 'address';

                    /**
                     * 맵을 설정한다.
                     * 1번째 파라미터 : 구글 맵을 표시할 위치. 여기서는 #google-map
                     * 2번째 파라미터 : 맵 옵션.
                     *      ㄴ zoom : 맵 확대 정도
                     *      ㄴ center : 맵 중심 좌표 설정
                     *              ㄴ lat : 위도 (latitude)
                     *              ㄴ lng : 경도 (longitude)
                     */
                    var map = new google.maps.Map(document.getElementById('googleMap'), {
                        zoom: 12.5,
                        center: {
                            lat: -34.397,
                            lng: 150.644
                        }
                    });

                    geocodeAddress(geocoder, map);
                    
                    document.getElementById('googleMap_div').style.display='block';
                    
                }
            },{passive:true});

            document.getElementById('search_location').addEventListener('keyup',function(key){
                if(key.keyCode == 13){
                    inputStatus = 'location';

                    var map = new google.maps.Map(document.getElementById('locationMap'), {
                        zoom: 12.5,
                        center: {
                            lat: -34.397,
                            lng: 150.644
                        }
                    });

                    geocodeAddress(geocoder, map);
                    
                    document.getElementById('location_div').style.display='block';
                    document.getElementById('search_location_div').style.display='none';

                   
                }
            },{passive:true});
 

            
            
            /**
             * Google Geocoding. Google Map API에 포함되어 있다.
             */
            var geocoder = new google.maps.Geocoder();
 
            
            

            

 
            /**
             * geocodeAddress
             * 
             * 입력한 주소로 맵의 좌표를 바꾼다.
             */
            function geocodeAddress(geocoder, resultMap) {
                console.log('geocodeAddress 함수 실행');
 
                

                if(inputStatus == 'address'){
                    
                    // 주소 설정
                    var address = document.getElementById('address').value;
                    

                    /**
                     * 입력받은 주소로 좌표에 맵 마커를 찍는다.
                     * 1번째 파라미터 : 주소 등 여러가지. 
                     *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
                     * 
                     * 2번째 파라미터의 함수
                     *      ㄴ result : 결과값
                     *      ㄴ status : 상태. OK가 나오면 정상.
                     */
                    geocoder.geocode({'address': address}, function(result, status) {
                    	
                    	lat_value = result[0].geometry.location.lat();
                    	lng_value = result[0].geometry.location.lng();
                    	var latlngArr = [lat_value, lng_value];
                    	
                    	var latlng_value_input = document.createElement('input');
                    	latlng_value_input.setAttribute('type','hidden');
                    	latlng_value_input.setAttribute('name','writeForm4_latlng');
                    	latlng_value_input.setAttribute('value',latlngArr);
                    	
                    	document.getElementById('writeForm4_form').appendChild(latlng_value_input);
    
                        if (status === 'OK') {
                            // 맵의 중심 좌표를 설정한다.
                            resultMap.setCenter(result[0].geometry.location);
                            // 맵의 확대 정도를 설정한다.
                            resultMap.setZoom(18);
                            // 맵 마커
                            var marker = new google.maps.Marker({
                                map: resultMap,
                                position: result[0].geometry.location
                            });
    
                        } else {
                            alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                        }
                    });

                } else if(inputStatus == 'location'){

                
                    // 주소 설정
                    var location = document.getElementById('search_location').value;
    
                    /**
                     * 입력받은 주소로 좌표에 맵 마커를 찍는다.
                     * 1번째 파라미터 : 주소 등 여러가지. 
                     *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
                     * 
                     * 2번째 파라미터의 함수
                     *      ㄴ result : 결과값
                     *      ㄴ status : 상태. OK가 나오면 정상.
                     */
                    geocoder.geocode({'address': location}, function(result, status) {
                    	
                    	lat_value1 = result[0].geometry.location.lat();
                    	lng_value1 = result[0].geometry.location.lng();
                    	var latlngArr1 = [lat_value1, lng_value1];
                    	
                    	var latlng_value_input1 = document.createElement('input');
                    	latlng_value_input1.setAttribute('type','hidden');
                    	latlng_value_input1.setAttribute('name','writeForm2_latlng');
                    	latlng_value_input1.setAttribute('value',latlngArr1);
                    	
                    	document.getElementById('writeForm2_form').appendChild(latlng_value_input1);

                        if (status === 'OK') {
                            // 맵의 중심 좌표를 설정한다.
                            resultMap.setCenter(result[0].geometry.location);
                            // 맵의 확대 정도를 설정한다.
                            resultMap.setZoom(18);
                            // 맵 마커
                            var marker = new google.maps.Marker({
                                map: resultMap,
                                position: result[0].geometry.location
                            });
    
                        } else {
                            alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                        }
                    });

                }

                
            }
        }
        
        
        
        
        
  // db에 저장된 좌표로 구글맵 출력
        
        