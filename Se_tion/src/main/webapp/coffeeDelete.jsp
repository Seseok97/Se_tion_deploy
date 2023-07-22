<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeDelete</title>
	<!-- CSS -->
  <link href="style.css" rel="stylesheet" type="text/css" >
  <!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
  <script type="text/javascript">

// Alert Redirect to Another Link
  $(document).ready(function(e) {
      swal({
      title: "지울거?", 
      text: "지우면 되돌릴수 없음!", 
      type: "warning",
      confirmButtonText: "지워라!!",
      showCancelButton: true
      })
        .then((result) => {
        if (result.value) {
            window.location = 'coffeeDeleteAction.jsp?id=<%=request.getParameter("id") %>';
        } else if (result.dismiss === 'cancel') {
//             swal(
//               '취소되었음!!',
//               ' ',
//             )
            back();
        }
      })
  });// jq end
       		function back(){
            	history.back();
            }// function end
  </script>
</head>
<body>
<h1>COFFEE</h1>


</body>
</html>