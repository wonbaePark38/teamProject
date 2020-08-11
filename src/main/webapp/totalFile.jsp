<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 파일</title>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/totalFile.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="./script/totalFile.js"></script>
    <script type="text/javascript" src="./script/script.js"></script>
    <script src="https://kit.fontawesome.com/be57023a12.js" crossorigin="anonymous"></script>
    
</head>

<body>
    <div class="mainWrap">

        <div class="headerContainer">

            <div class="headerWrap">
                <div class="headerLeft">
                    <div class="headLogo">
                        <a href="#"><img src="images/logo_top.png"></a>
                    </div>
                    <div id="searchArea">

                        <form style="width:100%" action="#" name=search method="POST">

                            <input type="text" id="inputkeyword" value="텍스트입력" onfocus="this.value='';">
                            <input type="submit" value="검색" onclick="searchPress()">
                        </form>
                    </div>

                </div>
                <div class="headerRight">
                    <button id="serviceUpgradeBt" onclick="test()">서비스 업그레이드</button>
                    <input type="button" id="headerChatBt" onclick="test()">
                    <input type="button" id="headerIconAlram">
                    <input type="button" id="headerUserInfoBt">
                </div>
                <!--//end headerRight-->
            </div>
            <!--headerwrap-->
        </div>
        <!--headercontainer-->
+

        <div class="centerAreaContainer">
            <div class="fileIconArea">
                <div id="btnLeft">
                    <div id="presentPath">현재 > </div>
                    <span id="changePathArea"> </span>
                </div>

           

                <div class="btnRight">
                <div class="check-message-container">
                    <span class="checkbox-number"></span>    
                </div>
                <div class="rightBtCollection">
                    <button id="moveBt" type="button" onclick="test()" alt="이동">
                        <i class="fas fa-arrows-alt" style="color:#615cba; font-size: 25px;"></i> 이동
                    </button>

                    <button id="downloadBt" type="button" onclick="test()" alt="다운로드" >
                        <i class="fas fa-download" style="color:#615cba; font-size: 25px;"></i> 다운로드

                    </button>
                    <button id="deleteFolderBt" type="button" onclick="test()" alt="폴더삭제" >
                        <i class="far fa-trash-alt"  style="color:#615cba; font-size: 25px;"></i> 폴더 삭제

                    </button>
                    <button id="newFolderBt" type="button" onclick="test()" alt="새폴더" >
                        <i class="fas fa-folder-plus"  style="color:#615cba; font-size: 25px;"></i> 새폴더
                    </button>

                    <button id="listSortBt" type="button">
                        <i class="fas fa-list-alt" style="color:white; font-size: 25px;"></i>
                    </button>
                    <button id="badukSortBt" type="button" >
                        <i class="fab fa-microsoft" style="color: white; font-size: 25px;"></i>
                    </button>
                    <input type="button" onclick="" value="닫기" id="closeBt">
                    </div>
                </div>
                <!--end btnRight-->
            </div>
            <!--end fileIconArea-->
            <div class="contentsAreaContainer">
                <div class="leftMenuContainer">
                    <div class="filetype">
                        파일형태
                    </div>
                    <div class="totalBtDiv">
                        <button type="button" onclick="foldfiletype()" value="모든 포맷">
                            <i class="fas fa-file-alt"  style="color:#615cba; font-size: 30px; margin-right: 3px;"></i>
                            모든 포맷
                        </button>
                    </div>

                    <div id="filetypeSelectContainer">
                        <ul class="selectfiletypeDiv">
                            <li>
                                <button type="button" id="cloudBt">
                                    <span id="cloudBtSpan"></span>클라우드
                                </button>
                            </li>
                            <button type="button" id="pdfBt">
                                <span id="pdfBtSpan"></span>PDF
                            </button>
                            <li>
                                <button type="button" id="wordBt">
                                    <span id="wordBtSpan"></span>워드
                                </button>
                            </li>
                            <button type="button" id="excelBt">
                                <span id="excelBtSpan"></span>엑셀
                            </button>
                            <li>
                                <button type="button" id="hangeulBt">
                                    <span id="hangeulBtSpan"></span>한글
                                </button>
                            </li>
                            <button type="button" id="pptBt">
                                <span id="pptBtSpan"></span>파워포인트
                            </button>
                            <li>
                                <button type="button" id="imgBt">
                                    <span id="imgBtSpan"></span>이미지
                                </button>
                            </li>
                            <button type="button" id="multimediaBt">
                                <span id="multimediaBtSpan"></span>음악/동영상
                            </button>
                            <li>
                                <button type="button" id="htmlBt">
                                    <span id="htmlBtSpan"></span>HTML
                                </button>
                            </li>
                            <button type="button" id="cadBt">
                                <span id="cadBtSpan"></span>캐드파일
                            </button>
                            <li>
                                <button type="button" id="archiveBt" value="압축파일">
                                    <span id="archiveBtSpan"></span>압축파일
                                </button>
                            </li>
                        </ul>

                    </div>

                    <div class="projectLb">
                        프로젝트
                    </div>
                    <div class="searchProject">
                        <input type="text" id="searchForm" placeholder="프로젝트 검색">
                    </div>
                    <div class="projectFolderDiv">
                        <ul id="projectFolder">
                            <li>
                                <div class="totalProjectDiv">
                                    <span id="colorIcon1"></span>
                                    <input type="button"value="전체 프로젝트" id="totalSelectBt" class="projectNameBt">
                                </div>
                            </li>

							<c:forEach var="item" items="${projectList}">
								<li>
									<div class="totalProjectDiv">
										<span id="colorIcon2"></span>
										<input type="button" value="${item.projectId}" id="oneToOneButton" class="projectNameBt">
									</div>
								</li>
							</c:forEach>
	                            <!--
	
	                           가입된 프로젝트 리스트 형태로 들어올 자리
	                           <c:forEach var="item" items="${list}">
    이름 : ${item.name}
    나이 : ${item.age}
    주소 : ${item.addr}
</c:forEach>

	                        -->
                        <li>
                            <div class="totalProjectDiv">
                                <span id="colorIcon2"></span>
                                <input type="button" value="테스트프로젝트" id="oneToOneButton" class="projectNameBt">


                            </div>
                        </li>

                            <li>
                                <div class="totalProjectDiv">
                                    <span id="colorIcon2"></span>
                                    <input type="button" value="1:1 문의하기" id="oneToOneButton" class="projectNameBt">


                                </div>
                            </li>

                            <li>
                                <div class="totalProjectDiv">
                                    <span id="colorIcon3"></span>
                                    <input type="button" value="플로우 이용 가이드" id="useGuideButton" class="projectNameBt">


                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <section class="list-main-article-container">
                    <div class="title-container">
                        <div class="checkbox-all-div">
                            <input type="checkbox" class="checkbox-all">
                        </div>

                        <div class="file-name-sort">
                            <button type="button" id="namesortbt">
                                파일명
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>   
                        </div>

                        <div class="file-size-sort">
                            <button type="button" id="sizesortbt">
                                크기
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>
                        </div>

                        <div class="file-up-person">
                            <button type="button" id="personsortbt">
                                등록자
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>
                        </div>

                        <div class="file-up-date">
                            <button type="button" id="updatesortbt">
                                최근 업로드순
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>
                        </div>
                    </div><!--end titleContainer-->
                    
                    <div class="tableRow"><!--for문 반복구간 시작-->
                        <div class="cell col1">
                            <input type="checkbox" name="box" class="col1-checkbox">
                        </div>
                        <div class="cell col2">드래그로 순서 바꾸는 리스트</div>
                        <div class="cell col3">32 b</div>
                        <div class="cell col4">홍길동</div>
                        <div class="cell col5">2020-07-21</div>
                        <div class="cell col6">
                            
                            <button class="moreBt">
                                <img src="images/more_color_select_on.png">
                            </button>
                        </div><!--end cell col6-->
                        
                        <div class="moreMenuContainer" style="display: none;">
                            <div class="hiddenMenu">
                                <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                    <span class="moreMenuDownloadSpan"></span> 다운로드
                                </button>
                                
                                <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                    <span class="moreMenuOpenSpan"></span>열기
                                </button>
                                <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                    <span class="moreMenuDetailViewSpan"></span>상세보기
                                </button>
                              
                            </div>
                        </div>    

                       
                    </div><!--end tableRow for문 반복구간 끝-->
                    
                    <!--for문 반복구간 시작-->
                    <div class="tableRow"><!--for문 반복구간 시작-->
                        <div class="cell col1">
                            <input type="checkbox" name="box" class="col1-checkbox">
                        </div>
                        <div class="cell col2">드래그로 순서 바꾸는 리스트</div>
                        <div class="cell col3">32 b</div>
                        <div class="cell col4">홍길동</div>
                        <div class="cell col5">2020-07-21</div>
                        <div class="cell col6">
                            
                            <button class="moreBt">
                                <img src="images/more_color_select_on.png">
                            </button>
                        </div><!--end cell col6-->
                        
                        <div class="moreMenuContainer">
                            <div class="hiddenMenu">
                                <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                    <span class="moreMenuDownloadSpan"></span> 다운로드
                                </button>
                                
                                <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                    <span class="moreMenuOpenSpan"></span>열기
                                </button>
                                <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                    <span class="moreMenuDetailViewSpan"></span>상세보기
                                </button>
                              
                            </div>
                        </div>    

                       
                    </div><!--end tableRow for문 반복구간 끝-->

                    <div class="tableRow"><!--for문 반복구간 시작-->
                        <div class="cell col1">
                            <input type="checkbox" name="box" class="col1-checkbox">
                        </div>
                        <div class="cell col2">드래그로 순서 바꾸는 리스트</div>
                        <div class="cell col3">32 b</div>
                        <div class="cell col4">홍길동</div>
                        <div class="cell col5">2020-07-21</div>
                        <div class="cell col6">
                            
                            <button class="moreBt">
                                <img src="images/more_color_select_on.png">
                            </button>
                        </div><!--end cell col6-->
                        
                        <div class="moreMenuContainer">
                            <div class="hiddenMenu">
                                <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                    <span class="moreMenuDownloadSpan"></span> 다운로드
                                </button>
                                
                                <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                    <span class="moreMenuOpenSpan"></span>열기
                                </button>
                                <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                    <span class="moreMenuDetailViewSpan"></span>상세보기
                                </button>
                              
                            </div>
                        </div>    

                       
                    </div><!--end tableRow for문 반복구간 끝-->
                </section><!--end listmainarticleContainer-->
                
                
                <section class="baduk-main-article-container">
                    <div class="title-container">
                        <div class="checkbox-all-div">
                            <input type="checkbox" class="checkbox-all-baduk">
                        </div>

                        <div class="file-up-date">
                            <button type="button" id="updatesortbt-baduk">
                                최근 업로드순
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>
                        </div>

                        <div class="file-name-sort-baduk">
                            <button type="button" id="namesortbt-baduk">
                                파일명
                                <img class="downimg" src="images/btn_arrdw.png" style="padding-bottom: 3px;">
                                <img class="upimg" src="images/btn_arrup.png" style="padding-bottom: 3px;">
                            </button>   
                        </div>

                    </div>

                    <div class="baduk-sort-div">
                        <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>

                        <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div><!--for문 들어갈 자라-->
                        

                        <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                        
                        
                             <div class=item-info><!--for문 들어갈 자라-->
                            <div class="check-box-baduk">
                                <input type="checkbox" class="checkbox-baduk" style="margin-left: 5px;">
                                    <button class="moreBt">
                                    <img src="images/more_color_select_on.png">
                                </button>
                               
                            </div>
                            <div class="moreMenuContainer">
                                <div class="hiddenMenu">
                                    <button class="moreMenuDownloadBt" type="button" onclick="test()" alt="다운로드">
                                        <span class="moreMenuDownloadSpan"></span> 다운로드
                                    </button>
                                    
                                    <button class="moreMenuOpenBt" type="button" onclick="test()" alt="열기">
                                        <span class="moreMenuOpenSpan"></span>열기
                                    </button>
                                    <button class="moreMenuDetailViewBt" type="button" onclick="test()" alt="상세보기">
                                        <span class="moreMenuDetailViewSpan"></span>상세보기
                                    </button>
                                  
                                </div>
                            </div>
                            
                            <div class="item-bt">
                                <img src="images/filemoa_ico02.png">
                            </div>
                            <div class="file-name">
                                파일이름 들어갈 자리
                            </div>
      
                            
                           
                        </div>
                        <!--for문 들어갈 자라 end item-info-->
                    </div>    
                </section>
               
            </div>
        </div>
          
           
    <!--아이콘+테이블 centerAreaContainer-->

    </div>
    <!--main wrap-->
</body>



</html>

<%--
     <div class="tableContainer">
                    <div class="sorttype">
                        <div class="checkSort">
                            
                               
                            
                            <input type="checkbox" id="checkbox">
                            <a href="javascript:void(0)"; onclick="callfunction(); return false;">최근 업로드순</a>&nbsp;&nbsp;
                            <a href="javascript:void(0)"; onclick="callfunction(); return false;">파일명 순</a>&nbsp;&nbsp;
                        </div>
                       
                    </div>
                </div>
 --%>