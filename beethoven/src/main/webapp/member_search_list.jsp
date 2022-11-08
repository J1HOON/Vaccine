<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	int rNo = Integer.parseInt(request.getParameter("resvno"));
	
	StringBuffer sb = new StringBuffer();
	
	sb.append(" select v.resvno")
	.append(" ,j.name")
	.append(" ,case substr(v.jumin, 8, 1)")
	.append(" when '1' then '남'")
	.append(" 	when '2' then '여' ")
	.append(" end as gender ")
    .append(" ,case v.HOSPCODE ")
    .append(" 	when 'H001' then '가_병원' ")
    .append(" 	when 'H002' then '나_병원' ")
    .append(" 	when 'H003' then '다_병원' ")
    .append(" 	when 'H004' then '라_병원' ")
    .append(" end as hospcode ")
    .append(" ,to_char(v.RESVDATE,'yyyy\"년\"mm\"월\"dd\"일\"') as  RESVDATE ")
    .append(" ,substr(to_char(v.RESVTIME, 'FM0000'),1,2)")
    .append(" 	|| ':' || substr(to_char(v.RESVTIME, 'FM0000'),3,2) as RESVTIME")
    .append(" ,case VCODE ")
    .append(" when 'V001' then 'A백신'")
    .append(" when 'V002' then 'B백신'")
    .append(" when 'V003' then 'C백신'")
    .append(" end as vcode")
    .append(" ,case h.HOSPADDR ")
    .append(" 	when '10' then '서울' ")
    .append(" 	when '20' then '대전' ")
    .append(" 	when '30' then '대구' ")
    .append(" 	when '40' then '광주' ")
    .append(" end as HOSPADDR ")
    .append(" from TBL_VACCRESV_202108 v, TBL_JUMIN_202108 j, TBL_HOSP_202108 h ")
    .append(" where v.JUMIN = j.JUMIN and v.hospcode = h.hospcode ")
    .append(" and v.RESVNO =").append(rNo);
    
    
	String sql = sb.toString();
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>member_search_list</title>
</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>예약 조회</h2><br>
  
		<%if(rs.next()){ %>
			
			<table class="table_line">
														
				<tr>
					<th>예약번호</th>
					<th>성명</th>
					<th>성별</th>
					<th>병원이름</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>백신코드</th>
					<th>병원지역</th>
				</tr>
				
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= rs.getString(6) %></td>
					<td><%= rs.getString(7) %></td>
					<td><%= rs.getString(8) %></td>
				</tr>
				
				<tr>
					<td colspan="7" align="center">
						<input type="button" value="홈으로" onclick="location.href='index.jsp'">
						
				</tr>		
			</table>
			<%}else{ %>
				<p align="center">회원번호 <%= rNo%>의 회원 정보가 없습니다.</p>
				
				<p align="center"> <input type="button" value="다시조회" onclick="location.href='member_search.jsp'"></p>
		
		   <% } %>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>