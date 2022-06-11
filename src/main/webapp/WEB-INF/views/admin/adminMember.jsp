<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="main-content" >
        <main>
			<!-- 상단 박스 -->
    		<jsp:include page="../inc/admin_topBox.jsp"></jsp:include>
    		<!-- 상단 박스종료 -->
    		
            <div class="recent-grid">
                <div class="project">
                    <div class="card">
                        <div class="card-header">
                            <h3>Member List</h3>
                        </div>
                        <div class="card-body">

   <!--리스트를 생성할 table 생성 및 리스트의 종류 정의(회원아이디, 회원이름, 등급)-->
	<table class="board_table" id="memList">
			<tr>
			<th>회원아이디<label></label>
                  <select name="회원 아이디" id="" onchange="sortId(this.value)">					                   
                     <option >정렬</option>
                     <option value="asc" >오름차순</option>
                     <option value="desc" >내림차순</option>
                  </select>
			</th>
			<th>회원 이름<label></label>
                  <select name="회원 이름" id="" onchange="sortName(this.value)">					                   
                     <option >정렬</option>
                     <option value="asc" >오름차순</option>
                     <option value="desc" >내림차순</option>
                  </select>
			</th>
			<th>회원 등급<label></label>
                  <select name="회원 등급" id="" onchange="sortGrade(this.value)">					                   
                     <option >정렬</option>
                     <option value="asc" >오름차순</option>
                     <option value="desc" >내림차순</option>
                  </select>
			</th>
			</tr>

	 <!--배열정의 및 반복문 정의-->  
	 <!--memberList의 배열을 list[i][j]라고 한다면 i의 값은 tr을, j값은 th를 결정함.-->  
	 <!--현재 JSP 파일에서 한 눈에 찾아지는 것은 것은 th의 값 memberList.()이다.-->  
	 <!--Controller에서 list<>에 저장된 것들이 배열로 되어있어 forEach 구문을 통하여 tr 값이 결정될 것임.-->		   
			<c:forEach var="memberList" items="${memberList}">
			<tr>
			<td>${memberList.member_id} </td>

			<td style="width: 65%; text-align: center; padding:0px;">${memberList.member_name }</td>

			<td>${memberList.member_grade }</td>
			</tr>
		</c:forEach>
</table>
	
	<script>
	
	//====================아이디 정렬========================	 
	function sortId(type) { // html(현재jsp 페이지)에서 select태그 속성인 onchange="sortId(this.value)"의 this.value로 파라미터 값을 전달하고 function sortId(type)의 type으로 파라미터 값을 받아옴.
							// html에서 select 태그의 value는 option 태그를 선택할 때 value값이 정해지며, 그 값이 this.vlaue의 파라미터로 들어감.
							// 현재 작성된 html에서 파라미터로 전달될 수 있는 값은 널스트링, asc, desc 세 가지 중 하나이다.
		
	var sortType = type; // sortType 선언하면서 전달받은 파라미터 값을 저장함. (sortType 선언 이유는 if문을 사용하여 정렬 기준을 나누기 위함)

	var table = document.getElementsByTagName('table');  // html(현재 JSP페이지)에서 table태그를  table이라는 변수로 선언
								 // document.getElementsByTagName('XX')는 XX태그를 지정한다는 코드임
								 // 현재 코드는 table(스크립트에서 사용할 변수)이라는 변수를 table태그(현재 jsp에서 지정한 태그)로 선언하는 것임

		if (sortType == 'asc') { // 여기서 asc라는 값은 위에 선언한 sortType에 저장된 값이며, 이 값은 function sortId(type)의 type에 주어진 파라미터임
	    	sortIdAsc(table[0].rows); //  sortType이 asc이면 function sortIdAsc(rows)를 호출하는데, 이때 파라미터 값으로 table[0].rows를 전달한다는 뜻. 
	    } else if (sortType == 'desc') { //  	    desc이면 ~~ 위와 동일.
			sortIdDesc(table[0].rows);  // table뒤에[0]이 붙은 이유는, table이라는 변수에 html(현재 jsp 페이지) 내에 위치한 모든 table태그를 지정해준 것임.
										// 이 html에는 table태그가 하나라서 상관없지만, 여러개가 있다면 순서대로 배열이 생성됨.
	    } // table[0].rows에서 rows는 행을 나타낸다. table 태그의 tr이라고 생각하면됨, tr도 반복문을 통해 여러개가 되므로 배열이 생성됨.
	}
	
	function sortIdAsc(rows){ // 위의 if문에 의해 결정되는 함수 
	var checkSort = true; // 반복을 끝내기 위하여 boolean 값을 선언.
    
	while (checkSort){ // checkSort 가 true이면 반복문 계속 진행.
    	checkSort = false; // 처음부터 false 값으로 바꿔주고

		for(var i = 1; i < (rows.length-1); i++) { // while 반복문 안에 위치한 for 반복문, rows.length-1 인 이유는 i차례일때 비교되는 대상은 i+1이기 때문임.
																					// 즉, 10행까지 있는 테이블은 9행 차례일때 9행과 10행을 비교하면 끝남.
																					// 추가로 table[0]은 비교할 값에서 제외해야함. (회원 아이디, 이름, 등급을 표시)
																					// 반복은 2행(=rows[1])부터 시작해야함.
																					// 1행과 마지막 행을 빼고 비교해야하므로, 전체 길이에서 2만큼의 길이가 포함 안되게 
																					// if 문을 작성해야함.
			var fCell = rows[i].cells[0]; 			// cell[0]은 tr(i행)에서 첫번째 td의 위치를 의미함
			var sCell = rows[i+1].cells[0];			// if문에서 비교를 위해 변수 선언.
			
			if(fCell.innerHTML.toLowerCase() > sCell.innerHTML.toLowerCase()) { // ex) 2행의 1열의 값이 3행 1열의 값보다 클 경우 == (순서가 느릴 경우)  
				rows[i].parentNode.insertBefore(rows[i+1], rows[i]);  // 부모노드(테이블 태그) 안에서, 즉 현재 table태그 안에서 2행과 3행의 위치를 바꾼다.
				// 여기서 노드 개념은 잘 설명을 못해드리겠습니다.
				checkSort = true;
				// 행이 바뀌면 true로 변경. => for문은 boolean 상관없이 i값에 의해 반복.
				// for문이 종료되었을 때 true이면 while문으로 가서 다시 for문 반복 => 이해가 잘 안될 것임.
					
				// 그 이유는 5 4 3 2 1 순서대로 위치한다고 가정한다.
				// i=1 일때 첫번째 순서인 5와 두번째 순서인 4를  비교함. => 5의 순서가 더 뒤에 와야하므로 순서는 4 5 3 2 1이 됨.
				// i=2 일때 두번째 순서인 5와 세번째 순서인 3을 비교함. => 5의 순서가 더 뒤에 와야하므로 순서는 4 3 5 2 1이 됨.
				// 같은 원리로 i=4 까지 순서대로 진행하면 4 3 2 1 5 의 순서로 배치가 되고 for문이 종료된다.
				// for문이 끝났는데 오름차 순으로 정렬이 되지 않았다. => 고로 다시 반복문을 시도해줘야함.
				// 이미 for문이 끝났기 때문에 다시 for문을 시행하기 위해 단순 반복문인 while로 감싸준다.
				
				// 그러면 4 3 2 1 5 이 순서에서 다시 for문이 시행되고
				// i=1 일때 첫번째 순서인 4와 두번째 순서인 3을 비교함 => 3 4 2 1 5 checkSort 값 true
				// i=2 일때 두번째 순서인 4와 세번째 순서인 2을 비교함 => 3 2 4 1 5 checkSort 값 true
				// i=3 일때 세번째 순서인 4와 네번째 순서인 1을 비교함 => 3 2 1 4 5 checkSort 값 true
				// i=4 일때 네번째 순서인 4와 다섯번째 순서인 5을 비교함, 바꿀 필요 없음 => 3 2 1 4 5 checkSort 값 ture
				// for문 종료, checkSort 값이 ture 이므로 다시 while문 반복 시작, checkSort 값 flase.
				
				// 이렇게 반복하다보면 1 2 3 4 5 로 순서가 바뀌고, if문이 끝나면 true값을 가져오게 됨.
				// 다시 while문 시행, checkSort 값 flase가 됨. => for문 시작
				//  1 2 3 4 5 에서, i=1 일 때 첫번째 1, 두번째 2이므로 if문 조건 성립 안함.
				// 마찬가지 i=2, i=3, i=4 일 때도 성립 안하기 때문에 for문 내에서 if문 시행되지 않음.
				// => 최종적으로 checkSort 값은 flase 상태 유지, => while문 조건 성립 안함, while문 종료
				// => 1 2 3 4 5 의 순서대로 출력됨.
			}	
			
		}
	}
}
	
	function sortIdDesc(rows){
		var checkSort = true;
	   
		while (checkSort){
	    	checkSort = false;

			for(var i = 1; i < (rows.length-1); i++) {
				var fCell = rows[i].cells[0];
				var sCell = rows[i+1].cells[0];
				
				if(fCell.innerHTML.toLowerCase() < sCell.innerHTML.toLowerCase()) {
					rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
					checkSort = true;
				} 
			}
		}
	}
	
	//======================이름 정렬======================
	
	function sortName(type) {
		
		var sortType = type;

		var table = document.getElementsByTagName('table'); 


		if (sortType == 'asc') { // 여기서 asc라는 값은 위에 선언한 sortType에 저장된 값이며, 이 값은 function sortId(type)의 type에 주어진 파라미터임
	    	sortNameAsc(table[0].rows);
	    } else if (sortType == 'desc') {						
			sortNameDesc(table[0].rows); // sortType이 asc이면 
	    }
	}
		
		function sortNameAsc(rows){
		var checkSort = true;
	    while (checkSort){
	    	checkSort = false;

			for(var i = 1; i < (rows.length-1); i++) {
				var fCell = rows[i].cells[1];
				var sCell = rows[i+1].cells[1];
				
				if(fCell.innerHTML.toLowerCase() > sCell.innerHTML.toLowerCase()) {
					rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
					checkSort = true;
				} 
			}
		}
	}
		
		function sortNameDesc(rows){
			var checkSort = true;
		   
			while (checkSort){
		    	checkSort = false;

				for(var i = 1; i < (rows.length-1); i++) {
					var fCell = rows[i].cells[1];
					var sCell = rows[i+1].cells[1];
					
					if(fCell.innerHTML.toLowerCase() < sCell.innerHTML.toLowerCase()) {
						rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
						checkSort = true;
					} 
				}
			}
		}	
		
		//=====================등급 정렬=======================
		
		function sortGrade(type) {
			
			var sortType = type;

			var table = document.getElementsByTagName('table'); 


			if (sortType == 'asc') { 
		    	sortGradeAsc(table[0].rows);
		    } else if (sortType == 'desc') {						
				sortGradeDesc(table[0].rows); 
		    }
		}
			
			function sortGradeAsc(rows){
			var checkSort = true;
		    while (checkSort){
		    	checkSort = false;

				for(var i = 1; i < (rows.length-1); i++) {
					var fCell = rows[i].cells[2];
					var sCell = rows[i+1].cells[2];
					
					if(fCell.innerHTML.toLowerCase() > sCell.innerHTML.toLowerCase()) {
						rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
						checkSort = true;
					} 
				}
			}
		}
			
			function sortGradeDesc(rows){
				var checkSort = true;
			   
				while (checkSort){
			    	checkSort = false;

					for(var i = 1; i < (rows.length-1); i++) {
						var fCell = rows[i].cells[2];
						var sCell = rows[i+1].cells[2];
						
						if(fCell.innerHTML.toLowerCase() < sCell.innerHTML.toLowerCase()) {
							rows[i].parentNode.insertBefore(rows[i+1], rows[i]);
							checkSort = true;
						} 
					}
				}
			}	
	
	
	
	
	
	
	
	</script>


						</div>
                        </div>
                    </div>
                </div>
                
  	      </main>
            </div>
</body>

</html>