<%@ page import="mas.TokenProcessor" %>

<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2017/6/19
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <METE NAME="renderer" CONTENT="webkit|ie-comp|ie-stand"/>
  <META HTTP-EQUIV="pragma" CONTENT="no-cache"/>
  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
  <META HTTP-EQUIV="expires" CONTENT="0"/>
  <title></title>
  <link rel="stylesheet" href="./css/banner.css">
  <link rel="stylesheet" href="./layer/skin/layer.css">
  <link rel="stylesheet" href="./layer/skin/layer.ext.css">
  <link rel="stylesheet" href="./css/banner.css">
  <script src="./jquery-1.11.1/jquery.js"></script>
  <script src="./layer/layer.js"></script>
  <script src="./js/banner.js"></script>
  <script language="JavaScript">
    window.onload=function(){
      var obj=document.getElementById('choose_home');
      obj.onclick=function(){
        window.location.href="home_initial.jsp";
      }
      var obj=document.getElementById('choose_tool');
      obj.onclick=function(){
        window.location.href="Tools_initial.jsp";
      }
      var obj=document.getElementById('choose_meme');
      obj.onclick=function(){
        window.location.href="MEME.jsp";
      }
      var obj=document.getElementById('choose_work');
      obj.onclick=function(){
        window.location.href="WorkFlow.jsp";
      }
      var obj=document.getElementById('choose_help');
      obj.onclick=function(){
        window.location.href="ContactUs.jsp";
      }
//      var obj=document.getElementById('choose_manual');
//      obj.onclick=function(){
//        window.location.href="generic/web/viewer.html?file=450k.pdf";
//      }
      document.getElementById("login_user_pass").value="Please input your password";
      document.getElementById("login_user_pass").type="text";
      document.getElementById("register_pass").value="Please input your password";
      document.getElementById("register_pass").type="text";
      document.getElementById("register_pass_re").value="Please repeat your password";
      document.getElementById("register_pass_re").type="text";


      if('${Session}'=='Y')
      {
        document.getElementById("login_spanUpdate").style.display="block";
      }
      else{
        document.getElementById("login_spanUpdate").style.display="none";
      }
    }

    <%--document.getElementById("login_user_pass").value="Please input your password";--%>
    <%--document.getElementById("login_user_pass").type="text";--%>
    <%--document.getElementById("register_pass").value="Please input your password";--%>
    <%--document.getElementById("register_pass").type="text";--%>
    <%--document.getElementById("register_pass_re").value="Please repeat your password";--%>
    <%--document.getElementById("register_pass_re").type="text";--%>


    <%--//1 是未登录--%>
    <%--if('${login}'=='2'){--%>
    <%--document.getElementById("login_span").style.display="block";--%>
    <%--}--%>
    <%--else{--%>
    <%--document.getElementById("login_span").style.display="none";--%>
    <%--}--%>
    <%--}--%>

    function clickPrompt(){
      layer.prompt(function(val, index){
        layer.close(index);
      });
    }
    var country_arr = new Array("Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");
    function populateCountries(countryElementId) {
      // given the id of the <select> tag as function argument, it inserts <option> tags
      var countryElement = document.getElementById(countryElementId);
      countryElement.length = 0;
      countryElement.options[0] = new Option('Select Country', '-1');
      countryElement.selectedIndex = 0;
      for (var i = 0; i < country_arr.length; i++) {
        countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
      }

      // Assigned all countries. Now assign event listener for the states.

    }
  </script>
  <style type="text/css">
    body{
      font-family: Arial;
    }
    #back{
      width:100%;
      height:100%;
      background-color:#ebeaea;
    }
    #banner{
      height:200px;
      background: url("./img/back3new.png") no-repeat;
      background-size:cover;
      background-position:center;
      z-index:800;
    }
    #logo_span{
      width:268px;
      height:109px;
      float:left;
      margin-left:6%;
      margin-top:23px;
      background-image: url("./img/logonew1.png");
    }
    #list_choose{
      height:35px;
      margin-right:10%;
      padding-top: 55px;
      line-height: 35px;
      font-size:20px;
    }
    #choose_home{
      color:#57779e;
      border-radius: 5px;
      background-color:rgba(255,255,255,0.9);
      text-shadow:1px 2px 3px #bdbcbb;
      width:65px;
      padding-left:12px;
      height:35px;
      float:right;
      font-weight: 300;
    }
    #choose_help{
      color:#ffffff;
      background:none;
      padding-left:10px;
      width:90px;
      height:35px;
      float:right;
      font-weight: 200;
    }
    #choose_help:hover{
      color:#57779e;
      border-left:none;
      border-right:none;
      border-top:none;
      font-weight: 300;
    }
    #choose_work{
      color:#ffffff;
      background:none;
      padding-left:10px;
      width:120px;
      height:35px;
      float:right;
      font-weight: 200;
    }
    #choose_work:hover{
      color:#57779e;
      border-left:none;
      border-right:none;
      border-top:none;
      font-weight: 300;
    }
    #choose_meme{
      color:#ffffff;
      background:none;
      padding-left:10px;
      width:200px;
      height:35px;
      float:right;
      font-weight: 200;
    }
    #choose_meme:hover{
      color:#57779e;
      border-left:none;
      border-right:none;
      border-top:none;
      font-weight: 300;
    }
    #choose_tool{
      color:#ffffff;
      background:none;
      width:60px;
      padding-left:12px;
      height:35px;
      float:right;
      font-weight: 300;
    }
    #choose_tool:hover{
      color:#57779e;
      border-left:none;
      border-right:none;
      border-top:none;
      border-radius: 5px;
      font-weight: 500;
    }
    #side_center{
      width:80%;
      height:70%;
      margin:0 auto;
      margin-top:-20px;
      box-shadow:5px 5px 20px #999999;
      -moz-box-shadow:5px 5px 20px #999999;
      -webkit-box-shadow:5px 5px 20px #999999;
      background-size: 100%;
      z-index:990;
      background-color: #ffffff;
      overflow-y:scroll;
    }
    ul{
      padding-right:10px;
    }
    #center_2{
      padding-top:10px;
      padding-left:10px;
      margin-left:40px;
      width:90%;
      color:#666666;
    }
    body table{
      border-collapse: collapse;
      color:#666666;
      width:100%;
    }
    th{
      border:1px dashed #cccccc;
      text-align:center;
      line-height:30px;
      width:auto;
      height:30px;
    }
    td{
      border:1px dashed #cccccc;
      text-align:center;
      line-height:30px;
    }
    #tip1{
      width:100%;
      height:40px;
      font-size:15px;
      background-color: #57779e;
      color:#ffffff;
      padding-left: 10px;
      padding-top:10px;
      margin:0 auto;
      margin-bottom:10px;
      border-radius: 5px;
    }
  </style>
</head>
<body>
<%
  //获取令牌类实例
  TokenProcessor processor = TokenProcessor.getInstance();
  //获取令牌值
  String token = processor.getToken(request);
%>
<input type="hidden" name="org.sunxin.token" value="<%=token%>"/>
<div id="back">
  <div id="banner">
    <div id="logo_span"></div>
    <div id="list_choose">
      <div  id="choose_help">About Us</div>
      <div  id="choose_meme">Downstream Analysis</div>
      <div  id="choose_tool">Tools</div>
      <div  id="choose_work">Work Flow</div>
      <div  id="choose_home">Home</div>
    </div>
  </div>
  <div id="side_center">
    <div id="center_2">
      <div id="tip1">The recent jobs you have run from this web browser in three days are available below, and the results can be downloaded by clicking "Download result".
        You'd better download the file in time,and we will clean up the running files in 3 days.</div>
      <table>
        <thead>
        <tr>
          <th>Job Id</th>
          <th>Start time</th>
          <th>Tool</th>
          <th>Files</th>

          <th></th>
        </tr>
        </thead>
        <tbody id='tbody'>
        </tbody>
      </table>

    </div>

  </div>
</div>
</body>
<script language="JavaScript">
  function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式
    var  aDate,  oDate1,  oDate2,  iDays
    aDate  =  sDate1.split("-")
    oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2002格式
    aDate  =  sDate2.split("-")
    oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])
    iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数
    return  iDays
  }
  function DownloadFile(Job){

    window.location.href="fileLoad?fileName="+Job+".zip";
  }

  /*
   //读取XML
   if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
   xmlhttp=new XMLHttpRequest();
   }
   else{// code for IE6, IE5
   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
   }
   xmlhttp.open("GET","RecentJobs.xml",false);
   xmlhttp.send();
   xmlDoc=xmlhttp.responseXML;
   //alert("我是一个弹出狂");
   */

  /*
   //法2（仍不支持火狐）
   loadXML = function(xmlFile){
   var xmlDoc=null;
   var agent = navigator.userAgent.toLowerCase();

   //判断浏览器的类型
   //支持IE浏览器
   if(agent.indexOf("msie") > 0){
   alert("22");
   var xmlDomVersions = ['MSXML.2.DOMDocument.6.0','MSXML.2.DOMDocument.3.0','Microsoft.XMLDOM'];
   for(var i=0;i<xmlDomVersions.length;i++){
   try{
   xmlDoc = new ActiveXObject(xmlDomVersions[i]);
   break;
   }catch(e){
   }
   }
   }
   //支持firefox浏览器
   else if(agent.indexOf("firefox") > 0){
   try{
   xmlDoc = document.implementation.createDocument('','',null);
   }catch(e){
   }
   } else{//谷歌浏览器
   alert("111111111");
   var oXmlHttp = new XMLHttpRequest() ;
   oXmlHttp.open( "GET", xmlFile, false ) ;
   oXmlHttp.send(null) ;
   return oXmlHttp.responseXML;
   }
   if(xmlDoc!=null){
   xmlDoc.async = false;
   xmlDoc.load(xmlFile);
   }
   return xmlDoc;
   }

   var xmlDoc = loadXML("RecentJobs.xml");
   */

  function loadxmlDoc(file){
    try{
      //IE
      xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
    }catch(e){
      ////Firefox, Mozilla, Opera, etc
      xmlDoc=document.implementation.createDocument("","",null);
    }

    try{
      xmlDoc.async=false;
      xmlDoc.load(file);//chrome没有load方法
    }catch(e){
      //针对Chrome,不过只能通过http访问,通过file协议访问会报错
      var xmlhttp = new window.XMLHttpRequest();
      xmlhttp.open("GET",file,false);
      xmlhttp.send(null);
      xmlDoc = xmlhttp.responseXML.documentElement;
    }
    return xmlDoc;
  }

  var xmlDoc=loadxmlDoc("RecentJobs.xml");

  var SessionTime="<%=session.getAttribute("time")%>";
  var nodeList=xmlDoc.getElementsByTagName("job");
  var Job=new Array();
  var tr=new Array();
  var id=new Array();
  var time=new Array();
  var tool=new Array();
  var file=new Array();

  var download=new Array();
  // alert(nodeList.length);
  for(var i=0;i<nodeList.length;i++){
//    alert(i);

    //if(DateDiff(SessionTime,xmlDoc.getElementsByTagName("time")[i].childNodes[0].nodeValue)<=3){
    //alert("wo jin ru le if");
    tr[i] = document.createElement('tr');
    id[i]= document.createElement('td');
    time[i] = document.createElement('td');
    tool[i] = document.createElement('td');
    file[i] = document.createElement('td');
    download[i] = document.createElement('td');
    Job[i]=xmlDoc.getElementsByTagName("JobId")[i].childNodes[0].nodeValue;
    var html="<input type=\"button\" value=\"Download result\" style=\"color:#ffffff;background-color:#57779e;border-radius:2px;border: 1px solid #57779e;\">";
    id[i].innerHTML = xmlDoc.getElementsByTagName("JobId")[i].childNodes[0].nodeValue;
    //alert(xmlDoc.getElementsByTagName("JobId")[i].childNodes[0].nodeValue);
    time[i].innerHTML = xmlDoc.getElementsByTagName("time")[i].childNodes[0].nodeValue;
    tool[i].innerHTML = xmlDoc.getElementsByTagName("tool")[i].childNodes[0].nodeValue;
    file[i].innerHTML = xmlDoc.getElementsByTagName("file")[i].childNodes[0].nodeValue;
    download[i].innerHTML = html;
    (function(i){
      download[i].onclick = function(){
        window.location.href="fileLoad?fileName="+Job[i]+".zip.tar";
      }
    })(i);

    tr[i].appendChild(id[i]);
    tr[i].appendChild(time[i]);
    tr[i].appendChild(tool[i]);
    tr[i].appendChild(file[i]);

    tr[i].appendChild(download[i]);

    var tbody = document.getElementById('tbody');
    tbody.appendChild(tr[i]);
    // }
  }
  xmlDoc.clear();
  xmlhttp.clear();
  xmlDoc.close();
  xmlhttp.close();
</script>
</html>