<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 정보</title>
    <link href="css/paymentInfo.css" rel="stylesheet">
</head>
<body>
    <div class="mainWrap">
        <header>
           결제 정보 
        </header>

        <div class="method-of-payment-div">
            <strong>
                플로우 요금 결제 시, 사용할 카드 정보를 변경할 수 있습니다.    
            </strong>

            <div>
                <button  type="button">결제 수단 변경</button>
            </div>
        </div>

        <div class="card-info">
            <table class="card-type">
                <thead>
                    <tr>
                        <th scope="col">
                            카드구분
                        </th>

                        <th scope="col">
                            카드번호(끝자리 4자리)
                        </th>

                        <th scope="col">
                            유효기간
                        </th>

                        <th scope="col">
                            결제구분
                        </th>
                    </tr>
                </thead>

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
                    </tr>
                </tbody>
            </table>

          

        </div>
            
        
          
    </div>
</body>
</html>