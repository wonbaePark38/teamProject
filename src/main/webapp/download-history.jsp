<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plug</title>
    <link href="css/download-history.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script src="script/download-history.js"></script>
    
</head>
<body>
    <div class="mainWrap">
        <header>
            파일 다운로드 이력
        </header>
        
        <div class="input-div">
            <form method="POST" action="#">
                <select id="select-type">
                    <option value="file-name">파일명</option>
                    <option value="name">이름</option>
                    <option value="id">아이디</option>
                </select>
                <input type="text" name="textfield" id="search-file-name" value="파일명">

                <strong>다운로드 일시</strong>
                <input type="text" id="first-pick" name="first-datepick">
                <input type="text" id="last-pick" name="last-datepick">
                
               <input type="submit" class="submit-bt" value="검색">
            </form>
        </div>

        <div class="download-info-div">
            <table class="download-history">
                <thead>
                    <tr>
                        <th scope="col">
                            다운로드 일시
                        </th>

                        <th scope="col">
                            파일명
                        </th>

                        <th scope="col">
                            용량
                        </th>

                        <th scope="col">
                            이름/아이디
                        </th>

                        <th scope="col">
                            기기
                        </th>
                    </tr>
                </thead>
                <!--for문 들어갈 자리-->
                <tbody>
                    <tr>
                        <td>
                            카드이름자리
                        </td>
                        <td>
                            번호자리
                        </td>
                        <td>
                            유효기간자리
                        </td>
                        <td>
                            결재구분자리
                        </td>
                        <td>
                            [보기]
                        </td>
                    </tr>
                </tbody> <!--for문 들어갈 자리-->
                 
            </table>

          

        </div>
    </div>    
    
</body>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="script/datepicker.js"></script>

</html>