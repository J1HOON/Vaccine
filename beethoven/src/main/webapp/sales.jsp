<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    StringBuffer sb = new StringBuffer();
    
    sb.append(" select h.HOSPADDR, ")
    .append(" case h.HOSPADDR ")
    .append(" 	when '10' then '서울' ")
    .append(" 	when '20' then '대전' ")
    .append(" 	when '30' then '대구' ")
    .append(" 	when '40' then '광주' ")
    .append(" end as HOSPAREA, ")
    .append(" count(v.HOSPCODE) ")
    .append(" from TBL_VACCRESV_202108 v, TBL_HOSP_202108 h ")
    .append(" where h.HOSPCODE = v.HOSPCODE(+) ")
    .append(" group by HOSPADDR ")
    .append(" order by HOSPADDR ");
    
    String sql = sb.toString();
    
    Connection conn = DBConnect.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    
    int sum = 0;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver=123">
</head>
<body>
 <header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section>
	<div class="section">
		<h2>백신예약현황</h2>
		<div>
			<table class="table_line">
				<tr>
					<th>병원지역</th>
					<th>병원지역명</th>
					<th>접종예약건수</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
				<%
				sum += Integer.parseInt(rs.getString(3));
				} %>
				<tr>
					<td colspan="2">총합</td>
					<td><%=sum %></td>
				</tr>
			</table>
		</div>
	</div>
 </section>	
 <footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
 </footer>
</body>
</html>