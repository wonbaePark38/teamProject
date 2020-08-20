<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>

<title>전체 파일</title>
    <!-- Bootstrap core CSS -->
    <link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'>

    <!-- Custom styles for this template -->
    <link href='css/totalFile.css' rel='stylesheet'>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
   
    <script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
 
   <script type='text/javascript' src='./script/script.js'></script>
    <script type='text/javascript' src='./script/totalFile.js'></script>
    
    <script src='https://kit.fontawesome.com/be57023a12.js' crossorigin='anonymous'></script>
    
</head>

<body>
    <div class='mainWrap'>

        <div class='headerContainer'>

            <div class='headerWrap'>
                <div class='headerLeft'>
                    <div class='headLogo'>
                        <a href='#'><img src='images/logo_top.png'></a>
                    </div>
                    <div id='searchArea'>

                       

                    <input type='text' id='inputkeyword' placeholder='키워드를 입력하세요'>
                       
                    </div>

                </div>
                <div class='headerRight'>
                    <button id='serviceUpgradeBt' onclick='test()'>서비스 업그레이드</button>
                    <input type='button' id='headerChatBt' onclick='test()'>
                    <input type='button' id='headerIconAlram'>
                    <input type='button' id='headerUserInfoBt'>
                </div>
                <!--//end headerRight-->
            </div>
            <!--headerwrap-->
        </div>
        <!--headercontainer-->


        <div class='centerAreaContainer'>
            <div class='fileIconArea'>
                <div id='btnLeft'>
                    <div id='presentPath'>현재 > </div>
                    <span id='changePathArea'> </span>
                </div>

           

                <div class='btnRight'>
                <div class='check-message-container'>
                    <span class='checkbox-number'></span>    
                </div>
                <div class='rightBtCollection'>
                    <button id='moveBt' type='button' onclick='test()' alt='이동'>
                        <i class='fas fa-arrows-alt' style='color:#615cba; font-size: 25px;'></i> 이동
                    </button>

                    <button id='downloadAllBt' type='button'  alt='다운로드' >
                        <i class='fas fa-download' style='color:#615cba; font-size: 25px;'></i> 다운로드

                    </button>
                    <button id='deleteFolderBt' type='button' onclick='test()' alt='폴더삭제' >
                        <i class='far fa-trash-alt'  style='color:#615cba; font-size: 25px;'></i> 폴더 삭제

                    </button>
                    <button id='newFolderBt' type='button' onclick='test()' alt='새폴더' >
                        <i class='fas fa-folder-plus'  style='color:#615cba; font-size: 25px;'></i> 새폴더
                    </button>

                    <button id='listSortBt' type='button'>
                        <i class='fas fa-list-alt' style='color:white; font-size: 25px;'></i>
                    </button>
                    <button id='badukSortBt' type='button' >
                        <i class='fab fa-microsoft' style='color: white; font-size: 25px;'></i>
                    </button>
                    <input type='button'  value='닫기' id='closeBt'>
                    </div>
                </div>
                <!--end btnRight-->
            </div>
            <!--end fileIconArea-->
            <div class='contentsAreaContainer'>
                <div class='leftMenuContainer'>
                    <div class='filetype'>
                        파일형태
                    </div>
                    <div class='totalBtDiv'>
                        <button type='button' class="totalTypeBt"  value='모든 포맷'>
                            <i class='fas fa-file-alt'  style='color:#615cba; font-size: 30px; margin-right: 30px;'></i>
                            모든 포맷
                        </button>
                    </div>

                    <div id='filetypeSelectContainer'>
                        <ul class='selectfiletypeDiv'>
                           
                            <button type='button' id='pdfBt'>
                                <span id='pdfBtSpan'></span>PDF
                            </button>
                            <li>
                                <button type='button' id='wordBt'>
                                    <span id='wordBtSpan'></span>워드
                                </button>
                            </li>
                            <button type='button' id='excelBt'>
                                <span id='excelBtSpan'></span>엑셀
                            </button>
                            <li>
                                <button type='button' id='hangeulBt'>
                                    <span id='hangeulBtSpan'></span>한글
                                </button>
                            </li>
                            <button type='button' id='pptBt'>
                                <span id='pptBtSpan'></span>파워포인트
                            </button>
                            <li>
                                <button type='button' id='imgBt'>
                                    <span id='imgBtSpan'></span>이미지
                                </button>
                            </li>
                            <button type='button' id='multimediaBt'>
                                <span id='multimediaBtSpan'></span>음악/동영상
                            </button>
                            <li>
                                <button type='button' id='htmlBt'>
                                    <span id='htmlBtSpan'></span>HTML
                                </button>
                            </li>
                            <button type='button' id='cadBt'>
                                <span id='cadBtSpan'></span>캐드파일
                            </button>
                            <li>
                                <button type='button' id='archiveBt' value='압축파일'>
                                    <span id='archiveBtSpan'></span>압축파일
                                </button>
                            </li>
                        </ul>

                    </div>

                    <div class='projectLb'>
                        프로젝트
                    </div>
                    
                    <div class='projectFolderDiv'>
                        <ul id='projectFolder'>
                            <li id='totalBtList'>
                                <div class='totalProjectDiv'>
                                    <span class='colorIcon1'></span>
                                    <input type='button'value='전체 프로젝트' id='totalSelectBt' class='projectNameBt'>
                                </div>
                            </li>
	                       <!-- 가입된 프로젝트 들어올 자리 -->
                        	

                            <li>
                                <div class='totalProjectDiv'>
                                    <span class='colorIcon2'></span>
                                    <input type='button' value='1:1 문의하기' class='projectNameBt'>


                                </div>
                            </li>

                            <li>
                                <div class='totalProjectDiv'>
                                    <span class='colorIcon3'></span>
                                    <input type='button' value='플로우 이용 가이드' class='projectNameBt'>


                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <section class='list-main-article-container'>
                    <div class='title-container'>
                        <div class='checkbox-all-div'>
                            <input type='checkbox' class='checkbox-all'>
                    </div>
                        
                     

					<div class='file-name-sort'>
                            <button type='button' id='namesortbt'>
                                파일명
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>   
                        </div>
				
                        <div class='file-size-sort'>
                            <button type='button' id='sizesortbt'>
                                크기
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>
                        </div>

                        <div class='file-up-person'>
                            <button type='button' id='personsortbt'>
                                등록자
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>
                        </div>

                        <div class='file-up-date'>
                            <button type='button' id='updatesortbt'>
                                최근 업로드순
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>
                        </div>
                    </div><!--end titleContainer-->
                    
                   <!-- 테이블로우 -->
                    
                  
               		
                </section><!--end listmainarticleContainer-->
                
                
                <section class='baduk-main-article-container'>
                    <div class='title-container'>
                        <div class='checkbox-all-div'>
                            <input type='checkbox' class='checkbox-all-baduk'>
                        </div>

                        <div class='file-up-date'>
                            <button type='button' id='updatesortbt-baduk'>
                                최근 업로드순
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>
                        </div>

                        <div class='file-name-sort-baduk'>
                            <button type='button' id='namesortbt-baduk'>
                                파일명
                                <img class='downimg' src='images/btn_arrdw.png' style='padding-bottom: 3px;'>
                                <img class='upimg' src='images/btn_arrup.png' style='padding-bottom: 3px;'>
                            </button>   
                        </div>

                    </div>

                    <div class='baduk-sort-div'>
						<!-- db에서 받아온 들어올 자리 -->
                	</div>    
                </section>
				<div class="modal">
				</div><!-- //modal -->
			</div>
        </div>
          
         
    <!--아이콘+테이블 centerAreaContainer-->

    </div>
    <!--main wrap-->
</body>



</html>

