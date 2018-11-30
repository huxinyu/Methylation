<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2017/4/26
  Time: 21:18
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
  <link rel="stylesheet" href="./layer/skin/layer.css">
  <link rel="stylesheet" href="./layer/skin/layer.ext.css">
  <link rel="stylesheet" href="./css/MEME.css">
  <script src="./js/banner.js"></script>
  <script src="./jquery-1.11.1/jquery.js"></script>
  <script src="./layer/layer.js"></script>
  <script src="./js/MEME.js"></script>
  <script language="JavaScript">
    function fileChange(target,box){
      var filename;
      filename=target.files[0].value().substr(target.files[0].value().lastIndexOf('/')+1);
      alert(filename);
      var fileSize;
      var filemaxsize = 2048*1024;//1G

      fileSize = target.files[0].size;

      var size = fileSize / 1024;
      if(size>filemaxsize){
        alert("Upload files can not be larger than 2G!");
        document.getElementById(box).value="";
        target.value ="";
        return false;
      }
      if(size<=0){
        alert("Upload files can not be empty!");
        target.value ="";
        return false;
      }
      else{
        document.getElementById(box).value=filename;
        return true;
      }
    }
    function checkFileExt(filename,box){
      var flag; //状态
      var arr = ["bed","BED"];
      //取出上传文件的扩展名
      var index = filename.lastIndexOf(".");
      var ext = filename.substr(index+1);
      //循环比较
      if(document.getElementById(box).value=="" || document.getElementById(box).value==null){
        flag="empty";
      }
      else{
        for(var i=0;i<arr.length;i++) {
          if(ext == arr[i])
          {
            flag = "valid"; //一旦找到合适的，立即退出循环
            break;
          }
          else{
            flag="invalid";
          }
        }
      }

      //条件判断
      if(flag=="invalid")
      {
        alert("The file uploaded should be in .bed");
        document.getElementById(box).value="";
        return false;
      }
      else if(flag=="empty"){
        alert("The input cannot be empty!");
        document.getElementById(box).value="";
        return false;
      }
      else{
        return true;
      }
    }
  </script>
</head>
<body>
<%
  //获取令牌类实例
  TokenProcessor processor = TokenProcessor.getInstance();
  //获取令牌值
  String token = processor.getToken(request);
%>
<input type="hidden" name="org.sunxin.token" value="<%=token%>"/>
<div id="attention" class="blackdown_tips_1">
  The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
  <br>
</div>
<div class="link" onclick="JavaScript:nece_opt_show_GOMo_ne();"style="cursor:hand;">
  <div class="arrow-down" id="arrow-down3" style="display:block"></div>
  <div class="arrow-right" id="arrow-right3" style="display:none"></div>
  Necessary parameter</div>
  <div class="necessary_center" id="necessary_center_GOMo" style="display:block">
    <div class="blacktop_1">
      Input the peak/BED file
      <s:fielderror fieldName="input_anno_peak" cssStyle="color:#57779e;float:right;margin-top:0px;"  />
    </div>
    <div class="blackdown_1">
      <div class="file-box">
        <input type="text" name="input_anno_peak" value="H3K4me3.bed" class="input_text" id="input_anno_peak"/>
        <input type='button' class='btn' value='Choose File' />
        <input type="file"  name="Gomo_peak" class="fileField"  onchange="return(fileChange(this,'input_anno_peak')&& checkFileExt(this.value,'input_anno_peak'))" />
      </div>
    </div>
    <div class="blacktop_1">Select the appropriate genome</div>
    <div class="blackdown_1">
      <select name="anno_genome" id="anno_genome" class="GOMo_select" style="display:block">
        <option value="1" selected="selected">Human(hg19)</option>
        <option value="2">Mouse</option>
        <option value="3">Rat</option>
        <option value="4">Frog</option>
        <option value="5">Zebrafish</option>
      </select>
    </div>
  </div>

  <div class="link" onclick="JavaScript:nece_opt_show_GOMo_op();"style="cursor:hand;">
    <div class="arrow-down" id="arrow-down4" style="display:block"></div>
    <div class="arrow-right" id="arrow-right4" style="display:none"></div>
    Optional parameter</div>
  <div class="optional_center" id="optional_center_GOMo"style="display:block">
    <div class="blacktop_1">Optional parameter</div>
    <div class="blackdown_1">
      <input type="radio" name="GOMo_option"  id="GOMo_option_default" value="1" checked="true" onclick="document.getElementById('GOMo_option_input_setting').style.display='none';document.getElementById('GOMo_radio').style.visibility='hidden'";/>default
      <input type="radio" name="GOMo_option"  id="GOMo_option_setting" value="2"  onclick="document.getElementById('GOMo_option_input_setting').style.display='block'";/>set the parameters by yourself
      <div id="GOMo_radio" class="radio_text"></div>
    </div>
    <div class="inputOption_setting" id="GOMo_option_input_setting" style="display:none;">
      <div class="inputOption_setting_center"  style="overflow-y:scroll;">
        Genome size for genomeOntology analysis<br>
        <h6> -gsize;default: 2e9</h6>
        <input type="text" id="anno_gsize" name="anno_gsize" class="input_setting_text" value="2e9"/><br>
        Fragment length, default=auto, might want to set to 1 for 5'RNA<br>
        <h6>-len / -fragLength</h6>
        <input type="text" id="anno_len" name="anno_len" class="input_setting_text" value="auto" /><br>
        <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('GOMo_option_input_setting').style.display='none';"/>
        <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('GOMo_option_input_setting').style.display='none';"/>
      </div>
    </div>
  </div>

</body>
</html>
