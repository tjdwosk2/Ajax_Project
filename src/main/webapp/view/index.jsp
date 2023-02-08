<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table {
	width: 800px;
	margin-top: 50px;

	margin: auto;
}

table, th, td {
	border: 1px solid green;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			$("#tbody").empty();
			$.ajax({
				url: "${pageContext.request.contextPath}/MyController01", //여기가서 정보륵 가져오자
				dataType: "xml", // 데이터타입은 xml 로 
				method : "post", // 전송방식 post 
				success: function(data) {
					//console.log(data)
					var tbody="";
					$(data).find("member").each(function() {
						tbody += "<tr>";
						tbody +="<td>"+$(this).find("m_idx").text() + "</td>"
						tbody +="<td>"+$(this).find("m_id").text() + "</td>"
						tbody +="<td>"+$(this).find("m_pw").text()+ "</td>"
						tbody +="<td>"+$(this).find("m_name").text() + "</td>"
						tbody +="<td>"+$(this).find("m_reg").text() + "</td>"
						tbody +="<td>"+$(this).find("m_addr").text() + "</td>"
						
						tbody += "</tr>";
					});
					$("#tbody").append(tbody);
				},
				error: function() {
					alert("실패");
				}
			});
		});
		$("#btn2").click(function() {
			$("#tbody").empty();
			$.ajax({
				url: "${pageContext.request.contextPath}/MyController02", //여기가서 정보륵 가져오자
				dataType: "xml", // 데이터타입은 xml 로 
				method : "post", // 전송방식 post 
				success: function(data) {
				//	console.log(data)
				$("table").css("border","1px solid red");
					var tbody="";
					$(data).find("member").each(function() {
						tbody += "<tr>";
						tbody +="<td>"+$(this).attr("m_idx")+ "</td>";
						tbody +="<td>"+$(this).attr("m_id")+ "</td>";
						tbody +="<td>"+$(this).attr("m_pw")+ "</td>";
						tbody +="<td>"+$(this).attr("m_name") + "</td>";
						tbody +="<td>"+$(this).attr("m_reg")+ "</td>";
						tbody +="<td>"+$(this).attr("m_addr")+ "</td>";
						
						tbody += "</tr>";
					});
					$("#tbody").append(tbody);
				},
				error: function() {
					alert("실패");
				}
			});
		});
		$("#btn3").click(function() {
			$("#tbody").empty();
			$.ajax({
				url: "${pageContext.request.contextPath}/MyController03", //여기가서 정보륵 가져오자
				dataType: "xml", // 데이터타입은 xml 로 
				method : "post", // 전송방식 post 
				success: function(data) {
				//	console.log(data)
				$("table").css("border","1px solid red");
					var tbody="";
					$(data).find("member").each(function() {
						tbody += "<tr>";
						tbody +="<td>"+$(this).attr("m_idx")+ "</td>";
						tbody +="<td>"+$(this).attr("m_id")+ "</td>";
						tbody +="<td>"+$(this).attr("m_pw")+ "</td>";
						tbody +="<td>"+$(this).text()+ "</td>";
						tbody +="<td>"+$(this).attr("m_reg")+ "</td>";
						tbody +="<td>"+$(this).attr("m_addr")+ "</td>";
						
						tbody += "</tr>";
					});
					$("#tbody").append(tbody);
				},
				error: function() {
					alert("실패");
				}
			});
		});
		$("#btn4").click(function() {
			$("#tbody").empty();
			$.ajax({
				url: "${pageContext.request.contextPath}/MyController04", //여기가서 정보륵 가져오자
				dataType: "json", // 데이터타입은 xml 로 
				method : "post", // 전송방식 post 
				success: function(data) {
				//	console.log(data)
				$("table").css("border","1px solid red");
					var tbody="";
					$.each(data, function(k, v) {
						
						tbody += "<tr>";
						tbody +="<td>"+v["m_idx"] + "</td>";
						tbody +="<td>"+v["m_id"] + "</td>";
						tbody +="<td>"+v["m_pw"] + "</td>";
						tbody +="<td>"+v["m_name"] + "</td>";
						tbody +="<td>"+v["m_reg"] + "</td>";
						tbody +="<td>"+v["m_addr"] + "</td>";
						tbody += "</tr>";		
					});
					
					$("#tbody").append(tbody);
				},
				error: function() {
					alert("실패");
				}
			});
		});
		$("#btn5").click(function() {
			$("#tbody").empty();
			$.ajax({
				url: "${pageContext.request.contextPath}/MyController05", //여기가서 정보륵 가져오자
				dataType: "text", // 데이터타입은 xml 로 
				method : "post", // 전송방식 post 
				success: function(data) {
				//	console.log(data)
				$("table").css("border","1px solid red");
					var tbody="";
					var  rows = data.split("/");
					for ( var k in rows) {
						tbody +="<tr>";
						var cols = rows[k].split(",");
						for ( var y in cols) {
							tbody += "<td>" + cols[y] +"</td>";
						}
						tbody +="</tr>";
					}

					$("#tbody").append(tbody);
				},
				error: function() {
					alert("실패");
				}
			});
		});
		
		
	});

</script>
</head>
<body>

		<div style="width: 800px;  margin:auto;">
			<button id = "btn1">xm1 태그 가져오기</button>
			<button id = "btn2">xm1 속성 가져오기</button>
			<button id = "btn3">xm1 태그와 속성 가져오기</button>
			<button id = "btn4">json 가져오기</button>
			<button id = "btn5">text 가져오기</button>

		</div>
		<br><br><br>
		<hr>
		<br><br><br>
		<table >
				<thead>
						<tr>
								<th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>날짜</th><th>주소</th>
						</tr>
				</thead>
				<tbody id ="tbody"></tbody>
		</table>

</body>
</html>