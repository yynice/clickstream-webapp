<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String ip = (String) request.getAttribute("ip");
	String source = (String) request.getAttribute("source");
	String access = (String) request.getAttribute("access");
	String currPg = (String) request.getAttribute("currPg");
	//request.setAttribute("source", source);
	//request.setAttribute("access", access);
	if(null == ip  ||  ip.isEmpty()){
		ip="0.0.0.0";
	}
	
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Site</title>
<style>
body{
	font-family: Arial;
	color: #444;
}

input{
	width: 220px;
    padding: 3px 3px;
    border-radius: 2px;
    border: 1px solid #999;
    color: #444;
	font-size:9px;
}


select{
	width: 220px;
    padding: 7px 7px;
    border-radius: 4px;
    border: 1px solid #999;
    color: #444;
}

.topNavLink{
	text-decoration:none;
	font-weight:bold;
	color:blue;
}

.topNavLink:hover{
	color:red;
}

</style>
<script>

var loadTime=0;
function loadDefault(){
	
	var dt = new Date();
	loadTime = dt.getTime();
	
	//var utcDate = dt.toUTCString();
	//alert(utcDate);
	
	//document.getElementById("timestamp").value = utcDate;
	//document.getElementById("ipadd").value = "<%=ip %>";
	//getLocation();
	document.getElementById("useragent").value = getUserAgent();
	document.getElementById("OS").value = getOS();
	
	var currPg = "<%=currPg %>";
	if(currPg=="Home")
		document.getElementById("siteImg").src ="images/homepage.png";
	if(currPg=="Loans")
		document.getElementById("siteImg").src ="images/Loans.png";
	if(currPg=="Bank Accounts")
		document.getElementById("siteImg").src ="images/BankAccounts.png";
	if(currPg=="Transfers")
		document.getElementById("siteImg").src ="images/transfers.JPG";
	if(currPg=="Credit Cards")
		document.getElementById("siteImg").src ="images/creditcards.png";
	if(currPg=="Special Offers and Discounts")
		document.getElementById("siteImg").src ="images/offers.png";
	
	
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
	 if ( null != nAgt && (verOffset=nAgt.indexOf("Version"))!=-1) 
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

	return ''+browserName;
	
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


function redirectUser(nxtPage)
{
	
	//var e = document.getElementById("page");
	//var nxtPage = e.options[e.selectedIndex].value;
	var cookievalue= escape(document.getElementById("username").value) + ";";
	document.cookie="username=" + cookievalue;
	cookievalue= escape(document.getElementById("userid").value) + ";";
	document.cookie="userid=" + cookievalue;
	//cookievalue= escape(document.getElementById("currPage").innerHTML) + ";";
	//document.cookie="prevPage=" + cookievalue;
	//cookievalue= escape(strUser) + ";";
	//document.cookie="currPage=" + cookievalue;
	
	var username =  document.getElementById("username").value;
	var userid =  document.getElementById("userid").value;
	
	var source= "<%=source %>";
	var access= "<%=access %>";
	var currPg= "<%=currPg %>";
	var dt = new Date();
	window.onunload=null;
	window.location = "Startup?action=abc&username="+username+"&userid="+userid+"&nextPage="+nxtPage+"&userAgent="+getUserAgent()+"&userOS="+getOS()+"&duration="+Math.round((dt.getTime()-loadTime)/1000)+"&source="+source+"&access="+access+"&currPg="+currPg;
   
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
    		  //document.getElementById(name.substring(1,name.length)).innerHTML= value;  
    	  }else{
    		  document.getElementById(name.substring(1,name.length)).value= value;
    	  }
      }
      	
   }
}



/* window.onclick=function(e){
	var y = e.pageY || e.clientY;
	alert(e.pageY +","+ y+","+e.clientY);
	
	
} */

window.onunload=function(e){
	

		//var e = document.getElementById("page");
		//var nxtPage = e.options[e.selectedIndex].value;
		var cookievalue= escape(document.getElementById("username").value) + ";";
		document.cookie="username=" + cookievalue;
		cookievalue= escape(document.getElementById("userid").value) + ";";
		document.cookie="userid=" + cookievalue;
		//cookievalue= escape(document.getElementById("currPage").innerHTML) + ";";
		//document.cookie="prevPage=" + cookievalue;
		//cookievalue= escape(strUser) + ";";
		//document.cookie="currPage=" + cookievalue;
		
		var username =  document.getElementById("username").value;
		var userid =  document.getElementById("userid").value;
		
		var source= "<%=source %>";
		var access= "<%=access %>";
		var currPg= "<%=currPg %>";
		
		
		var xmlhttp;	
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				
			}
		};

		var dt = new Date();
				
		var path="Startup?action=exit&username="+username+"&userid="+userid+"&nextPage=undefined&userAgent="+getUserAgent()+"&userOS="+getOS()+"&duration="+((dt.getTime()-loadTime)/1000)+"&source="+source+"&access="+access+"&currPg="+currPg;
		
		xmlhttp.open("GET",path,false);
		xmlhttp.send();
		//alert("closing");
		return "cl0000osing";
	
}
</script>
</head>
<body onload="loadDefault()">


<input type="hidden" id="timestamp"/>
<input type="hidden" id="location"/>
<input type="hidden" id="useragent"/>
<input type="hidden" id="OS"/>

<table  align="right" border=0>
<td><input type="text" id="username"/></td> </tr>
<td><input type="text" id="userid"/></td> </tr>
</table>

<table width="100%" align="center">
<tr bgcolor="">
	<td> </td>

	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Home')">Home</a></td>
	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Loans')">Loans</a></td>
	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Bank Accounts')">Bank Accounts</a></td>
	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Transfers')">Transfers</a></td>
	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Credit Cards')">Credit Cards</a></td>
	<td width="15%"><a href="#" class="topNavLink" onclick="redirectUser('Special Offers and Discounts')">Special Offers and Discounts</a></td>

</tr>
<tr> <td colspan="7"> <img id="siteImg" src="images/homepage.png" width="100%" height="100%"> </td> </tr>
</table>

</body>
</html>