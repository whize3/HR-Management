<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_04").css("background-color", "gray")
	});
</script>
</head>
<body>
<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
<jsp:setProperty property="*" name="user" />
<c:if test="${user.id==null }">
<script type="text/javascript">
alert("�α������ּ���")
history.go(-1)
</script>
</c:if>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">��My Library > ���Ǽ���</div>
				<div>
					<div class="mainview_cnt">
						&nbsp;&nbsp;&nbsp;��ü : ${bc_cnt }
						<hr color="black" width="670"/>
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="150">��ȣ</th>
									<th width="350">����</th>
									<th width="180">�ۼ�����</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><hr color="black" /></td>
								</tr>
								<!-- for���ۤ� -->
								<c:forEach var="k" items="${list }">
								<tr>
									<td>${k.bc_idx }</td>
									<td><a href="/HbLib/Controller?type=selectone&b_num=${k.b_num }">${k.b_subject }</a></td>
									<td>${k.bc_date.substring(0,10) }</td>
								</tr>
								<tr>
									<td colspan="3"><hr /></td>
								</tr>
								</c:forEach>
								<!-- for�� -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>