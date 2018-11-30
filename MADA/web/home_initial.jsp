<%@ page import="java.net.URLDecoder" %>
<%@ page import="mas.TokenProcessor" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/13 0013
  Time: 下午 08:20
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
  <script src="./jquery-1.11.1/jquery.js"></script>
  <script src="./layer/layer.js"></script>
  <script src="./js/banner.js"></script>



  <title></title>

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
      width:120px;
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
    #choose_manual{
      color:#ffffff;
      background:none;
      width:60px;
      padding-left:12px;
      height:35px;
      float:right;
      font-weight: 300;
    }
    #choose_manual:hover{
      color:#57779e;
      border-left:none;
      border-right:none;
      border-top:none;
      border-radius: 5px;
      font-weight: 500;
    }
    #side_center{
      width:80%;
      height:73%;
      margin:0 auto;
      margin-top:-20px;
      box-shadow:5px 5px 20px #999999;
      -moz-box-shadow:5px 5px 20px #999999;
      -webkit-box-shadow:5px 5px 20px #999999;
      background-size: 100%;
      z-index:990;
      background-image: url("./img/login_back.png");
    }
    #box_top{
        padding-top:20px;
        width:24%;
        height:50px;
        float:right;
        margin-right:3%;
      }
    #box_top_1{
      width:100%;
      height:50px;
      text-align: center;
      line-height:50px;
      font-weight:500;
      font-size:20px;
      color:#666666;
      background-color: rgba(255,255,255,0.8);
    }
    #box_down_1{
      width:24%;
      height:250px;
      float:right;
      margin-top:70px;
      margin-right: -24%;
      background-color:rgba(255,255,255,0.8);
    }
    #attention{
      padding-top:10px;
      color:#555555;
      font-size: 14px;
      width:24%;
      height:60px;
      float:right;
      margin-top:330px;
      margin-right: -24%;
      background-color:rgba(255,255,255,0.8);
    }
    ul{
      padding-right:10px;
    }
    #box_back{
      width:100%;
      height:100%;
      top:0px;
      left:0px;
      position:fixed;
      background-color:rgba(0,0,0,0.5);
    }
    #box_down_2_wrapper{
      width:420px;
      height:360px;
      position:absolute;
      top:50%;
      left:50%;
      margin:-180px 0 0 -200px;
      background-color:rgba(255,255,255,0.8);
    }
    #box_down_2{
      width:400px;
      height:340px;
      position:absolute;
      top:50%;
      left:50%;
      margin:-170px 0 0 -200px;
      background-color:#ffffff;
    }
    .btn_submit,.btn_cancel{
      line-height: 20px;
      border-radius: 5px;border: 1px solid #57779e;
      color:#ffffff;
      background-color:#57779e;
      height:25px; width:60px;
      margin-left:80px;
      margin-top:15px;
      margin-bottom:10px;
    }

    #introduction{
      position:absolute;
      margin-top:20px;
      margin-left:2%;
      float:left;
      width:76%;
      height:67%;
      background-color: rgba(255,255,255,0.85);
    }
    #abstract{
      padding-top: 30px;
      padding-left: 30px;
      padding-right:30px;
      color:#555555;
      font-size:18px;
      text-align:justify;
    }
    #reference{
      padding-top: 10px;
      padding-left: 30px;
      padding-right:30px;
      color:#555555;
      font-size:14px;
      text-align:justify;
    }
    .tip{
      width:15px;
      height:15px;
    }

    .tip_out{
      float:right;
      margin-left:5px;
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
    <input type="text" name="Session" style="display:none" value="<%=session.getAttribute("Session")%>">
    <div id="list_choose">
      <%--<div  id="choose_manual">Help</div>--%>
      <div  id="choose_help">Help/contact</div>
      <div  id="choose_meme">Downstream Analysis</div>
      <div  id="choose_tool">Tools</div>
      <div  id="choose_work">Work Flow</div>
      <div  id="choose_home">Home</div>
    </div>
  </div>
  <div id="side_center">
    <div id="introduction" >
      <div id="abstract">
        <span style="color:#57779e;font-size:28px">MADA</span>
        is developed for the whole process of methylation array data analysis, which covers nine prepropressing methods (BMIQ[1], PBC[2], SWAN[3], Funnorm[4], Illumina,Noob[5], SQN[6], Dasen[7] and Raw), batch effect correction method(ComBat[8]), seven differential methylation analysis tools(DMP:Limma[9], dmpFinder[10], samr[11]), (DMR: DMRcate[12], Bumphunter[13], ProbeLasso[14], Seqlm[15]) and three downstream analysis tools(GOSEQ[16], KEGG[17], and cluster analysis). In addition, MADA provides a customization function for users to define their own workflow. Moreover, the visualization of Preprocessing, DMP, DMR and downstream analysis results is also supplied in MADA.
      </div>
      <br>
      <br>
      <div id="reference">
        <span style="color:#666666;font-size:20px">Reference</span><br>
        [1]Teschendorff AE, Marabita F, et al.(2013).Bioinformatics. 29(2):189-96.<br>
        [2]Dedeurwaerder S, Defrance M, et al.(2011).Epigenomics. 3(6):771-84.<br>
        [3]Maksimovic J, Gordon L, et al. (2012).Genome Biology. 13(6):R44.<br>
        [4]Fortin J P, Labbe A, et al.(2014).Genome Biology. 15(11):503.<br/>
        [5]Triche T J, Weisenberger D J, et al.(2013)Nucleic Acids Research.41(7):e90-e90.<br>
        [6]Touleimat, N., & Tost, J. (2012). Epigenomics, 4(3), 325-341.<br>
        [7]Pidsley, R., Wong, C. C.,et al.(2013). BMC genomics, 14(1), 293.<br>
        [8]Johnson, W. Evan, Cheng Li, and Ariel Rabinovic. Biostatistics 8.1 : 118-127.<br>
        [9]Smyth G K, et al. (2005). Springer New York, 2005:397-420.<br>
        [10]Aryee, M. J., et al.(2014). Bioinformatics, 30(10), 1363-1369.<br>
        [11]Tusher V G, et al.(2001). Proceedings of the National Academy of Sciences,98(9): 5116-5121.<br>
        [12]Peters TJ, Buckley MJ,  et al.(2015). Epigenetics & Chromatin.8(1):1-16.<br>
        [13]Jaffe AE, et aL.(2012). Int J Epidemiol.41(1):200-209.<br>
        [14]Butcher LM, Beck S,et aL.(2015). Methods. 72:21-28.<br>
        [15]Kolde R,Märtens K, et al.(2016).Bioinformatics. 2(17):btw304.<br>
        [16]Young, M. D., Wakefield, M. J., et al.(2010).Genome biology, 11(2), R14.<br>
        [17]Phipson B, Maksimovic J,et aL.(2015). Bioinformatics. 32(2):286.<br>
        <li style="color:#57779e;margin-top:10px;" >Firefox and Chrome are recommended to get better interface display.</li>
      </div>
    </div>
    </div>
</div>

</body>
</html>