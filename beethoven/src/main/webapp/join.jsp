<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select max(resvno) from tbl_vaccresv_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href ="css/style.css?ver=123">
<title>Insert title here</title>
<script type="text/javascript">
function checkValue() {
	if(!document.data.jumin.value) {
		alert("주민번호를 입력하세요.");
		data.jumin.focus();
		return false;
	} 
	else if (!document.data.hospcode.value) {
		alert("병원코드를 입력하세요.");
		return false;
	} 
	else if (!document.data.resvdate.value) {
		alert("예약날짜를 입력하세요.");
		data.resvdate.focus();
		return false;
	} 
	else if (!document.data.resvtime.value) {
		alert("에약시간 입력하세요.");
		data.resvtime.focus();
		return false;
	}  
	else if (!document.data.vcode.value) {
		alert("백신코드 입력하세요.");
		data.vcode.focus();
		return false;
	}
	
	return true;
}
</script>



</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class = "section">
		 <h3 style="text-align:center; margin:10px">백신 예약</h3><br>

		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
			<table class = "table_line">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" value="<%= num %>"  readonly> 예) 20210011</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin" > 예) 790101-111111</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td><select name = "vcode">
					<option> 백신선택
					<option value = "V001"> V001
					<option value = "V002"> V002
					<option value = "V003">	V003			
					</select> 예) V001, V002, V003</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
					<input type="radio" name="hospcode" value = 'H001'>가_병원
					<input type="radio" name="hospcode" value = 'H002'>나_병원
					<input type="radio" name="hospcode" value = 'H003'>다_병원
					<input type="radio" name="hospcode" value = 'H004'>라_병원 예) H001, H002, H003, H004
					</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
					<input type="checkbox" name="hospcode" value = 'H001'>가_병원
					<input type="checkbox" name="hospcode" value = 'H002'>나_병원
					<input type="checkbox" name="hospcode" value = 'H003'>다_병원
					<input type="checkbox" name="hospcode" value = 'H004'>라_병원 예) H001, H002, H003, H004
					</td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td><input type="text" name="resvdate" > 예) 20210101</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="resvtime" >  예) 0830, 1130</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="location.href='join.jsp'">
				</tr>
			</table>
		</form>		
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>