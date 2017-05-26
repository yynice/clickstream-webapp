<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String ip = (String) request.getAttribute("ip");
	if(ip.isEmpty()){
		ip="0.0.0.0";
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bake your cookies here</title>
<style>
body{
	font-family: Arial;
	color: #444;
}

input{
	width: 220px;
    padding: 7px 7px;
    border-radius: 4px;
    border: 1px solid #999;
    color: #444;
}


select{
	width: 220px;
    padding: 7px 7px;
    border-radius: 4px;
    border: 1px solid #999;
    color: #444;
}

</style>
<script>
function loadDefault(){
	
	var dt = new Date();
	var utcDate = dt.toUTCString();
	//alert(utcDate);
	
	document.getElementById("timestamp").value = utcDate;
	document.getElementById("ipadd").value = "<%=ip %>";
	getLocation();
	document.getElementById("useragent").value = getUserAgent();
	document.getElementById("OS").value = getOS();
	
	
	ReadCookie();

}


function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
    	document.getElementById("location").value = "Not Supported";
    }
}

function showPosition(position) {
	document.getElementById("location").value  = ""+position.coords.latitude +","+ position.coords.longitude;	
}

function getUserAgent(){
	
	var nVer = navigator.appVersion;
	var nAgt = navigator.userAgent;
	var browserName  = navigator.appName;
	var fullVersion  = ''+parseFloat(navigator.appVersion); 
	var majorVersion = parseInt(navigator.appVersion,10);
	var nameOffset,verOffset,ix;

	// In Opera, the true version is after "Opera" or after "Version"
	if ((verOffset=nAgt.indexOf("Opera"))!=-1) {
	 browserName = "Opera";
	 fullVersion = nAgt.substring(verOffset+6);
	 if ((verOffset=nAgt.indexOf("Version"))!=-1) 
	   fullVersion = nAgt.substring(verOffset+8);
	}
	// In MSIE, the true version is after "MSIE" in userAgent
	else if ((verOffset=nAgt.indexOf("MSIE"))!=-1) {
	 browserName = "Microsoft Internet Explorer";
	 fullVersion = nAgt.substring(verOffset+5);
	}
	// In Chrome, the true version is after "Chrome" 
	else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) {
	 browserName = "Chrome";
	 fullVersion = nAgt.substring(verOffset+7);
	}
	// In Safari, the true version is after "Safari" or after "Version" 
	else if ((verOffset=nAgt.indexOf("Safari"))!=-1) {
	 browserName = "Safari";
	 fullVersion = nAgt.substring(verOffset+7);
	 if ((verOffset=nAgt.indexOf("Version"))!=-1) 
	   fullVersion = nAgt.substring(verOffset+8);
	}
	// In Firefox, the true version is after "Firefox" 
	else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) {
	 browserName = "Firefox";
	 fullVersion = nAgt.substring(verOffset+8);
	}
	// In most other browsers, "name/version" is at the end of userAgent 
	else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) < 
	          (verOffset=nAgt.lastIndexOf('/')) ) 
	{
	 browserName = nAgt.substring(nameOffset,verOffset);
	 fullVersion = nAgt.substring(verOffset+1);
	 if (browserName.toLowerCase()==browserName.toUpperCase()) {
	  browserName = navigator.appName;
	 }
	}
	// trim the fullVersion string at semicolon/space if present
	if ((ix=fullVersion.indexOf(";"))!=-1)
	   fullVersion=fullVersion.substring(0,ix);
	if ((ix=fullVersion.indexOf(" "))!=-1)
	   fullVersion=fullVersion.substring(0,ix);

	majorVersion = parseInt(''+fullVersion,10);
	if (isNaN(majorVersion)) {
	 fullVersion  = ''+parseFloat(navigator.appVersion); 
	 majorVersion = parseInt(navigator.appVersion,10);
	}

	return ''+browserName+' '+fullVersion;
	
}

function getOS(){
	
	var OSName="Unknown OS";
	if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
	if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
	if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
	if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";
	return OSName;
	
}



function WriteCookie()
{
   var cookievalue= escape(document.getElementById("username").value) + ";";
   document.cookie="username=" + cookievalue;
   cookievalue= escape(document.getElementById("userid").value) + ";";
   document.cookie="userid=" + cookievalue;
}


function redirectUser()
{
	
	var e = document.getElementById("page");
	var strUser = e.options[e.selectedIndex].value;
	var cookievalue= escape(document.getElementById("username").value) + ";";
	document.cookie="username=" + cookievalue;
	cookievalue= escape(document.getElementById("userid").value) + ";";
	document.cookie="userid=" + cookievalue;
	cookievalue= escape(document.getElementById("currPage").innerHTML) + ";";
	document.cookie="prevPage=" + cookievalue;
	cookievalue= escape(strUser) + ";";
	document.cookie="currPage=" + cookievalue;
	
	window.location = "Startup?action=abc&cookie="+document.cookie;
   
}

function ReadCookie()
{
   var allcookies = document.cookie;
     
   // Get all the cookies pairs in an array
   cookiearray = allcookies.split(';');
   
   // Now take key value pair out of this array
   for(var i=0; i<cookiearray.length; i++){
      name = unescape(cookiearray[i]).split('=')[0];
      value = unescape(cookiearray[i]).split('=')[1];
      //alert(name.substring(1,name.length));
      if(document.getElementById(name.substring(1,name.length))!=null){
    	  //alert(name+","+value);
    	  
    	  if(name==" prevPage" || name==" currPage"){
    		  document.getElementById(name.substring(1,name.length)).innerHTML= value;  
    	  }else{
    		  document.getElementById(name.substring(1,name.length)).value= value;
    	  }
      }
      	
   }
}


</script>
</head>
<body onload="loadDefault()">

<table width="80%" align="center">
<tr> <td>Previous Page</td>	<td><label id="prevPage">Page 0</label></td> </tr>
<tr> <td>Current Page</td>	<td><label id="currPage">Page 0</label></td> </tr>
<tr> <td>Username</td>		<td><input type="text" id="username"/></td> </tr>
<tr> <td>User ID</td>		<td><input type="text" id="userid"/></td> </tr>
<tr> <td>Timestamp</td>		<td><input type="text" id="timestamp"/></td> </tr>
<tr> <td>Location</td>		<td><input type="text" id="location"/></td> </tr>
<tr> <td>IP Address</td>	<td><input type="text" id="ipadd"/></td> </tr>
<tr> <td>UserAgent</td>		<td><input type="text" id="useragent"/></td> </tr>
<tr> <td>OS</td>			<td><input type="text" id="OS"/></td> </tr>
<tr> <td>Redirect To</td>	<td><select id="page" onchange="redirectUser()"> 
									<option value="pg1">pg1</option>
									<option value="pg2">pg2</option>
									<option value="pg3">pg3</option>
									<option value="pg4">pg4</option>
									<option value="pg5">pg5</option>
									<option value="pg6">pg6</option>
									<option value="pg7">pg7</option>
									<option value="pg8">pg8</option>
									<option value="pg9">pg9</option>
									<option value="pg10">pg10</option>
									<option value="pg11">pg11</option>
									<option value="pg12">pg12</option>
								</select></td> 
</tr>

</table>
</body>
</html>