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



<body>
     <jsp:include page="../inc/admin_element.jsp"></jsp:include>
    <div class="main-content">
        <main>
<!--             <div class="cards"> -->
<!--                 <div class="card-signle"> -->
<!--                     <div> -->
<!--                         <h1>55 여기 쿠폰</h1> -->
<!--                         <span>Customers</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span><i class="far fa-users"></i></span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="card-signle"> -->
<!--                     <div> -->
<!--                         <h1>76</h1> -->
<!--                         <span>Project</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span><i class="far fa-clipboard"></i></span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="card-signle"> -->
<!--                     <div> -->
<!--                         <h1>123</h1> -->
<!--                         <span>Orders</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span><i class="far fa-bags-shopping"></i></span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="card-signle"> -->
<!--                     <div> -->
<!--                         <h1>$7k+</h1> -->
<!--                         <span>Income</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span><i class="fas fa-wallet"></i></span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="recent-grid">
                <div class="project">
                    <div class="card">
                        <div class="card-header">
                            <h3>Recent Project</h3>

                            <button>See all <span><i class="fas fa-arrow-right"></i></span></button>
                        </div>
                        <div class="card-body">
                            <table width="100%">
                            
  <div style="width: 1200px; height: 800px; " class="chart">
   <!--차트가 그려질 부분-->
   <canvas id="myChart"></canvas>
</div>
<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1','2','3','4','5','6','7','8','9','10','11','12'
                    ],
                    datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                21,19,25,20,23,26,25,20,27,28,24,27 //x축 label에 대응되는 데이터 값
                            ],
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
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
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
                <div class="customers">

                    <div class="card">
                        <div class="card-header">
                            <h2>New Customer</h2>

                            <button>See all <span><i class="fas fa-arrow-right"></i></span></button>
                        </div>
                        <div class="card-body">
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info">
                                    <img src="assets/images/user.jpg" width="40px" height="40px" alt="">
                                    <div>
                                        <h4>Md.Mominul</h4>
                                        <small>CEO of Company</small>
                                    </div>
                                </div>
                                <div class="contact">
                                    <span><i class="fas fa-user-circle"></i></span>
                                    <span><i class="fas fa-comment"></i></span>
                                    <span><i class="fas fa-phone"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>