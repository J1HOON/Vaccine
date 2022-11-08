
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css?ver=123">
<script type="text/javascript">
	function checkValue2() {
		  if(!document.data1.resvno.value) {
			  alert("예약번호를 입력하세요.");
			  data1.resvno.focus();
			  return false;
		  	}
		  }
</script>
<title>member_search</title>
</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>백신예약조회</h2><br>
 
	<form name="data1" action="member_search_list.jsp" method="post" onsubmit="return checkValue2()">
			<table class="table_line">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" size="10"> 
					</td>
				</tr>
				
				<tr>
					<td colspan="5" align="center">
						
						<input type="submit" value="조회하기"  >
						<input type="button" value="취소" onclick="location.href='member_list.jsp'">
				</tr>
			</table>
		</form>	
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>