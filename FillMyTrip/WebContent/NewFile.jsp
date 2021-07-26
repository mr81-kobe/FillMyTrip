<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

var roles = [];


		
		function cc(){
	for(var i =0;i<5;i++){
		roles.push({a : i, b : i+1, c : i+2 });

		
	}
			alert(roles[0].a);
			alert(roles[1].a);
			alert(roles[2].a);
			alert(roles[3].a);
			alert(roles[4].a);
		}

</script>


<button onclick="cc();">asd</button>

</body>
</html>