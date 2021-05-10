<%@ page import="model.funding"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fund Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="component/jquery-3.4.1.min.js"></script> 
<script src="component/funding.js"></script>
</head>
<body>
<div class="container"> 
	<div class="row">  
		<div class="col-6"> 
			<h1>Fund Management</h1>
				<form id="formFund" name="formFund" method="post" action="fund.jsp">  
					Funder Name:   
					<input id="funderName" name="funderName" type="text"  class="form-control form-control-sm"> 
					<br>Date:   
  					<input id="fundDate" name="fundDate" type="date" class="form-control form-control-sm">   
					<br> Fund Price:   
  					<input id="fundPrice" name="fundPrice" type="text"  class="form-control form-control-sm">   
					<br> Fund category:   
  					<input id="fundCate" name="fundCate" type="text" class="form-control form-control-sm">   
  					<br> Description:   
  					<textarea class="form-control" id="fundDesc" name="fundDesc" rows="3"></textarea>
  					
  					<br>
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					<input type="hidden" id="hidFundIDSave" name="hidFundIDSave" value=""> 
				</form>
				
			<br>
				<div id="alertSuccess" class="alert alert-success"> </div>
				
			<br>
				
			   <div id="alertError" class="alert alert-danger"></div>		
			   <br>
			   
				<div id="divFundGrid">
					<%
						funding getFund = new funding();
					out.print(getFund.readFund());
					%>
				</div> 
			</div>
		</div>
</div>
 
</body>
</html>