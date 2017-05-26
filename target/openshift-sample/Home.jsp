<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<Title>Redirect Page</Title>

<style>
body{
 margin:0px;
 font-family:Arial;
 color:#404040;
  background-color: #FFF;
}

.item {
  display:table-cell;
  padding: 0px;
  border-radius: 2px;
  background-color: #f0f0f0;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  border : 1px solid rgba(0, 0, 0, 0.1)
}

.productSummary{
	margin-top:150px;
}
.closeIco{
	opacity: 0.8;
    filter: alpha(opacity=80); 
	height:10px;
	display: block;
}
.closeIco:hover{
	opacity: 0.4;
    filter: alpha(opacity=40); 
}
</style>

<script>
function redirectPage(page){
	
	window.location = "Startup?ref="+page;
}
</script>

</head>
<body>

<div class="productSummary">
<div id="main-div" style="font-size: 22px;text-align:left;border:0px solid #CCC;width:88%;margin-left: 5%;margin-right: 5%;padding:1%; display: table;border-spacing: 8px;">
<div class="row-div" style="display:table-row">
<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;" onclick="redirectPage('dlbank')">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		<img src="images/dlbank.png" height="80px" />
		
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			DL Bank
		</div>
</div>

<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;" onclick="redirectPage('bing')">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		
		<img src="images/bing.jpg" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Bing
		</div>
</div>

<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;" onclick="redirectPage('google')">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		
			<img src="images/google.png" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Google
		</div>
</div>


</div>
<div class="row-div" style="display:table-row">
<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;" onclick="redirectPage('yahoo')">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		
			<img src="images/yahoo.png" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Yahoo!
		</div>
</div>
<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;" onclick="redirectPage('adsense')">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		
			<img src="images/google.png" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Google AdSense
		</div>
</div>

<div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;" onclick="redirectPage('facebook')">
		
			<img src="images/Facebook.png" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Facebook
		</div>
</div>

<!-- <div class="item" style="background-color:#FFF;max-width:25%;margin-left:10px;">
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
		
			<img src="images/google.png" height="80px" />
		</div>
		<div style="background-color:#F0F0F0;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Google
		</div>
</div>

<div class="item" style="background-color:#aaa;width:25%;margin-left:10px;">
		
		<div style="background-color:#FFF;padding:5px;border-top-left-radius:3px;border-top-right-radius:3px;">
			
			<img src="images/google.png" height="80px" />
		</div>
		<div style="background-color:#EEE;font-size: 12px;text-align:left;padding:5px;line-height: 20px;border-top: 1px solid #aaa;">
			Google
		</div> -->
</div>
</div>
</div>
</div>
</body>
</html>