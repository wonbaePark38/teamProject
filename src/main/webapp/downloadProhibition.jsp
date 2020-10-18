<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plug</title>
    <link href="css/download-prohibition.css" rel="stylesheet">
     <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="script/download-prohibition.js"></script>
</head>
<body>
<jsp:include page="privateConfigHeader.jsp" flush="true" />
 	<script>
    	$('.headerWrap').css('width','100%');
		$('.headerWrap').css('border','0');
		$('#inputkeyword').css('display','none');
    </script>
    <div class="mainWrap">
    	<jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
    	<div id="main-contents" style="margin-left:50px">
        	<div class="header">
           		 파일 다운로드 제한
       		 </div>

        	<div class="contents">
            	<div class="setting">
                	<strong class="bold-text">
                   		 파일 다운로드를 제한하여 회사 정보 유출을 방지합니다.
               		</strong>
                	<div>
                   		 파일 다운로드 제한 설정 시, 다운로드가 제한되며,
                    	문서 뷰어를 통한 조회만 가능하도록 설정됩니다.    
                	</div>

                	<div class="setting-bt">
                    	<label class="setting-text">파일 다운로드 제한 </label> &nbsp;&nbsp;&nbsp;
                    	<label class="download-prohibition-switch">
                            <input type="checkbox" id="prohibition-switch">
                            <span class="slider round"></span>
                    	</label>
                   
                	</div>
                	 	<div id="hidden-status">
							변경되었습니다
					</div>
                
            	</div>
            	<div class="img-div">
                	<img src="images/img_nodownload.gif">
            	</div>
            		
        	</div>

        	<div class="text-area">
            	게시물 및 채팅 메시지에 등록된 파일 및 이미지의 다운로드가 제한됩니다.
            	<br><br>
           		 파일 업로드만 가능하며, 다운로드 기능이 일체 차단됩니다.
        	</div>
        	
        	
    	</div>
    </div>        
</body>

</html>