<%@ page import="java.net.URLEncoder" %>
<%@ page import="mas.TokenProcessor" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/14 0014
  Time: 下午 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <METE NAME="renderer" CONTENT="webkit|ie-comp|ie-stand"/>
  <META HTTP-EQUIV="pragma" CONTENT="no-cache"/>
  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
  <META HTTP-EQUIV="expires" CONTENT="0"/>
  <title></title>
  <link rel="stylesheet" href="./css/banner.css">
  <script src="./js/banner.js"></script>
  <script language="JavaScript">
    window.onload=function(){
      var obj=document.getElementById('choose_home');
      var login=<%=session.getAttribute("login")%>;
      if(login=='2'){
        obj.onclick = function () {
          window.location.href = "home.jsp";
        }
      }
      else{
        obj.onclick = function () {
          window.location.href = "home_initial.jsp";
        }
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
      //1 是未登录
      if(login=='2'){
        document.getElementById("login_span").style.display="block";
      }
      else{
        document.getElementById("login_span").style.display="none";
      }

      if('${Session}'=='Y')
      {
        document.getElementById("login_spanUpdate").style.display="block";
      }
      else{
        document.getElementById("login_spanUpdate").style.display="none";
      }
    }
    function mousemove(div) {
      for (var i = 1; i <= 2; i++) {
        document.getElementById('box_top_'+i).style.backgroundColor='rgba(255,255,255,0)';
        document.getElementById('box_top_'+i).style.color='#666666';
        document.getElementById('box_down_'+i).style.display='none';
      }
      document.getElementById('box_top_'+div).style.backgroundColor='rgba(255,255,255,0.8)';
      document.getElementById('box_top_'+div).style.color='#666666';
      document.getElementById('box_down_'+div).style.display='block';
    }
    function mouseOver(){
      document.getElementById("login_menu").style.display="block";
    }
    function mouseOut(){
      document.getElementById("login_menu").style.display="none";
    }
    function recentShow(){
      window.location.href = "RecentJob.jsp";
    }
  </script>
  <style type="text/css">
    code{
      padding:0 3px;
      background-color:#f2f8fc;
      border:solid 1px #dbe7f3;
    }
    body{
      font-family: Arial;
    }
    #back{
      width:100%;
      height:310%;
      background-color:#ebeaea;
    }
    #banner{
      height:190px;
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
    #choose_help{
      color:#57779e;
      border-radius: 5px;
      background-color:rgba(255,255,255,0.9);
      text-shadow:1px 2px 3px #bdbcbb;
      width:120px;
      padding-left:12px;
      height:35px;
      float:right;
      font-weight: 300;
    }
    #choose_home{
      color:#ffffff;
      background:none;
      padding-left:10px;
      width:90px;
      height:35px;
      float:right;
      font-weight: 200;
    }
    #choose_home:hover{
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
      height:90%;
      margin:0 auto;
      margin-top:-20px;
      box-shadow:5px 5px 20px #999999;
      -moz-box-shadow:5px 5px 20px #999999;
      -webkit-box-shadow:5px 5px 20px #999999;
      background-size: 100%;
      z-index:990;
      background-color: #ffffff;
    }
    #center_1,#center_3,#center_help_1{
      font-size:25px;
      color:#57779e;
      padding-top:25px;
      margin-left:40px;
      margin-bottom: 10px;
    }
    #center_2,#center_4,#center_help_2{
      padding-top:10px;
      padding-left:10px;
      margin-left:40px;
      width:90%;
      border:1px dashed #cccccc;
      color:#666666;
    }
    #login_spanUpdate{
      width:110px;
      height:30px;
      text-align: center;
      line-height: 30px;
      top:20px;
      right:30px;
      color:#ffffff;
      position:absolute;
    }
    #login_spanUpdate:hover{
      width:110px;
      height:30px;
      top:20px;
      right:30px;
      text-align: center;
      line-height: 30px;
      border-radius: 5px;
      background-color:rgba(255,255,255,0.9);
      text-shadow:1px 2px 3px #bdbcbb;
      color:#57779e;
      position:absolute;
      font-weight: 200;
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
      <div  id="choose_help">Help/contact</div>
      <div  id="choose_meme">Downstream Analysis</div>
      <div  id="choose_tool">Tools</div>
      <div  id="choose_work">Work Flow</div>
      <div  id="choose_home">Home</div>
    </div>
    <div id="login_spanUpdate" style="display:none" onclick="recentShow();">Recent Jobs</div>
  </div>
  <div id="side_center">
    <div id="center_help_1">
      Help
    </div>
    <div id="center_help_2">
      <div  style="text-align:justify;padding-right: 10px"> MADA is developed for the whole process of methylation array data analysis, which covers preprocessing (loading data, quality control, filtering data, and normalization), batch effect correction, differential methylation probes analysis, differential methylation regions analysis, and downstream analysis. In addition, MADA provides a customization function for users to define their own workflows. Moreover, the visualization of preprocessing, batch effect correction, differential methylation analysis, gene ontology analysis, pathway analysis, and cluster analysis results are also supplied in MADA.<br><br>
      </div>
      <span style="color:#57779e"><strong>Data Preparation</strong></span><br>
      <div style="text-align:justify;padding-right: 10px">  When used the “WorkFlow” or “Tools” modules to analysis custom datasets process. We should hava all <strong>raw iDAT files</strong> and a <strong>sample sheet</strong> which described important sample information in detail. There must have four columns data named <code>Sample_Name</code>, <code>Sample_Group</code>, <code>Sentrix_ID</code>, and <code>Sentrix_Position</code> in SampleSheet.csv(Fig.1), otherwise data analysis cannot be carried out. Users can also add the column information such as age and sex to carry out the covariate analysis in the step of differential methylation probes analysis according to their own needs. To reduce the amount of data to send to the web server, all these files(Fig.2) should be compressed into zip format(Fig.3) and <strong>the folder names are the same before and after compression</strong> so that the files could fit the input criterion of “WorkFlow” or “Tools” modules.<br><br>
      </div>
      <div style="text-align:center;">
        <img src="./img/sample.png"><div style="text-align:center">Fig.1 SampleSheet.csv</div><br>
        <img src="./img/allfile.png"><div style="text-align:center">Fig.2 custom datasets——GSE100825_RAW</div><br>
        <img src="./img/zip.png"><div style="text-align:center">Fig.3 compressed custom datasets——GSE100825_RAW.zip</div><br>
      </div>
      <span style="color:#57779e"><strong>Work Flow</strong></span><br>
      <div  style="text-align:justify;padding-right: 10px"> On the page of “WorkFlow”, users can upload a .zip format file as input, which contains all raw iDAT files and a SampleSheet.csv, and then choose m-values M or beta-values B applied to the whole analysis. Then the corresponding parameters should be entered for data filtering and quality cintrol. The preprocessing box contained nine normalization methods integrated in MADA, here the default tool is Illumina, and the default parameters are used. The differential methylation analysis box contained seven tools to detect differentially methylated probes (DMPs) or regions (DMRs), Limma is the default tool. The last step, after clicking the “Execute” button, the workflow will start.<br><br>
      </div>
      <span style="color:#57779e"><strong>Preprocessing and Batch Effect Correction</strong></span><br>
      <div  style="text-align:justify;padding-right: 10px"> Preprocessing includes data loading, quality control, data filtering, and normalization, which is the most computationally intensive step in the overall data analysis process. Therefore, it is important to select the appropriate normalization method in this step. MADA integrates nine normalization tools, while each tool has its own advantages and disadvantages. Batch effect correction is performed by the method of combat, which is involved in the R package of sva.<br><br>
      </div>
      <span style="color:#57779e"><strong>Differential Methylation Analysis</strong></span><br>
      <div  style="text-align:justify;padding-right: 10px"> Differential methylation analysis has been on detecting differentially methylated probes (DMPs) or regions (DMRs) associated with a phenotype in the human genome, and seven popular methods are integrated. DNA methylation beta values or M values matrix file generated by preprocessing along with a SampleSheet file used as the input of differential methylation analysis.<br><br>
      </div>
      <span style="color:#57779e"><strong>Downstream analysis</strong></span><br>
      <div  style="text-align:justify;padding-right: 10px"> implemented three downstream analysis modules: GO analysis (goseq), Pathway analysis, and Cluster analysis (sample clustering and two-dimensional clustering).<br><br>
      </div>
    </div>

    <div id="center_1">
      Contact Us
    </div>
    <div id="center_2">
      <span style="color:#57779e">Address:</span>School of Information Science and Engineering，Central South University，Changsha,Hunan,China<br><br>
      <span style="color:#57779e">Post:</span>410083<br><br>
      <span style="color:#57779e">Phone:</span>+86-73188830212<br><br>
      <span style="color:#57779e">Fax:</span>+86-73188830212<br><br>
      <span style="color:#57779e">Contact:</span><br><br>
      <span style="color:#57779e">Min Li:</span>limin@mail.csu.edu.cn<br><br>
      <span style="color:#57779e">Xinyu Hu: </span>174611152@csu.edu.cn<br><br>
    </div>
    <div id="center_3">
      Collaboration
    </div>
    <div id="center_4">
      After the analysis process, you can download the result files on the "Recent Jobs" page. For your uploaded data, we will keep it in the server for three days and it will be deleted after the limit time.<br><br>
    </div>
  </div>
</div>
</body>
</html>