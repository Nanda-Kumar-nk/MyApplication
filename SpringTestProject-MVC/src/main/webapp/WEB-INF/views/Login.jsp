<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<SCRIPT language="JavaScript">
	function test() {
		var txt1 = document.getElementById("text1").value;
		var txt2 = document.getElementById("text2").value;
		window.open("loadtestmodel?text1=" + txt1, '_self');
	}
</SCRIPT>

<SCRIPT language="JavaScript">
	function GetAjaxCall() {
		var text10 = jQuery("#text1").val();
		var text20 = jQuery("#text2").val();

	

		jQuery.ajax({
			url : "GetUserServlet",
			method : "Get",
			type : "JSON",
			data : "text1=" + text10 + "&text2=" + text20,// query parameters 1st 
			success : function(response) {
				$('#ajaxGetUserServletResponse').text(response);

			}
		});
	}
		function AjaxErrorHandling() {
		$.ajax({
		    type:'POST',
		    data: {
		        //some data to be passed
		    },
		    dataType: 'json',
		    url:'AjaxErrorHandling',
		    success: function(response){
		        alert(response);
		    },
		    error: function(jqXHR, textStatus, message) {
		    	$('#ajaxGetUserServletResponse').text(jqXHR.responseText);
		    	alert("message : "+message);
		    	alert("textstatus : "+textStatus);
		    	var response = $.parseHTML(jqXHR.responseText);

		    	    alert("response text() : "+$(response).text());
		    	    alert("sttaus : "+jqXHR.status);
		    	
		    	
		    },
		    complete: function(){
		        //window.location.reload(true);
		    } 
		});
		
		
		
	}
</SCRIPT>
<SCRIPT language="JavaScript">
function PostAjaxCall() {
	
	var text10 = jQuery("#text1").val();
	var text20 = jQuery("#text2").val();
	
    
            $.post("PostUserServlet",{
                 name:"kevin",
                 pass:"Duckburg"
             }).success(function( data ) {
            	 $('#ajaxGetUserServletResponse').text(data);
             })
         
}

</SCRIPT>



</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<form name="add" action="add">
		<table>
			<tbody>
				<tr>
					<td><label>Input 1: </label></td>
					<td><input type="text" name="text1" id="text1"></input></td>
				</tr>
				<tr>
					<td><label>Input 2: </label></td>
					<td><input type="text" name="text2" id="text2"></input></td>
				</tr>
				<tr>
					<td>
					<td><input type="submit" value="submit"></input</td>
					</td>
					<td><a href="javascript:test()">Display this Content using
							url linking</a></td>

				</tr>
				<tr>

					<td><strong> Response</strong>:
						<div id="ajaxGetUserServletResponse"></div> <br>
						<div id="ajaxGetUserServletResponseusername"></div> <br>
						<div id="ajaxGetUserServletResponsepassword"></div> <br></td>

					<td><input type="button" value="GetAjaxNethod"
						onclick="javascript:GetAjaxCall()"></td>
				
						
				</tr>
				<tr>


					<td><input type="button" value="PostAjaxMethod"
						onclick="javascript:PostAjaxCall()"></td>
				</tr>
				
						<tr>

		<td><input type="button" value="AjaxErrorHandling"
						onclick="javascript:AjaxErrorHandling()"></td>
			
				</tr>
				
				
			</tbody>
		</table>
	</form>





</body>
</html>
