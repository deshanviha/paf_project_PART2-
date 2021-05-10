
alert("Go Head");
$(document).ready(function() 
{  
		$("#alertSuccess").hide();  
	    $("#alertError").hide(); 
}); 
 
 
// SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 
 
	// Form validation-------------------  
	var status = validateFundForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 
 
	// If valid------------------------  
	var type = ($("#hidFundIDSave").val() == "") ? "POST" : "PUT"; 

	$.ajax( 
	{  
			url : "fundingService",  
			type : type,  
			data : $("#formFund").serialize(),  
			dataType : "text",  
			complete : function(response, status)  
			{   
				fundSave(response.responseText, status);  
			} 
	}); 
}); 


function fundSave(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully saved.");    
			$("#alertSuccess").show(); 

			$("#divFundGrid").html(resultSet.data);   
		} else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 

	} else if (status == "error")  
	{   
		$("#alertError").text("Error while saving.");   
		$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while saving..");   
		$("#alertError").show();  
	} 

	$("#hidFundIDSave").val("");  
	$("#formFund")[0].reset(); 
} 

 
// UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
{     
	$("#hidFundIDSave").val($(this).closest("tr").find('#hidFundIDUpdate').val());     
	$("#funderName").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#fundDate").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#fundPrice").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#fundCate").val($(this).closest("tr").find('td:eq(3)').text()); 
	$("#fundDesc").val($(this).closest("tr").find('td:eq(4)').text()); 
}); 




//REMOVE===========================================
$(document).on("click", ".btnRemove", function(event) 
{  
	$.ajax(  
	{   
		url : "fundingService",   
		type : "DELETE",   
		data : "fundId=" + $(this).data("fundid"),   
		dataType : "text",   
		complete : function(response, status)   
		{    
			fundDelete(response.responseText, status);   
		}  
	}); 
}); 

function fundDelete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")   
		{    
			
			$("#alertSuccess").text("Successfully deleted.");    
			$("#alertSuccess").show(); 
		
			$("#divFundGrid").html(resultSet.data); 
			
		} else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		}
		

	} else if (status == "error")  
	{   
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
	}
}
 
// CLIENT-MODEL========================================================================= 
function validateFundForm() 
{ // CODE
if ($("#funderName").val().trim() == "") 
 { 
 return "Insert Item Code."; 
 } 
// NAME
if ($("#fundDate").val().trim() == "") 
 { 
 return "Insert Item Name."; 
 } 9
// PRICE-------------------------------
if ($("#fundPrice").val().trim() == "") 
 { 
 return "Insert Item Price."; 
 } 

// is numerical value
var tmpPrice = $("#fundPrice").val().trim(); 
if (!$.isNumeric(tmpPrice)) 
 { 
 return "Insert a numerical value for fund Price."; 
 } 
// convert to decimal price
 $("#fundPrice").val(parseFloat(tmpPrice).toFixed(2));


if ($("#fundCate").val().trim() == "") 
 { 
 return "Insert fund category."; 
 } 

// DESCRIPTION------------------------
if ($("#fundDesc").val().trim() == "") 
 { 
 return "Insert Item Description."; 
 } 
	return true; 
}