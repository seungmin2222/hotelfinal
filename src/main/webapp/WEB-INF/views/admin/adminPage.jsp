<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-sclale=1">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>


<body>
     <jsp:include page="../inc/admin_element.jsp"></jsp:include>
    
    <div class="main-content">
        <main>
			<!-- 상단 박스 -->
    		<jsp:include page="../inc/admin_topBox.jsp"></jsp:include>
    		<!-- 상단 박스종료 -->
    		
            <div class="recent-grid">
                <div class="project">
                    <div class="card">
                        <div class="card-header">
                            <h3>월 매출 현황</h3>

<!--                             <button>See all <span><i class="fas fa-arrow-right"></i></span></button> -->
                        </div>
                        <div class="card-body">
                            <table width="100%">
                            
                            
                            
                            
                            
                            
                            
  <div style="width: 1200px; height: 800px; " class="chart">
   <!--차트가 그려질 부분-->
   <canvas id="myChart"></canvas>
</div>
<script type="text/javascript">
var a1 = [];
var sum1=0, sum2=0, sum3=0, sum4=0, sum5=0, sum6=0, sum7=0, sum8=0, sum9=0, sum10=0, sum11=0, sum12=0;
$.ajax({
    url: '${pageContext.request.contextPath}/admin/adminPageControl',
    dataType:'json',
    async: false, 
    success:function(rdata){
         $.each(rdata,function(index, item){
            
            if((item.book_checkin).substring(5,7) ==='01'){
               sum1 = sum1 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='02'){
               sum2 = sum2 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='03'){
               sum3 = sum3 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='04'){
               sum4 = sum4 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='05'){
               sum5 = sum5 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='06'){
               sum6 = sum6 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='07'){
               sum7 = sum7 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='08'){
               sum8 = sum8 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='09'){
               sum9 = sum9 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='10'){
               sum10 = sum10 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='11'){
               sum11 = sum11 + parseInt(item.book_totalPrice);
            }
            if((item.book_checkin).substring(5,7) ==='12'){
               sum12 = sum12 + parseInt(item.book_totalPrice);
            }
               });
                  
           }
       });
a1.push(sum1), a1.push(sum2), a1.push(sum3), a1.push(sum4), a1.push(sum5), a1.push(sum6), a1.push(sum7), a1.push(sum8), a1.push(sum9), a1.push(sum10), a1.push(sum11), a1.push(sum12);

console.log(a1);

            var context = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    
                   //x 축
                    labels: [ '1','2','3','4','5','6','7','8','9','10','11','12'],
                    datasets: [
                       //데이터
                        { 
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
//                             x축 label에 대응되는 데이터 값(달 별 매출액)
                            
                            data: a1,
                      
                            
                            backgroundColor: [
                                //색상
                                'rgba(153, 113, 59, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(153, 113, 59, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                        
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>                           
                                
                                
                                
                            </table>
                        </div>
                    </div>
                </div>
              
            </div>
        </main>
    </div>
</body>

</html>