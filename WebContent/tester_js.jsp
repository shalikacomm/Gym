<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<script src = "assets/plugins/jquery-2.0.3.min.js"></script>
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

				<script type="text/javascript">
					function showcommentform() {
						var data = "Name:<input type='text' name='name'><br>Comment:<input type='text' name='name1' rows='5' cols='80'/><br><input type='submit' value='submit'>";

						document.getElementById('mylocation').innerHTML = data;
					}
				</script>
				
				
				
				<form name="myForm">
					<input type="button" value="comment" onclick="showcommentform()">
					<div id="mylocation"></div>
				</form>

			</div>
		</div>

		<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>