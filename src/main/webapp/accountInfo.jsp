<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정정보</title>
<link href='css/accountInfo.css' rel='stylesheet' />
</head>
<body>
	  <div class="wrap">
      <header>
        계정 정보
      </header> <!--end header-->
      <div class="text-area">내 프로필</div>
      
      <div class="myprofile">
        
        <div class="photo-area-container">
          <div class="photo-area">
           <img src='images/empty_photo.png'>
           
          </div>
          <a id="change-photo">
            <span class="blind">사진편집</span>
            <input class="profile-photo-upload" type="file" accept="image/*">
          </a>  
        </div> 

        <div class="info-container">
          <ul class="private-info">
            <li>
              <div>
                <label>
                  이름
                </label>
                <strong class="ft_bold" id="user-name">박원배</strong>
              </div>
  
            </li>
            
            <li>
              <div>
                <label>
                  이메일
                </label>
                <strong class="ft_bold" id="user-email">deux38@naver.com</strong>
              </div>
  
            </li>
            
            <li>
              <div>
                <label>
                  휴대폰번호
                </label>
                <strong class="ft_bold" id="user-phone-number">01093968239</strong>
              </div> 
  
            </li>
            
          

          </ul> <!--end private-info-->
    
  
  
          <ul  class="company-info">
            <li>
              <div>
                <label>
                  회사명
                </label>
                <strong class="ft_bold" id="user-name">kgitbank</strong>
              </div>
  
            </li>
            
            <li>
              <div>
                <label>
                  부서명
                </label>
                <strong class="ft_bold" id="user-email">자바취업반3조</strong>
              </div>
  
            </li>
            
            <li>
              <div>
                <label>
                  직책
                </label>
                <strong class="ft_bold" id="user-phone-number">사장이꿈</strong>
              </div> 
  
            </li>

            <li>
              <div>
                <label>
                  회사연락처
                </label>
                <strong class="ft_bold" id="user-phone-number">01093968239</strong>
              </div> 
  
            </li>
          </ul> <!--end company-info-->
  
  
        </div> <!--info-container-->
      </div><!--end myprofile-->
      
      
      
      
      


  </div>
</body>
</html>