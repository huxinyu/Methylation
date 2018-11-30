<%@ page import="java.net.URLEncoder" %>
<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/9 0009
  Time: 下午 10:41
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
    <script src="./js/banner.js"></script>
    <script src="./jquery-1.11.1/jquery.js"></script>
    <script src="./layer/layer.js"></script>
  <script language="javascript">
      window.onload=function() {
          var obj1 = document.getElementById('choose_home');
          var obj2 = document.getElementById('choose_tool');
          var obj3 = document.getElementById('choose_meme');
          var obj4 = document.getElementById('choose_work');
          var obj5 = document.getElementById('choose_help');
          var msg = "If you leave this page, the operation will be stopped!";
          var x = document.getElementsByClassName("Upload_wait_div");
          var signal = "true";
          obj1.onclick = function () {
              for (var i = 0; i < x.length; i++) {
                  if (x[i].style.display == 'block') {
                      if (confirm(msg)) {
                          signal = "true";
                      }
                      else {
                          signal = "false";
                          break;
                      }
                  }
              }
              if (signal == "true") {
                  window.location.href = "home_initial.jsp";
              }
              else {
              }
          }

          obj2.onclick = function () {
              for (var i = 0; i < x.length; i++) {
                  if (x[i].style.display == 'block') {
                      if (confirm(msg)) {
                          signal = "true";
                      }
                      else {
                          signal = "false";
                          break;
                      }
                  }
              }
              if (signal == "true") {
                  window.location.href = "Tools_initial.jsp";
              }
              else {
              }
          }

          obj3.onclick = function () {
              for (var i = 0; i < x.length; i++) {
                  if (x[i].style.display == 'block') {
                      if (confirm(msg)) {
                          signal = "true";
                      }
                      else {
                          signal = "false";
                          break;
                      }
                  }
              }
              if (signal == "true") {
                  window.location.href = "MEME.jsp";
              }
              else {
              }
          }

          obj4.onclick = function () {
              for (var i = 0; i < x.length; i++) {
                  if (x[i].style.display == 'block') {
                      if (confirm(msg)) {
                          signal = "true";
                      }
                      else {
                          signal = "false";
                          break;
                      }
                  }
              }
              if (signal == "true") {
                  window.location.href = "WorkFlow.jsp";
              }
              else {
              }
          }

          obj5.onclick = function () {
              for (var i = 0; i < x.length; i++) {
                  if (x[i].style.display == 'block') {
                      if (confirm(msg)) {
                          signal = "true";
                      }
                      else {
                          signal = "false";
                          break;
                      }
                  }
              }
              if (signal == "true") {
                  window.location.href = "ContactUs.jsp";
              }
              else {
              }
          }
      }
      window.onload=function() {
          var id=parseInt('${flag}');
          var id_validate=parseInt('${flag_validate}');
          for(var i=1;i<=23;i++){
              document.getElementById("side_right_"+i).style.display="none";
              document.getElementById("side_son_"+i).style.backgroundColor="#dadada";
              document.getElementById("side_son_"+i).style.color="#555555";
              document.getElementById("detail_text_"+i).style.display="none";
          }
          document.getElementById("side_son_"+id).style.backgroundColor="#57779e";
          document.getElementById("side_son_"+id).style.color="#ffffff";
          document.getElementById("side_right_"+id).style.display="block";
          document.getElementById("detail_text_"+id).style.display="block";

          if(id_validate==2){
              for(var i=1;i<=23;i++){
                  document.getElementById("detail_text_"+i).style.display="none";
              }
          }

          if(id==8){
              for(var i=1;i<=4;i++){
                  var j=2*i-1;
                  var jj=j+1;
                  document.getElementById("side_"+i).style.display='none';
                  document.getElementById("arrow"+j).style.display='none';
                  document.getElementById("arrow"+jj).style.display='block';
              }
              document.getElementById("side_2").style.display='block';
              document.getElementById("arrow3").style.display='block';
              document.getElementById("arrow4").style.display='none';
          }
          if(id>8&&id<22){
              for(var i=1;i<=4;i++){
                  var j=2*i-1;
                  var jj=j+1;
                  document.getElementById("side_"+i).style.display='none';
                  document.getElementById("arrow"+j).style.display='none';
                  document.getElementById("arrow"+jj).style.display='block';
              }
              document.getElementById("side_3").style.display='block';
              document.getElementById("arrow5").style.display='block';
              document.getElementById("arrow6").style.display='none';
          }
          if(id==22||id==23){
              for(var i=1;i<=4;i++){
                  var j=2*i-1;
                  var jj=j+1;
                  document.getElementById("side_"+i).style.display='none';
                  document.getElementById("arrow"+j).style.display='none';
                  document.getElementById("arrow"+jj).style.display='block';
              }
              document.getElementById("side_4").style.display='block';
              document.getElementById("arrow7").style.display='block';
              document.getElementById("arrow8").style.display='none';
          }

          if('${Session}'=='Y')
          {
              document.getElementById("login_spanUpdate").style.display="block";
          }
          else{
              document.getElementById("login_spanUpdate").style.display="none";
          }
      }
      function fileChange(target,box){
          var filename;
          filename=target.files[0].name;
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
      function ValidateChar(s) {
          var valid=false;
          var pattern = new Array("~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")",";","\"", "'", "|", "\\", "<", ">", "?", "/", "<<", ">>","+");
          for (var i = 0; i < pattern.length; i++){
              if (s.indexOf(pattern[i]) >= 0){
                  valid=true;
                  break;
              }
              else{
                  valid=false;
              }
          }
          if(valid){
              return true;
          }
          else{
              return false;
          }
      }

      function searchData(id,btnbox,waitbox) {
          var flag = "valid";
          //    var pattern = new RegExp("[<>\"`~!@#$^&*()=|{}';'\\[\\]<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]") ;
          var frm = document.getElementById(id).getElementsByTagName("input");
          for (var i = 0; i < frm.length; i++) {
              if (frm[i].type == "text") {
                  if(frm[i].value=="" || frm[i].value==null){
                      flag="empty";
                      break;
                  }
                  else{
                      if (ValidateChar(frm[i].value)) {
                          flag = "invalid";
                          break;
                      }
                      else{
                          flag="valid";
                      }
                  }
              }
          }
          if (flag=="invalid") {
              alert("The input contains invalid character,please input again!");
              return false;
          }
          else if(flag=="empty"){
              alert("The input cannot be empty!");
              return false;
          }
          else {
              document.getElementById(btnbox).style.backgroundColor = '#666666';
              document.getElementById(waitbox).style.display = 'block';
              return true;
          }
      }

      function checkFileExt(filename,box) {
          var flag=null; //状态
          var arr =[".csv",".CSV","csv"];
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
          if(flag=="valid")
          {
              return true;
          }
          else if(flag=="empty"){
              alert("The input cannot be empty!");
              document.getElementById(box).value="";
              return false;
          }
          else{
              alert("The file uploaded should be in right format!");
              document.getElementById(box).value="";
              return false;
          }
      }


      var count=1;
      function Tip_click(TipId) {
          var id = "#tip" + TipId;
          if (TipId == 1||TipId ==3||TipId ==5||TipId ==7||TipId ==9||TipId ==11||TipId ==13) {
              if(count==1){
                  layer.tips('Please input .fasta format file.', id, {
                      tips: [1, '#57779e'],time:10000
                  }); count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==2||TipId ==4||TipId ==6||TipId ==8||TipId ==10||TipId ==12||TipId ==14){
              if(count==1) {
                  layer.tips('Please input .fastq format file.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==16||TipId==18||TipId==20||TipId==22||TipId==24||TipId==26||TipId==28||TipId==30||TipId==32||TipId==34||TipId==36||TipId==56){
              if(count==1) {
                  layer.tips('Control file should has the same format as chIP file.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==15){
              if(count==1) {
                  layer.tips('Please input .bed format file.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }

          }
          else if(TipId==17){
              if(count==1) {
                  layer.tips('Please input .bedGraph format file.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==19){
              if(count==1) {
                  layer.tips('Please input the file after being sorted.', id, {
                      tips: [1, '#57779e'],time:10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==21||TipId==23||TipId==25||TipId==27||TipId==29||TipId==31||TipId==35||TipId==37||TipId==38||TipId==39||TipId==40||TipId==41||TipId==42||TipId==43||TipId==44||TipId==45||TipId==46||TipId==47||TipId==48||TipId==49||TipId==50||TipId==51||TipId==52||TipId==55){
              if(count==1) {
                  layer.tips('The output file will be sent to this e-mail address.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==53){
              if(count==1) {
                  layer.tips('Please input indexed bam files separated by spaces', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
          else if(TipId==54){
              if(count==1) {
                  layer.tips('Limits the coverage analysis to the regions specified in these files.', id, {
                      tips: [1, '#57779e'], time: 10000
                  });
                  count++;
              }
              else{
                  layer.close(layer.index);
                  count--;
              }
          }
      }


      function side_right_show(divId,count){
     for(var i=1;i<=count;i++){
        document.getElementById("side_right_"+i).style.display="none";
        document.getElementById("side_son_"+i).style.backgroundColor="#dadada";
        document.getElementById("side_son_"+i).style.color="#555555";
  }
        document.getElementById("side_son_"+divId).style.backgroundColor="#57779e";
        document.getElementById("side_son_"+divId).style.color="#ffffff";
        document.getElementById("side_right_"+divId).style.display="block";
  }
  function side_mapping(divId,arrowId){
      var r=arrowId+1;
      for(var i=1;i<=4;i++){
          var j=2*i-1;
          var jj=j+1;
          document.getElementById("side_"+i).style.display='none';
          document.getElementById("arrow"+j).style.display='none';
          document.getElementById("arrow"+jj).style.display='block';
      }
      document.getElementById(divId).style.display='block';
      document.getElementById("arrow"+arrowId).style.display='block';
      document.getElementById("arrow"+r).style.display='none';
  }
  function nece_opt_show_BWA_ne(){
    if(document.getElementById("necessary_center_BWA").style.display=='block'){
      document.getElementById("necessary_center_BWA").style.display="none";
      document.getElementById("arrow-down3").style.display="none";
      document.getElementById("arrow-right3").style.display="block";
    }
    else{
      document.getElementById("necessary_center_BWA").style.display="block";
      document.getElementById("arrow-down3").style.display="block";
      document.getElementById("arrow-right3").style.display="none";
    }
  }
      function nece_opt_show_BWA_op(){
          if(document.getElementById("optional_center_BWA").style.display=='block'){
              document.getElementById("optional_center_BWA").style.display="none";
              document.getElementById("arrow-down4").style.display="none";
              document.getElementById("arrow-right4").style.display="block";
          }
          else{
              document.getElementById("optional_center_BWA").style.display="block";
              document.getElementById("arrow-down4").style.display="block";
              document.getElementById("arrow-right4").style.display="none";
          }
      }
      function nece_opt_show_SOAP_op(){
        if(document.getElementById("optional_center_SOAP").style.display=='block'){
          document.getElementById("optional_center_SOAP").style.display="none";
          document.getElementById("arrow-down31").style.display="none";
          document.getElementById("arrow-right31").style.display="block";
        }
        else{
          document.getElementById("optional_center_SOAP").style.display="block";
          document.getElementById("arrow-down31").style.display="block";
          document.getElementById("arrow-right31").style.display="none";
        }
      }
      function nece_opt_show_SOAP_ne(){
          if(document.getElementById("necessary_center_SOAP").style.display=='block'){
              document.getElementById("necessary_center_SOAP").style.display="none";
              document.getElementById("arrow-down30").style.display="none";
              document.getElementById("arrow-right30").style.display="block";
          }
          else{
              document.getElementById("necessary_center_SOAP").style.display="block";
              document.getElementById("arrow-down30").style.display="block";
              document.getElementById("arrow-right30").style.display="none";
          }
      }

  function nece_opt_show_Bowtie_ne(){
    if(document.getElementById("necessary_center_bowtie").style.display=='block'){
      document.getElementById("necessary_center_bowtie").style.display="none";
      document.getElementById("arrow-down14").style.display="none";
      document.getElementById("arrow-right14").style.display="block";
    }
    else{
      document.getElementById("necessary_center_bowtie").style.display="block";
      document.getElementById("arrow-down14").style.display="block";
      document.getElementById("arrow-right14").style.display="none";
    }
  }
      function nece_opt_show_Bowtie_op(){
        if(document.getElementById("optional_center_bowtie").style.display=='block'){
          document.getElementById("optional_center_bowtie").style.display="none";
          document.getElementById("arrow-down15").style.display="none";
          document.getElementById("arrow-right15").style.display="block";
        }
        else{
          document.getElementById("optional_center_bowtie").style.display="block";
          document.getElementById("arrow-down15").style.display="block";
          document.getElementById("arrow-right15").style.display="none";
        }
      }
      function nece_opt_show_blast_ne(){
          if(document.getElementById("necessary_center_blast").style.display=='block'){
              document.getElementById("necessary_center_blast").style.display="none";
              document.getElementById("arrow-down32").style.display="none";
              document.getElementById("arrow-right32").style.display="block";
          }
          else{
              document.getElementById("necessary_center_blast").style.display="block";
              document.getElementById("arrow-down32").style.display="block";
              document.getElementById("arrow-right32").style.display="none";
          }
      }
      function nece_opt_show_blast_op(){
          if(document.getElementById("optional_center_blast").style.display=='block'){
              document.getElementById("optional_center_blast").style.display="none";
              document.getElementById("arrow-down33").style.display="none";
              document.getElementById("arrow-right33").style.display="block";
          }
          else{
              document.getElementById("optional_center_blast").style.display="block";
              document.getElementById("arrow-down33").style.display="block";
              document.getElementById("arrow-right33").style.display="none";
          }
      }
      function nece_opt_show_Subread_ne(){
          if(document.getElementById("necessary_center_Subread").style.display=='block'){
              document.getElementById("necessary_center_Subread").style.display="none";
              document.getElementById("arrow-down34").style.display="none";
              document.getElementById("arrow-right34").style.display="block";
          }
          else{
              document.getElementById("necessary_center_Subread").style.display="block";
              document.getElementById("arrow-down34").style.display="block";
              document.getElementById("arrow-right34").style.display="none";
          }
      }
      function nece_opt_show_Subread_op(){
          if(document.getElementById("optional_center_Subread").style.display=='block'){
              document.getElementById("optional_center_Subread").style.display="none";
              document.getElementById("arrow-down35").style.display="none";
              document.getElementById("arrow-right35").style.display="block";
          }
          else{
              document.getElementById("optional_center_Subread").style.display="block";
              document.getElementById("arrow-down35").style.display="block";
              document.getElementById("arrow-right35").style.display="none";
          }
      }
      function nece_opt_show_NGM_ne(){
          if(document.getElementById("necessary_center_NGM").style.display=='block'){
              document.getElementById("necessary_center_NGM").style.display="none";
              document.getElementById("arrow-down36").style.display="none";
              document.getElementById("arrow-right36").style.display="block";
          }
          else{
              document.getElementById("necessary_center_NGM").style.display="block";
              document.getElementById("arrow-down36").style.display="block";
              document.getElementById("arrow-right36").style.display="none";
          }
      }
      function nece_opt_show_NGM_op(){
          if(document.getElementById("optional_center_NGM").style.display=='block'){
              document.getElementById("optional_center_NGM").style.display="none";
              document.getElementById("arrow-down37").style.display="none";
              document.getElementById("arrow-right37").style.display="block";
          }
          else{
              document.getElementById("optional_center_NGM").style.display="block";
              document.getElementById("arrow-down37").style.display="block";
              document.getElementById("arrow-right37").style.display="none";
          }
      }
  function macs_option_ne(){
    if(document.getElementById("necessary_center_macs").style.display=='block'){
      document.getElementById("necessary_center_macs").style.display="none";
      document.getElementById("arrow-down8").style.display="none";
      document.getElementById("arrow-right8").style.display="block";
    }
    else{
      document.getElementById("necessary_center_macs").style.display="block";
      document.getElementById("arrow-down8").style.display="block";
      document.getElementById("arrow-right8").style.display="none";
    }
  }
      function macs2_option_ne(){
          if(document.getElementById("necessary_center_macs2").style.display=='block'){
              document.getElementById("necessary_center_macs2").style.display="none";
              document.getElementById("arrow-down12").style.display="none";
              document.getElementById("arrow-right12").style.display="block";
          }
          else{
              document.getElementById("necessary_center_macs2").style.display="block";
              document.getElementById("arrow-down12").style.display="block";
              document.getElementById("arrow-right12").style.display="none";
          }
      }
      function macs_option_op(){
        if(document.getElementById("optional_center_macs").style.display=='block'){
          document.getElementById("optional_center_macs").style.display="none";
          document.getElementById("arrow-down9").style.display="none";
          document.getElementById("arrow-right9").style.display="block";
        }
        else{
          document.getElementById("optional_center_macs").style.display="block";
          document.getElementById("arrow-down9").style.display="block";
          document.getElementById("arrow-right9").style.display="none";
        }
      }
      function limma_option_ne(){
          if(document.getElementById("necessary_center_limma").style.display=='block'){
              document.getElementById("necessary_center_limma").style.display="none";
              document.getElementById("arrow-down44").style.display="none";
              document.getElementById("arrow-right44").style.display="block";
          }
          else{
              document.getElementById("necessary_center_limma").style.display="block";
              document.getElementById("arrow-down44").style.display="block";
              document.getElementById("arrow-right44").style.display="none";
          }
      }
      function limma_option_op(){
          if(document.getElementById("optional_center_limma").style.display=='block'){
              document.getElementById("optional_center_limma").style.display="none";
              document.getElementById("arrow-down45").style.display="none";
              document.getElementById("arrow-right45").style.display="block";
          }
          else{
              document.getElementById("optional_center_limma").style.display="block";
              document.getElementById("arrow-down45").style.display="block";
              document.getElementById("arrow-right45").style.display="none";
          }
      }
      function macs2_option_op(){
          if(document.getElementById("optional_center_macs2").style.display=='block'){
              document.getElementById("optional_center_macs2").style.display="none";
              document.getElementById("arrow-down13").style.display="none";
              document.getElementById("arrow-right13").style.display="block";
          }
          else{
              document.getElementById("optional_center_macs2").style.display="block";
              document.getElementById("arrow-down13").style.display="block";
              document.getElementById("arrow-right13").style.display="none";
          }
      }
  function nece_opt_show_ne(){
    if(document.getElementById("necessary_center_bowtie2").style.display=='block'){
      document.getElementById("necessary_center_bowtie2").style.display="none";
      document.getElementById("arrow-down1").style.display="none";
      document.getElementById("arrow-right1").style.display="block";
    }
    else{
      document.getElementById("necessary_center_bowtie2").style.display="block";
      document.getElementById("arrow-down1").style.display="block";
      document.getElementById("arrow-right1").style.display="none";
    }
  }
      function nece_opt_show_op(){
        if(document.getElementById("optioanl_center_bowtie2").style.display=='block'){
          document.getElementById("optioanl_center_bowtie2").style.display="none";
          document.getElementById("arrow-down2").style.display="none";
          document.getElementById("arrow-right2").style.display="block";
        }
        else{
          document.getElementById("optioanl_center_bowtie2").style.display="block";
          document.getElementById("arrow-down2").style.display="block";
          document.getElementById("arrow-right2").style.display="none";
        }
      }
  function peakseq_option_ne(){
    if(document.getElementById("necessary_center_peakseq").style.display=='block'){
      document.getElementById("necessary_center_peakseq").style.display="none";
      document.getElementById("arrow-down16").style.display="none";
      document.getElementById("arrow-right16").style.display="block";
    }
    else{
      document.getElementById("necessary_center_peakseq").style.display="block";
      document.getElementById("arrow-down16").style.display="block";
      document.getElementById("arrow-right16").style.display="none";
    }
  }
      function peakseq_option_op(){
          if(document.getElementById("optional_center_peakseq").style.display=='block'){
              document.getElementById("optional_center_peakseq").style.display="none";
              document.getElementById("arrow-down17").style.display="none";
              document.getElementById("arrow-right17").style.display="block";
          }
          else{
              document.getElementById("optional_center_peakseq").style.display="block";
              document.getElementById("arrow-down17").style.display="block";
              document.getElementById("arrow-right17").style.display="none";
          }
      }
  function peakranger_option_ne(){
    if(document.getElementById("necessary_center_peakranger").style.display=='block'){
      document.getElementById("necessary_center_peakranger").style.display="none";
      document.getElementById("arrow-down18").style.display="none";
      document.getElementById("arrow-right18").style.display="block";
    }
    else{
      document.getElementById("necessary_center_peakranger").style.display="block";
      document.getElementById("arrow-down18").style.display="block";
      document.getElementById("arrow-right18").style.display="none";
    }
  }
      function peakranger_option_op(){
          if(document.getElementById("optional_center_peakranger").style.display=='block'){
              document.getElementById("optional_center_peakranger").style.display="none";
              document.getElementById("arrow-down19").style.display="block";
              document.getElementById("arrow-right19").style.display="none";
          }
          else{
              document.getElementById("optional_center_peakranger").style.display="block";
              document.getElementById("arrow-down19").style.display="none";
              document.getElementById("arrow-right19").style.display="block";
          }
      }
  function sicer_option_ne(){
    if(document.getElementById("necessary_center_sicer").style.display=='block'){
      document.getElementById("necessary_center_sicer").style.display="none";
      document.getElementById("arrow-down10").style.display="none";
      document.getElementById("arrow-right10").style.display="block";
    }
    else{
      document.getElementById("necessary_center_sicer").style.display="block";
      document.getElementById("arrow-down10").style.display="block";
      document.getElementById("arrow-right10").style.display="none";
    }
  }
      function sicer_option_op(){
          if(document.getElementById("optional_center_sicer").style.display=='block'){
              document.getElementById("optional_center_sicer").style.display="none";
              document.getElementById("arrow-down11").style.display="block";
              document.getElementById("arrow-right11").style.display="none";
          }
          else{
              document.getElementById("optional_center_sicer").style.display="block";
              document.getElementById("arrow-down11").style.display="none";
              document.getElementById("arrow-right11").style.display="block";
          }
      }
  function samtools_option(divId){
      if(document.getElementById("samtools_center_"+divId).style.display=="none"){
          document.getElementById("samtools_center_"+divId).style.display="block";
          document.getElementById("arrow-down"+(divId+4)).style.display="block";
          document.getElementById("arrow-right"+(divId+4)).style.display="none";
          document.getElementById("samtools_Btn_"+divId).style.display="block";
      }
      else{
          document.getElementById("samtools_center_"+divId).style.display="none";
          document.getElementById("arrow-down"+(divId+4)).style.display="none";
          document.getElementById("arrow-right"+(divId+4)).style.display="block";
          document.getElementById("samtools_Btn_"+divId).style.display="none";
      }
  }
      function pepr_option_ne(){
          if(document.getElementById("necessary_center_pepr").style.display=='block'){
              document.getElementById("necessary_center_pepr").style.display="none";
              document.getElementById("arrow-down20").style.display="none";
              document.getElementById("arrow-right20").style.display="block";
          }
          else{
              document.getElementById("necessary_center_pepr").style.display="block";
              document.getElementById("arrow-down20").style.display="block";
              document.getElementById("arrow-right20").style.display="none";
          }
      }
      function pepr_option_op(){
          if(document.getElementById("optional_center_pepr").style.display=='block'){
              document.getElementById("optional_center_pepr").style.display="none";
              document.getElementById("arrow-down21").style.display="block";
              document.getElementById("arrow-right21").style.display="none";
          }
          else{
              document.getElementById("optional_center_pepr").style.display="block";
              document.getElementById("arrow-down21").style.display="none";
              document.getElementById("arrow-right21").style.display="block";
          }
      }
      function BCP_option_ne(){
          if(document.getElementById("necessary_center_BCP").style.display=='block'){
              document.getElementById("necessary_center_BCP").style.display="none";
              document.getElementById("arrow-down22").style.display="none";
              document.getElementById("arrow-right22").style.display="block";
          }
          else{
              document.getElementById("necessary_center_BCP").style.display="block";
              document.getElementById("arrow-down22").style.display="block";
              document.getElementById("arrow-right22").style.display="none";
          }
      }
      function BCP_option_op(){
          if(document.getElementById("optional_center_BCP").style.display=='block'){
              document.getElementById("optional_center_BCP").style.display="none";
              document.getElementById("arrow-down23").style.display="block";
              document.getElementById("arrow-right23").style.display="none";
          }
          else{
              document.getElementById("optional_center_BCP").style.display="block";
              document.getElementById("arrow-down23").style.display="none";
              document.getElementById("arrow-right23").style.display="block";
          }
      }
      function diff_option_ne(){
          if(document.getElementById("necessary_center_diff").style.display=='block'){
              document.getElementById("necessary_center_diff").style.display="none";
              document.getElementById("arrow-down24").style.display="none";
              document.getElementById("arrow-right24").style.display="block";
          }
          else{
              document.getElementById("necessary_center_diff").style.display="block";
              document.getElementById("arrow-down24").style.display="block";
              document.getElementById("arrow-right24").style.display="none";
          }
      }
      function diff_option_op(){
          if(document.getElementById("optional_center_diff").style.display=='block'){
              document.getElementById("optional_center_diff").style.display="none";
              document.getElementById("arrow-down25").style.display="block";
              document.getElementById("arrow-right25").style.display="none";
          }
          else{
              document.getElementById("optional_center_diff").style.display="block";
              document.getElementById("arrow-down25").style.display="none";
              document.getElementById("arrow-right25").style.display="block";
          }
      }
      function SISSR_option_ne(){
          if(document.getElementById("necessary_center_SISSR").style.display=='block'){
              document.getElementById("necessary_center_SISSR").style.display="none";
              document.getElementById("arrow-down26").style.display="none";
              document.getElementById("arrow-right26").style.display="block";
          }
          else{
              document.getElementById("necessary_center_SISSR").style.display="block";
              document.getElementById("arrow-down26").style.display="block";
              document.getElementById("arrow-right26").style.display="none";
          }
      }
      function SISSR_option_op(){
          if(document.getElementById("optional_center_SISSR").style.display=='block'){
              document.getElementById("optional_center_SISSR").style.display="none";
              document.getElementById("arrow-down27").style.display="block";
              document.getElementById("arrow-right27").style.display="none";
          }
          else{
              document.getElementById("optional_center_SISSR").style.display="block";
              document.getElementById("arrow-down27").style.display="none";
              document.getElementById("arrow-right27").style.display="block";
          }
      }
      function findpeak_option_ne(){
          if(document.getElementById("necessary_center_findpeaks").style.display=='block'){
              document.getElementById("necessary_center_findpeaks").style.display="none";
              document.getElementById("arrow-down28").style.display="none";
              document.getElementById("arrow-right28").style.display="block";
          }
          else{
              document.getElementById("necessary_center_findpeaks").style.display="block";
              document.getElementById("arrow-down28").style.display="block";
              document.getElementById("arrow-right28").style.display="none";
          }
      }
      function findpeak_option_op(){
          if(document.getElementById("optional_center_findpeaks").style.display=='block'){
              document.getElementById("optional_center_findpeaks").style.display="none";
              document.getElementById("arrow-down29").style.display="block";
              document.getElementById("arrow-right29").style.display="none";
          }
          else{
              document.getElementById("optional_center_findpeaks").style.display="block";
              document.getElementById("arrow-down29").style.display="none";
              document.getElementById("arrow-right29").style.display="block";
          }
      }
      function AREM_option_ne(){
          if(document.getElementById("necessary_center_AREM").style.display=='block'){
              document.getElementById("necessary_center_AREM").style.display="none";
              document.getElementById("arrow-down38").style.display="none";
              document.getElementById("arrow-right38").style.display="block";
          }
          else{
              document.getElementById("necessary_center_AREM").style.display="block";
              document.getElementById("arrow-down38").style.display="block";
              document.getElementById("arrow-right38").style.display="none";
          }
      }
      function AREM_option_op(){
          if(document.getElementById("optional_center_AREM").style.display=='block'){
              document.getElementById("optional_center_AREM").style.display="none";
              document.getElementById("arrow-down39").style.display="block";
              document.getElementById("arrow-right39").style.display="none";
          }
          else{
              document.getElementById("optional_center_AREM").style.display="block";
              document.getElementById("arrow-down39").style.display="none";
              document.getElementById("arrow-right39").style.display="block";
          }
      }
      function Fseq_option_ne(){
          if(document.getElementById("necessary_center_Fseq").style.display=='block'){
              document.getElementById("necessary_center_Fseq").style.display="none";
              document.getElementById("arrow-down40").style.display="none";
              document.getElementById("arrow-right40").style.display="block";
          }
          else{
              document.getElementById("necessary_center_Fseq").style.display="block";
              document.getElementById("arrow-down40").style.display="block";
              document.getElementById("arrow-right40").style.display="none";
          }
      }
      function Fseq_option_op(){
          if(document.getElementById("optional_center_Fseq").style.display=='block'){
              document.getElementById("optional_center_Fseq").style.display="none";
              document.getElementById("arrow-down41").style.display="block";
              document.getElementById("arrow-right41").style.display="none";
          }
          else{
              document.getElementById("optional_center_Fseq").style.display="block";
              document.getElementById("arrow-down41").style.display="none";
              document.getElementById("arrow-right41").style.display="block";
          }
      }
      function BroadPeak_option_ne(){
          if(document.getElementById("necessary_center_BroadPeak").style.display=='block'){
              document.getElementById("necessary_center_BroadPeak").style.display="none";
              document.getElementById("arrow-down42").style.display="none";
              document.getElementById("arrow-right42").style.display="block";
          }
          else{
              document.getElementById("necessary_center_BroadPeak").style.display="block";
              document.getElementById("arrow-down42").style.display="block";
              document.getElementById("arrow-right42").style.display="none";
          }
      }
      function BroadPeak_option_op(){
          if(document.getElementById("optional_center_BroadPeak").style.display=='block'){
              document.getElementById("optional_center_BroadPeak").style.display="none";
              document.getElementById("arrow-down43").style.display="block";
              document.getElementById("arrow-right43").style.display="none";
          }
          else{
              document.getElementById("optional_center_BroadPeak").style.display="block";
              document.getElementById("arrow-down43").style.display="none";
              document.getElementById("arrow-right43").style.display="block";
          }
      }

      function IGV_mapping(){
          if(document.getElementById("IGV_center_1").style.display=='block'){
              document.getElementById("IGV_center_1").style.display="none";
              document.getElementById("arrow-down44").style.display="none";
              document.getElementById("arrow-right44").style.display="block";
          }
          else{
              if(document.getElementById("IGV_center_2").style.display=='block'){
                  document.getElementById("IGV_center_2").style.display="none";
                  document.getElementById("arrow-down45").style.display="none";
                  document.getElementById("arrow-right45").style.display="block";
                  document.getElementById("IGV_center_1").style.display="block";
                  document.getElementById("arrow-down44").style.display="block";
                  document.getElementById("arrow-right44").style.display="none";
              }
              else{
                  document.getElementById("IGV_center_1").style.display="block";
                  document.getElementById("arrow-down44").style.display="block";
                  document.getElementById("arrow-right44").style.display="none";
              }
          }
      }
      function IGV_peakcalling(){
          if(document.getElementById("IGV_center_2").style.display=='block'){
              document.getElementById("IGV_center_2").style.display="none";
              document.getElementById("arrow-down45").style.display="none";
              document.getElementById("arrow-right45").style.display="block";
          }
          else{
              if(document.getElementById("IGV_center_1").style.display=='block'){
                  document.getElementById("IGV_center_1").style.display="none";
                  document.getElementById("arrow-down44").style.display="none";
                  document.getElementById("arrow-right44").style.display="block";
                  document.getElementById("IGV_center_2").style.display="block";
                  document.getElementById("arrow-down45").style.display="block";
                  document.getElementById("arrow-right45").style.display="none";
              }
              else{
                  document.getElementById("IGV_center_2").style.display="block";
                  document.getElementById("arrow-down45").style.display="block";
                  document.getElementById("arrow-right45").style.display="none";
              }
          }
      }
  function optional_radio_input(s,u,trim5,trim3){
    var div = document.getElementById("optional_radio_input");
    div.innerHTML="(-s "+s+" -u "+u+" -5 "+trim5+" -3 "+trim3+")";
    div.style.visibility="visible";
  }
      function SOAP_radio(SOAP_M,SOAP_l,SOAP_n,SOAP_r,SOAP_m,SOAP_x,SOAP_v,SOAP_s,SOAP_g,SOAP_e,SOAP_p){
          var div = document.getElementById("SOAP_radio");
          div.innerHTML="(-M "+SOAP_M+" -l "+SOAP_l+" -n "+SOAP_n+" -r "+SOAP_r+" -m "+SOAP_m+" -x "+SOAP_x+" -v "+SOAP_v+" -s "+SOAP_s+" -g "+SOAP_g+" -e "+SOAP_e+" -p "+SOAP_p+")";
          div.style.visibility="visible";
      }
      function Subread_index_radio(Subread_B,Subread_f,Subread_F,Subread_M){
          var div = document.getElementById("Subread_index_radio");
          div.innerHTML="(-B "+Subread_B+" -f "+Subread_f+" -F "+Subread_F+" -M "+Subread_M+")";
          div.style.visibility="visible";
      }
      function Subread_align_radio(Subread_B2,Subread_d,Subread_D,Subread_I,Subread_m,Subread_M,Subread_n,Subread_p,Subread_P,Subread_S,Subread_T,Subread_trim5,Subread_trim3){
          var div = document.getElementById("Subread_align_radio");
          div.innerHTML="(-B "+Subread_B2+" -d "+Subread_d+" -D "+Subread_D+" -I "+Subread_I+" -m "+Subread_m+" -M "+Subread_M+" -n "+Subread_n+" -p "+Subread_p+" -P "+Subread_P+" -S "+Subread_S+" -T "+Subread_T+" --trim5 "+Subread_trim5+" --trim3 "+Subread_trim3+")";
          div.style.visibility="visible";
      }
  function alignment_radio(alignment_N,alignment_L,alignment_i,alignment_n,alignment_dpad,alignment_gbar){
    var div = document.getElementById("alignment_radio");
    div.innerHTML="(-N "+alignment_N+" -L "+alignment_L+" -i "+alignment_i+" ---n-ceil "+alignment_n+" --dpad "+alignment_dpad+" --gbar "+alignment_gbar+")";
    div.style.visibility="visible";
  }
  function score_radio(score_ma,score_mp,score_np,score_rdg5,score_rdg3,score_rfg5,score_rfg3){
    var div = document.getElementById("score_radio");
    div.innerHTML="(--ma "+score_ma+" --mp "+score_mp+" --np "+score_np+" --rdg "+score_rdg5+" "+score_rdg3+" "+" --rfg "+score_rfg5+" "+score_rfg3+")";
    div.style.visibility="visible";
  }
  function ak_radio(ak_k){
    var div = document.getElementById("ak_radio");
    div.innerHTML="(-k "+ak_k+")";
    div.style.visibility="visible";
  }
  function analysisMode_radio(analysisMode_n,analysisMode_o,analysisMode_e,analysisMode_i,analysisMode_d,analysisMode_l,analysisMode_k,analysisMode_m,analysisMode_M,analysisMode_O,analysisMode_E,analysisMode_R,analysisMode_q,analysisMode_B,analysisMode_L)
  {
    var div = document.getElementById("analysisMode_radio");
    div.innerHTML="(-n "+analysisMode_n+" -o "+analysisMode_o+" -e "+analysisMode_e+" -i "+analysisMode_i+" -d "+analysisMode_d+" -l "+analysisMode_l+" -k "+analysisMode_k+" -m "+analysisMode_m+" -M "+analysisMode_M+" -O "+analysisMode_O+" -E "+analysisMode_E+" -R "+analysisMode_R+" -q "+analysisMode_q+" -B "+analysisMode_B+" -L "+analysisMode_L+")";
    div.style.visibility="visible";
  }
  function advancedPair_radio(advancedPair_a,advancedPair_o,advancedPair_n,advancedPair_N,advancedPair_c){
    var div = document.getElementById("advancedPair_radio");
    div.innerHTML="(-a "+advancedPair_a+" -o "+advancedPair_o+" -n "+advancedPair_n+" -N "+advancedPair_N+" -c "+advancedPair_c+")";
    div.style.visibility="visible";
  }
  function macs_radio(macs_g,macs_s,macs_bw,macs_p){
    var div = document.getElementById("macs_radio");
    div.innerHTML="(-g "+macs_g+" -s "+macs_s+" -bw "+macs_bw+" -p "+macs_p+")";
    div.style.visibility="visible";
  }
      function macs2_radio(macs2_g,macs2_s,macs2_bw,macs2_q,macs2_m){
          var div = document.getElementById("macs2_radio");
          div.innerHTML="(-g "+macs2_g+" -s "+macs2_s+" -bw "+macs2_bw+" -q "+macs2_q+" -m "+macs2_m+")";
          div.style.visibility="visible";
      }
  function sicer_radio(sicer_sp,sicer_RT,sicer_ws,sicer_fs,sicer_egf,sicer_gs,sicer_fdr){
    var div = document.getElementById("sicer_radio");
    div.innerHTML="("+sicer_sp+" "+sicer_RT+" "+sicer_ws+" "+sicer_fs+" "+sicer_egf+" "+sicer_gs+" "+sicer_fdr+")";
    div.style.visibility="visible";
  }
      function pepr_radio(pepr_peaktype,pepr_p,pepr_keep,pepr_num){
          var div = document.getElementById("pepr_radio");
          div.innerHTML="(--peaktype "+pepr_peaktype+" --threshold "+pepr_p+" --keep-max-dup "+pepr_keep+" --num-processors "+pepr_num+")";
          div.style.visibility="visible";
      }
      function BCP_radio_HM(BCP_f,BCP_W,BCP_p){
          var div = document.getElementById("BCP_radio");
          div.innerHTML="(-f "+BCP_f+" -w "+BCP_W+" -p "+BCP_p+")";
          div.style.visibility="visible";
      }
      function BCP_radio_TF(BCP_e,BCP_p2){
          var div = document.getElementById("BCP_radio");
          div.innerHTML="(-e "+BCP_e+" -p "+BCP_p2+")";
          div.style.visibility="visible";
      }
      function diff_radio(diff_mode,diff_w,diff_step,diff_gap,diff_nsd,diff_alpha,diff_bkg){
          var div = document.getElementById("diff_radio");
          div.innerHTML="(--mode "+diff_mode+" --window "+diff_w+" --step "+diff_step+" --gap "+diff_gap+" --nsd "+diff_nsd+" --alpha "+diff_alpha+" --bkg "+diff_bkg+")";
          div.style.visibility="visible";
      }
      function SISSR_radio(SISSR_D,SISSR_e,SISSR_p,SISSR_m,SISSR_w,SISSR_E,SISSR_L){
          var div = document.getElementById("SISSR_radio");
          div.innerHTML="(-D "+SISSR_D+" -e "+SISSR_e+" -p "+SISSR_p+" -m "+SISSR_m+" -w "+SISSR_w+" -E "+SISSR_E+" -L "+SISSR_L+")";
          div.style.visibility="visible";
      }
      function BroadPeak_radio(BroadPeak_b,BroadPeak_g){
          var div = document.getElementById("BroadPeak_radio");
          div.innerHTML="(-b "+BroadPeak_b+" -g "+BroadPeak_g+")";
          div.style.visibility="visible";
      }
      function Fseq_radio(Fseq_l,Fseq_s,Fseq_t,Fseq_v){
          var div = document.getElementById("Fseq_radio");
          var v;
          if(Fseq_v==1){
              v=" -v ";
          }
          else{
              v="";
          }
          div.innerHTML="(-l "+Fseq_l+" -s "+Fseq_s+" -t "+Fseq_t+v+")";
          div.style.visibility="visible";
      }
      function findpeak_radio(findpeak_dir,findpeak_type,findpeak_filter,findpeak_hs){
          var div = document.getElementById("findpeak_radio");
          var dir,filter;
          if(findpeak_dir==1){
              dir="-directional";
          }
          else{
              dir="";
          }
          if(findpeak_filter==1){
              filter="-filter";
          }
          else{
              filter="";
          }
          div.innerHTML="("+dir+" -dist_type "+findpeak_type+filter+" -hist_size "+findpeak_hs+")";
          div.style.visibility="visible";
      }
      function bowtie_index_radio(bowtie_nodc,bowtie_justref,bowtie_offrate,bowtie_t,bowtie_ns){
    var div = document.getElementById("bowtie_index_radio");
    var nodc,justref,ntoa;
    if(bowtie_nodc==1){
      nodc="";
    }
    else{
      nodc="--nodc"
    }
    if(bowtie_justref==1){
      justref="";
    }
    else{
      justref="--justref";
    }
    if(bowtie_ns==1){
      ntoa="";
    }
    else{
      ntoa="--ntoa";
    }
    div.innerHTML="("+nodc+" "+justref+" "+ntoa+" --offrate "+bowtie_offrate+" -t "+bowtie_t+")";
    div.style.visibility="visible";
  }
  function bowtie_mode_n_radio(bowtie_mode_n,bowtie_mode_l,bowtie_mode_e,bowtie_mode_max){
    var div = document.getElementById("bowtie_mode_n_radio");
    div.innerHTML="(-n "+bowtie_mode_n+" -l "+bowtie_mode_l+" -e "+bowtie_mode_e+" --maxbts "+bowtie_mode_max+")";
    div.style.visibility="visible";
  }
  function bowtie_mode_v_radio(bowtie_mode_v){
    var div = document.getElementById("bowtie_mode_v_radio");
    div.innerHTML="(-v "+bowtie_mode_v+")";
    div.style.visibility="visible";
  }
  function bowtie_input_radio(bowtie_s,bowtie_u,bowtie_5,bowtie_3){
    var div = document.getElementById("bowtie_input_radio");
    div.innerHTML="(-s "+bowtie_s+" -u "+bowtie_u+" -5 "+bowtie_5+" -3 "+bowtie_3+")";
    div.style.visibility="visible";
  }
  function bowtie_alignment_radio(bowtie_nomaqround,bowtie_I,bowtie_X){
    var div = document.getElementById("bowtie_alignment_radio");
    var noma;
    if(bowtie_nomaqround==1){
      noma="";
    }
    else{
      noma="--nomaqround";
    }

    div.innerHTML="(--nomaqround "+bowtie_nomaqround+" -I "+bowtie_I+" -X "+bowtie_X+")";
    div.style.visibility="visible";
  }
  function bowtie_report_radio(bowtie_k,bowtie_a){
    var div = document.getElementById("bowtie_report_radio");
    var a;
    if(bowtie_a==1){
      a="";
    }
    else{
      a="-a";
    }
    div.innerHTML="(-k "+bowtie_k+" "+a+")";
    div.style.visibility="visible";
  }
  function peakseq_radio(peakseq_length,peakseq_fdr,peakseq_N,peakseq_Min,peakseq_mode,peakseq_qvalue){
    var div = document.getElementById("peakseq_radio");
    var mode;
    if(peakseq_mode==1){
      mode="Poisson";
    }
    else{
      mode="Simulated";
    }
    div.innerHTML="(length "+peakseq_length+" FDR "+peakseq_fdr+" N_Simulations "+peakseq_N+" distance "+peakseq_Min+" mode "+mode+" Qvalue "+peakseq_qvalue+")";
    div.style.visibility="visible";
  }
      function expandPhoto(){
          var overlay=document.createElement("div");
          overlay.setAttribute("id","overlay");
          overlay.setAttribute("class","overlay");
          document.body.appendChild(overlay);

          var img=document.createElement("img");
          img.setAttribute("class","overlayimg");
          img.src="http://192.168.1.113:9080/ChIP-Seq_linux_war/img/mapping_visual.png";
          document.getElementById("overlay").appendChild(img);

          img.onclick=restore;
      }
      function expandPhoto1(){
          var overlay=document.createElement("div");
          overlay.setAttribute("id","overlay");
          overlay.setAttribute("class","overlay");
          document.body.appendChild(overlay);

          var img=document.createElement("img");
          img.setAttribute("class","overlayimg");
          img.src="http://192.168.1.113:9080/ChIP-Seq_linux_war/img/peakcalling_visual.png";
          document.getElementById("overlay").appendChild(img);
          img.onclick=restore;
      }
      function restore(){
          document.body.removeChild(document.getElementById("overlay"));
          document.body.removeChild(document.getElementById("img"));
      }

      function operation_detail(id){
          document.getElementById("detail_"+id).style.display="block";
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
      body{
          font-family: Arial;
      }
    #back{
      width:100%;
      height:1000px;
      background-color:#ebeaea;
    }
    #banner{
        height:200px;
        background: url("./img/back3new.png") no-repeat;
        background-size:cover;
        background-position:center;
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
          color:#ffffff;
          background:none;
          width:70px;
          padding-left:12px;
          height:35px;
          float:right;
          font-weight: 300;
      }
      #choose_home:hover{
          color:#57779e;
          border-left:none;
          border-right:none;
          border-top:none;
          border-radius: 5px;
          font-weight: 500;
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
      #choose_tool{
          color:#57779e;
          border-radius: 5px;
          background-color:rgba(255,255,255,0.9);
          text-shadow:1px 2px 3px #bdbcbb;
          padding-left:10px;
          width:60px;
          height:35px;
          float:right;
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
    #side_center{
      width:95%;
      margin:0 auto;
    }
    #left_side{
      width:25%;
      height:80%;
      float:left;
    }
    .side_radio{
      margin-top:63px;
      margin-left:10%;
      float:left;
      border-radius:50%;
      width:14px;
      height:14px;
      background-color: #57779e;
      border:3px solid #fbb24f;
    }
    .side_top{
      margin-top:50px;
      margin-left:10%;
      height:40px;
      line-height: 52px;
      padding-left:50px;
      color:#000000;
      font-weight: 300;
      border-top:none;
      border-left:none;
      border-right:none;
      border-bottom:2px solid #57779e;
    }
    .arrow1{
      float:left;
      margin-left: 15%;
        margin-right:5px;
      margin-top:10px;
      width:18px;
      height:18px;
      background-image: url("./img/arrow-down.png");
    }
    .arrow2{
      float:left;
      margin-left: 15%;
        margin-right:5px;
      margin-top:10px;
      width:18px;
      height:18px;
      background-image: url("./img/arrow-right.png");
    }
    .side_parent{
      margin-left:8px;
      height:40px;
      line-height: 40px;
      color: #57779e;
    }
    .side_son{
      margin-left:18%;
      padding-left:10px;
      height:40px;
      line-height: 40px;
      color: #555555;
      background-color:#e1dfdf;
    }
    .side_son:hover{
      margin-left:20%;
      height:40px;
      line-height: 40px;
      color: #555555;
      background-color: #bfbfbf;
      border-top:none;
      border-bottom: none;
      border-right:none;
      border-left:2px solid #57779e;
    }
    #side_right{
      margin-top:-20px;
      margin-left:25%;
      width:70%;
      height:800px;
      overflow-y:scroll;
      position:relative;
      background-color: #ffffff;
      z-index: 900;
      box-shadow:10px 5px 20px #999999;
      -moz-box-shadow:10px 5px 20px #999999;
      -webkit-box-shadow:10px 5px 20px #999999;
    }
    .arrow-down {
      width:0;
      height:0;
      float:left;
      border-left:6px solid transparent;
      border-right:6px solid transparent;
      border-top:6px solid #666666;
      margin-top:5px;
      margin-right:2px;
    }
    .arrow-right {
      width:0;
      height:0;
      float:left;
      border-top:6px solid transparent;
      border-bottom: 6px solid transparent;
      border-left: 6px solid #666666;
      margin-top:3px;
      margin-right:2px;
    }
    .link{
      width:100%;
      margin-left:-10px;
      font-size:17px;
      font-weight: bold;
      color:#666666;
      margin-bottom:10px;
      margin-top:10px;
    }
    .side_right{
      width:90%;
      height:auto;
      padding-top: 20px;
      padding-left: 40px;
      color: #ffffff;
    }
    .necessary_center,.optional_center{
      width:100%;
      height:auto;
      border:1px solid #666666;
    }
    #optional_center_bowtie{
        width:100%;
        height:150px;
        border:1px solid #666666;
    }
    .blacktop_1,#blacktop_20{
      width:95%;
      height:25px;
      line-height:25px;
      background-color: #999999;
      padding-left: 8px;
      color: #ffffff;
      margin:0 auto;
      margin-top: 10px;
    }
    .blackdown_1{
      width:95%;
      height:40px;
      line-height: 40px;
      background-color: #dadada;
      padding-left: 8px;
      padding-top: 8px;
      color: #333333;
      margin:0 auto;
    }
    #blackdown_20{
      width:95%;
      height:35px;
      line-height: 35px;
      background-color: #dadada;
      padding-left: 8px;
      color: #333333;
      margin:0 auto;
    }
    #blackdown_2_bowtie{
      width:95%;
      height:95px;
      background-color: #dadada;
      padding-left: 8px;
      padding-top: 8px;
      color: #333333;
      margin:0 auto;
    }
    .blackdown_2_bowtie2{
      width:95%;
      height:60px;
      background-color: #dadada;
      padding-left: 8px;
      padding-top: 8px;
      color: #333333;
      margin:0 auto;
    }
    .blackdown_2_bwa{
        width:95%;
        height:120px;
        background-color: #dadada;
        padding-left: 8px;
        padding-top: 8px;
        color: #333333;
        margin:0 auto;
    }
    .radio_text{
      font-size:12px;
      color:#ffffff;
      display:inline;
    }
    .inputOption_setting{
      width:480px;
      height:330px;
      position:fixed;
      top:40%;
      left:40%;
      background-color:rgba(177,201,233,0.5);
      padding-left:5px;
      padding-top:8px;
    }
    .inputOption_setting_center{
      width:96%;
      height:97%;
      overflow-y:scroll;
      padding-left:15px;
      padding-top:5px;
      background-color: #b1c9e9;
      font-size:14px;
      font-weight: 500;
      color:#464646;
    }
    .inputOption_setting_de{
        width:600px;
        height:300px;
        position:fixed;
        top:30%;
        left:30%;
        background-color:rgba(177,201,233,0.5);
        padding-left:8px;
        padding-top:8px;
        padding-bottom:8px;
    }
    .inputOption_setting_center_de{
        width:96%;
        height:97%;
        overflow-y:scroll;
        padding-left:15px;
        padding-top:5px;
        background-color: #b1c9e9;
        font-size:14px;
        font-weight: 500;
        color:#464646;
    }
    .btn_submit,.btn_cancel{
      line-height: 20px;
      border-radius: 5px;border: 1px solid #F9A32D;
      color:#ffffff;
      background-color:#F9A32D;
      height:25px; width:60px;
      margin-left:100px;
      margin-top:15px;
      margin-bottom:10px;
    }
    h1{
      font-size: 14px;
      color:#999999;
      margin-top:-30px;
      margin-left:350px;
    }
      h2{
          font-size:25px;
          font-weight: 400;
          margin-left:25px;
      }
    .GOMo_select{
      width:96%;
      margin:0 auto;
      height:23px;
      line-height: 23px;
      border-radius: 5px;
      border:1px solid #999999;
      margin-bottom:5px;
    }
    h6{
      font-size:12px;
      font-weight: 200;
      color:#666666;
      margin-top:5px;
      margin-bottom:5px;
    }
    .h7{
      font-size:12px;
      font-weight: 200;
      color:#CCCCCC;
      padding-left:10px;
    }
    .h8{
      font-size:12px;
      font-weight: 200;
      color:#999999;
      padding-left:10px;
    }
    .input_setting_text{
      width:96%;
      margin:0 auto;
      height:23px;
      line-height: 23px;
      border-radius: 5px;
      border:1px solid #999999;
      margin-bottom:5px;
      padding-left:5px;
    }
    img{
        padding:5px;
        width:600px;
        height:auto;
    }
    .outer{
        width:600px;
        height:100px;
        margin-left:10px;
    }
    .overlay{
        background-color:rgba(0,0,0,0.7);
        top:0;
        left:0;
        width:100%;
        height:100%;
        position:fixed;
        z-index:910;
    }
    .overlayimg{
        z-index:911;
        margin:0 auto;
        width:auto;
        position:fixed;
    }
    #foot{
        width:100%;
        height:80px;
        background-color:#666666;
        margin-top:-30px;
        color:#ffffff;
        padding-left:100px;
        padding-top:80px;
        z-index:6;
    }
    .tip{
        width:15px;
        height:15px;
    }
    .tip_out{
        float:right;
        margin-left:5px;
    }
    .detail_tip{
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
      .Upload_wait{
          width:30px;
          height:30px;
          margin-top:10px;
      }
      .Execute_btn{
          margin-bottom:10px;
          margin-top:10px;
          width:80px;
          height:30px;
          border: 0px ;
          background:#57779e;
          color: #ffffff;
          border-bottom-left-radius: 5px;
          border-bottom-right-radius: 5px;
          border-top-left-radius: 5px;
          border-top-right-radius: 5px;
          font-size: 15px;
      }
      .Execute_btn_samtools{
          margin-bottom:10px;
          margin-top:10px;
          margin-left:20px;
          width:80px;
          height:30px;
          border: 01px ;
          background:#57779e;
          color: #ffffff;
          border-bottom-left-radius: 5px;
          border-bottom-right-radius: 5px;
          border-top-left-radius: 5px;
          border-top-right-radius: 5px;
          font-size: 15px;
      }
      .Upload_wait_div{
          font-size: 15px;
          color:#666666;
          margin-top:-60px;
          margin-left:100px;
      }
      .citation{
          padding-top:10px;
          padding-left:10px;
          padding-bottom:10px;
          color:#666666;
          border:1px dashed #cccccc;
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
    .file-box{ position:relative;width:100%;}
    .btn{background-color:#57779e;height:28px; width:15%;color: #ffffff; border-radius: 10px;border: 1px solid #57779e;}
    .fileField{position:absolute; top:0; right:1px; height:28px; filter:alpha(opacity:0);opacity: 0;width:18%; }
    .input_text{ border:1px solid #999999;  width:80%;  height:28px;  color: #999999;  border-top-left-radius: 10px;  border-top-right-radius: 10px;  border-bottom-left-radius: 10px;  border-bottom-right-radius: 10px;  padding-left: 10px;}
    .input_text_pair{border:1px solid #999999; width:30%;  height:23px;  color: #999999;  border-top-left-radius: 10px;  border-top-right-radius: 10px;  border-bottom-left-radius: 10px;  border-bottom-right-radius: 10px;  padding-left: 8px;}
    .fileField_pair1{position:absolute; top:0; right:50%; height:28px; filter:alpha(opacity:0);opacity: 0;width:18%;}
    .fileField_pair2{position:absolute; top:0; right:10px; height:28px; filter:alpha(opacity:0);opacity: 0;width:18%;}
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
        <div  id="choose_help">About Us</div>
        <div  id="choose_meme">Downstream Analysis</div>
        <div  id="choose_tool">Tools</div>
        <div  id="choose_work">Work Flow</div>
        <div  id="choose_home">Home</div>
  </div>
      <div id="login_spanUpdate" style="display:none" onclick="recentShow()">Recent Jobs</div>
  </div>
    <div id="side_center">
        <div id="left_side">
            <div class="side_radio"></div>
            <div class="side_top"><h2>Tools</h2></div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_1',1); " style="cursor:hand;">
                <div class="arrow1" id="arrow1" style="display: block"></div>
                <div class="arrow2" id="arrow2" style="display:none"></div>
                Pre-processing
            </div>
            <div id="side_1" style="display: block">
                <div class="side_son" id="side_son_1" style="background-color: #57779e;color:#ffffff"
                     onclick="JavaScript:side_right_show(1,13)" ; style="cursor:hand;">BMIQ
                </div>
                <div class="side_son" id="side_son_2" onclick="JavaScript:side_right_show(2,13)">PBC</div>
                <div class="side_son" id="side_son_3" onclick="JavaScript:side_right_show(3,13)">SWAN</div>
                <div class="side_son" id="side_son_4" onclick="JavaScript:side_right_show(4,13)">Funnorm</div>
                <div class="side_son" id="side_son_5" onclick="JavaScript:side_right_show(5,13)">Illumina</div>
                <div class="side_son" id="side_son_6" onclick="JavaScript:side_right_show(6,13)">Noob</div>
                <div class="side_son" id="side_son_7" onclick="JavaScript:side_right_show(7,13)">SQN</div>
                <div class="side_son" id="side_son_8" onclick="JavaScript:side_right_show(8,13)">Raw</div>

            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_2',3);" style="cursor:hand;">
                <div class="arrow1" id="arrow3" style="display: none"></div>
                <div class="arrow2" id="arrow4" style="display:block"></div>
                DMP
            </div>
            <div id="side_2" style="display: none">
                <div class="side_son" id="side_son_9" onclick="JavaScript:side_right_show(9,13)">Limma</div>
            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_3',5);" style="cursor:hand;">
                <div class="arrow1" id="arrow5" style="display: none"></div>
                <div class="arrow2" id="arrow6" style="display:block"></div>
                DMR
            </div>
            <div id="side_3" style="display: none">
                <div class="side_son" id="side_son_10" onclick="JavaScript:side_right_show(10,13)">DMRcate</div>
                <div class="side_son" id="side_son_11" onclick="JavaScript:side_right_show(11,13)">Bumphunter</div>
                <div class="side_son" id="side_son_12" onclick="JavaScript:side_right_show(12,13)">ProbeLasso</div>
                <div class="side_son" id="side_son_13" onclick="JavaScript:side_right_show(13,13)">seqlm</div>

                <!--
                  <div class="side_son" id="side_son_13" onclick="JavaScript:side_right_show(13,23)">SICER</div>
                  <div class="side_son" id="side_son_14" onclick="JavaScript:side_right_show(14,23)">PePr</div>
                  <div class="side_son" id="side_son_15" onclick="JavaScript:side_right_show(15,23)">BCP</div>
                  <div class="side_son" id="side_son_16" onclick="JavaScript:side_right_show(16,23)">diffReps</div>
                  <div class="side_son" id="side_son_17" onclick="JavaScript:side_right_show(17,23)">SISSRs</div>
                  <div class="side_son" id="side_son_18" onclick="JavaScript:side_right_show(18,23)">FindPeaks</div>
                  <div class="side_son" id="side_son_19" onclick="JavaScript:side_right_show(19,23)">AREM</div>
                  <div class="side_son" id="side_son_20" onclick="JavaScript:side_right_show(20,23)">Fseq</div>
                  <div class="side_son" id="side_son_21" onclick="JavaScript:side_right_show(21,23)">BroadPeak</div>
                  -->

            </div>
            <%--
            <div class="side_parent" onclick="JavaScript:side_mapping('side_4',7);" style="cursor:hand;">
                <div class="arrow1" id="arrow7" style="display:none"></div>
                <div class="arrow2" id="arrow8" style="display:block"></div>
                Format Convert
            </div>
            <div id="side_4" style="display:none">
                <div class="side_son" id="side_son_22" onclick="JavaScript:side_right_show(22,23)">Samtools</div>
                <div class="side_son" id="side_son_23" onclick="JavaScript:side_right_show(23,23)">bamCoverage</div>
            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_4',7); " style="cursor:hand;">
                <div class="arrow1" id="arrow7" style="display: none"></div>
                <div class="arrow2" id="arrow8" style="display:block"></div>
                Visualization</div>
            <div id="side_4" style="display:none">
                <div class="side_son" id="side_son_22" onclick="JavaScript:side_right_show(22,22)">IGV</div>
            </div>--%>
        </div>
        <div id="side_right">
            <!--------------------------------BMIQ-------------------------------------------------------------->
            <div id="side_right_1" class="side_right" style="display:block">
                <div class="link" onclick="JavaScript:nece_opt_show_BMIQ_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down3" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right3" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Load_first1" enctype="multipart/form-data" method="post"
                        onsubmit="document.getElementById('btn_BMIQ').style.backgroundColor='#666666';document.getElementById('wait_BMIQ').style.display='block';">
                    <div id="necessary_center_BMIQ" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1">
                            Please input the raw files<div class="tip_out"><img class="tip" id="tip00" src="./img/tip.png" onclick="JavaScript:Tip_click(17)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_BMIQ_file" id="input_BMIQ_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_bmiq" class="fileField" id="fileField_bmiq_idat" onchange="return (fileChange(this,'input_BMIQ_file' )&& checkFileExt(this.value,'input_BMIQ_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_BMIQ_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down4" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right4" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_BMIQ" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_Load" id="optionalParameters_default_Load" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('champload_op').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_Load" id="optionalParameters_set_Load" class="optionalParameters_set" value="2" onclick="document.getElementById('champload_op').style.display='block'"/>set the parameters by yourself
                            <div id="BMIQ_radio" class="radio_text"></div>
                        </div>
                        <div id="champload_op" class="inputOption_setting" style="display:none;">
                            <div id="advancedPair_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">False
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>

                                filterDetP&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="FALSE">False
                                </label>
                                <h6>If filter = TRUE, then probes above the detPcut will befiltered out.(default = TRUE)</h6>

                                ProbeCutoff
                                <input type="text" class="input_setting_text" name="ProbeCutoff" value="0"/><br>
                                <h6>The NA ratio threshhold for probes. Probes with above proportion of NA will be removed.</h6>

                                SampleCutoff
                                <input type="text" class="input_setting_text" name="SampleCutoff" value="0.1"/><br>
                                <h6>The failed p value (or NA) threshhold for samples.Samples with above proportion of failed p value (NA) will be removed.</h6>

                                detPcut
                                <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                                <h6>The detection p-value threshhold. Probes about this cutoff will be filtered out.default=0.01</h6>

                                filterBeads&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="FALSE">F
                                </label><br>
                                <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                    depending on the beadCutoff value. default=TRUE.</h6>

                                beadCutoff
                                <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                    less than 3 before the probe is removed.default=0.05</h6>
                                <input type="text" class="input_setting_text" name="beadCutoff"
                                       value="0.05"/><br>

                                filterNoCG&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="FALSE">F
                                </label><br>
                                <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>

                                filterSNPs&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="FALSE">F
                                </label><br>
                                <h6>If filterSNPs=TRUE,probes in which the probed CpG falls near a SNP as
                                    defined in Nordlund et al are removed.default=TRUE.</h6>

                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>

                                filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="FALSE">F
                                </label>
                                <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                    removed.default=TRUE.</h6>

                                <!--champ.norm()可选参数-->
                                plotBMIQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plotBMIQ" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plotBMIQ" value="TRUE">T
                                </label>
                                <h6>should the normalized plot in PDF and save it in resultsDir.default=FALSE.</h6>
                                cores
                                <input type="text" class="input_setting_text" name="cores" value="3"/><br>
                                <h6>how many cores shall be used to run parallel.default=3</h6>

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('champload_op').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('champload_op').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>


                    <input type="submit" value="Execute" class="Execute_btn" id="btn_BMIQ"/><s:fielderror fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"  />
                    <div id="wait_BMIQ" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait" />
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_1" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(1);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_1" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_1').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div id="citation_bwa" class="citation">
                    Teschendorff AE, Marabita F, Lechner M, Bartlett T, Tegner J,
                    Gomez-Cabrero D, Beck S. A beta-mixture quantile normalization
                    method for correcting probe design bias in Illumina Infinium 450k
                    DNA methylation data. Bioinformatics. 2013 Jan 15;29(2):189-96.
                </div>
            </div>

            <!--------------------------------PBC-------------------------------------------------------------->
            <div id="side_right_2" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_PBC_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down14" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right14" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="PBC" enctype="multipart/form-data" method="post"
                        onsubmit="document.getElementById('btn_PBC').style.backgroundColor='#666666';document.getElementById('wait_PBC').style.display='block';">
                    <div id="necessary_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="PBC_test">Please input the raw files<div class="tip_out"><img class="tip" id="tip001" src="./img/tip.png" onclick="JavaScript:Tip_click(17)"></div></div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_PBC_file" id="input_PBC_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_pbc" class="fileField" id="fileField_pbc_idat" onchange="return (fileChange(this,'input_PBC_file' )&& checkFileExt(this.value,'input_PBC_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down15" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right15" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_PBC" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_PBC" id="optionalParameters_default_PBC" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('pbc_op').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_PBC" id="optionalParameters_set_PBC" class="optionalParameters_set" value="2" onclick="document.getElementById('pbc_op').style.display='block'"/>set the parameters by yourself
                            <div id="PBC_radio" class="radio_text"></div>
                        </div>
                        <div id="pbc_op" class="inputOption_setting" style="display:none;">
                            <div class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">False
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>

                                filterDetP&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="FALSE">False
                                </label>
                                <h6>If filter = TRUE, then probes above the detPcut will befiltered out.(default = TRUE)</h6>

                                ProbeCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="ProbeCutoff" value="0"/><br>
                                <h6>The NA ratio threshhold for probes. Probes with above proportion of NA will be removed.</h6>

                                SampleCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="SampleCutoff" value="0.1"/><br>
                                <h6>The failed p value (or NA) threshhold for samples.Samples with above proportion of failed p value (NA) will be removed.</h6>

                                detPcut&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>The detection p-value threshhold. Probes about this cutoff will be filtered
                                    out.default=0.01</h6>
                                <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>

                                filterBeads&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="FALSE">F
                                </label><br>
                                <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                    depending on the beadCutoff value. default=TRUE.</h6>

                                beadCutoff&nbsp;&nbsp;
                                <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                    less than 3 before the probe is removed.default=0.05</h6>
                                <input type="text" class="input_setting_text" name="beadCutoff"
                                       value="0.05"/><br>

                                filterNoCG&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="FALSE">F
                                </label><br>
                                <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>

                                filterSNPs&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="FALSE">F
                                </label><br>
                                <h6>If filterSNPs=TRUE,probes in which the probed CpG falls near a SNP as
                                    defined in Nordlund et al are removed.default=TRUE.</h6>

                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>

                                filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="FALSE">F
                                </label>
                                <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                    removed.default=TRUE.</h6>

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('pbc_op').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('pbc_op').style.display='none';"/>

                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>


                    <input type="submit" value="Execute" class="Execute_btn" id="btn_pbc"/><s:fielderror fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"  />
                    <div id="wait_pbc" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait" />
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_2" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(2);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_2" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div id="citation_bwa" class="citation">
                    Dedeurwaerder S, Defrance M, Calonne E, Denis H, Sotiriou C, Fuks
                    F.Evaluation of the Infinium Methylation 450K technology.
                    Epigenomics. 2011,Dec;3(6):771-84.
                </div>
            </div>

            <!------------------------SWAN-------------------------------------------------------------->
            <div id="side_right_3" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down1" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right1" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="SWAN" id="SWAN_exe" enctype="multipart/form-data" method="post"
                        onsubmit="document.getElementById('btn_SWAN').style.backgroundColor='#666666';document.getElementById('wait_SWAN').style.display='block';">
                    <%--onsubmit="return searchData('SWAN_exe','btn_SWAN','wait_SWAN');">--%>
                    <div id="necessary_center_SWAN" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="SWAN_test">Please input the raw files
                            <div class="tip_out"><img class="tip" id="tip002" src="./img/tip.png" onclick="JavaScript:Tip_click(17)"></div>
                        </div>

                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_SWAN_file" id="input_SWAN_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_swan" class="fileField" id="fileField_swan_idat" onchange="return (fileChange(this,'input_SWAN_file' )&& checkFileExt(this.value,'input_SWAN_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right2" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down2" style="display:block"></div>
                        Optional parameter
                    </div>
                    <div id="optioanl_center_SWAN" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_SWAN" id="optionalParameters_default_SWAN" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('champswan_op').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_SWAN" id="optionalParameters_set_SWAN" class="optionalParameters_set" value="2" onclick="document.getElementById('champswan_op').style.display='block'"/>set the parameters by yourself
                            <div id="SWAN_radio" class="radio_text"></div>
                        </div>
                        <div id="champswan_op" class="inputOption_setting" style="display:none;">
                            <div class="inputOption_setting_center"style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">False
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>

                                filterDetP&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="FALSE">False
                                </label>
                                <h6>If filter = TRUE, then probes above the detPcut will befiltered out.(default = TRUE)</h6>

                                ProbeCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="ProbeCutoff" value="0"/><br>
                                <h6>The NA ratio threshhold for probes. Probes with above proportion of NA will be removed.</h6>

                                SampleCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="SampleCutoff" value="0.1"/><br>
                                <h6>The failed p value (or NA) threshhold for samples.Samples with above proportion of failed p value (NA) will be removed.</h6>

                                detPcut&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>The detection p-value threshhold. Probes about this cutoff will be filtered
                                    out.default=0.01</h6>
                                <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>

                                filterBeads&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="FALSE">F
                                </label><br>
                                <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                    depending on the beadCutoff value. default=TRUE.</h6>

                                beadCutoff&nbsp;&nbsp;
                                <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                    less than 3 before the probe is removed.default=0.05</h6>
                                <input type="text" class="input_setting_text" name="beadCutoff"
                                       value="0.05"/><br>

                                filterNoCG&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="FALSE">F
                                </label><br>
                                <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>

                                filterSNPs&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="FALSE">F
                                </label><br>
                                <h6>If filterSNPs=TRUE,probes in which the probed CpG falls near a SNP as
                                    defined in Nordlund et al are removed.default=TRUE.</h6>

                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>

                                filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="FALSE">F
                                </label>
                                <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                    removed.default=TRUE.</h6>
                                <!--
                                  filterDetP&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterDetP" value="TRUE" checked>True
                                  </label>
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterDetP" value="FALSE">False
                                  </label>
                                  <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>

                                  detSamplecut
                                  <h6>The detection p value threshhold for samples.Samples with above proportion
                                      of failed p value will be removed.default=0.1</h6>
                                  <input type="text" class="input_setting_text" name="detSamplecut" value="0.01"/><br>

                                  detPcut
                                  <h6>The detection p-value threshhold. Probes about this cutoff will be filtered
                                      out.default=0.01</h6>
                                  <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>

                                  removeDetP
                                  <h6>The removeDetP parameter represents the fraction of samples that can contain
                                      a detection p-value above the detPcut.default=0</h6>
                                  <input type="text" class="input_setting_text" name="removeDetP" value="0"/><br>

                                  filterBeads&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterBeads" value="TRUE" checked>T
                                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterBeads" value="FALSE">F
                                  </label><br>
                                  <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                      depending on the beadCutoff value. default=TRUE.</h6>

                                  beadCutoff
                                  <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                      less than 3 before the probe is removed.default=0.05</h6>
                                  <input type="text" class="input_setting_text" name="beadCutoff"
                                         value="0.05"/><br>

                                  filterNoCG&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterNoCG" value="TRUE" checked>T
                                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterNoCG" value="FALSE">F
                                  </label><br>
                                  <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>

                                  filterSNPs&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterSNPs" value="TRUE" checked>T
                                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterSNPs" value="FALSE">F
                                  </label><br>
                                  <h6>If filterSNPs=TRUE,probes in which the probed CpG falls near a SNP as
                                      defined in Nordlund et al are removed.default=TRUE.</h6>

                                  filterMultiHit
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterMultiHit" value="TRUE" checked>T
                                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterMultiHit" value="FALSE">F
                                  </label><br>
                                  <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                      locations with bwa as defined in Nordlund et al are removed.default
                                      =TRUE.</h6>

                                  filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterXY" value="TRUE" checked>T
                                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <label class="checkbox-inline">
                                      <input type="radio" name="filterXY" value="FALSE">F
                                  </label>
                                  <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                      removed.default=TRUE.</h6>

                                      -->
                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('champswan_op').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('champswan_op').style.display='none';"/>

                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SWAN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SWAN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the
                        top to access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_3" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_3" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_3').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    J Maksimovic, L Gordon and A Oshlack (2012). SWAN: Subset quantile Within-Array Normalization for Illumina Infinium HumanMethylation450 BeadChips. Genome Biology 13, R44
                </div>
            </div>
            <!------------------------FN-------------------------------------------------------------->
            <div id="side_right_4" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_FN_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down30" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right30" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="FunctionalNormalize" id="FunctionalNormalize_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('SOAP_exe','btn_SOAP','wait_SOAP');">
                    <div id="necessary_center_FN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="FN_test">Please input the raw files<div class="tip_out"><img class="tip"  src="./img/tip.png" onclick="JavaScript:Tip_click(17)"></div> </div>

                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_FN_file" id="input_FN_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_fn" class="fileField" id="fileField_fn_idat" onchange="return (fileChange(this,'input_FN_file' )&& checkFileExt(this.value,'input_FN_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_FN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down31" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right31" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_FN" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_FN" value="1" checked
                                   onclick="javascript:turnoff('optional_center_setting_FN')">default
                            <input type="radio" name="optionalParameters_FN" value="2"
                                   onclick="document.getElementById('optional_center_setting_FN').style.display='block'">set
                            parameters by yourself
                        </div>

                        <div id="optional_center_setting_FN" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_FN_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">Flase
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>

                                filterDetP&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterDetP" value="FALSE">False
                                </label>
                                <h6>If filter = TRUE, then probes above the detPcut will befiltered out.(default = TRUE)</h6>

                                ProbeCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="ProbeCutoff" value="0"/><br>
                                <h6>The NA ratio threshhold for probes. Probes with above proportion of NA will be removed.</h6>

                                SampleCutoff&nbsp;&nbsp;
                                <input type="text" class="input_setting_text" name="SampleCutoff" value="0.1"/><br>
                                <h6>The failed p value (or NA) threshhold for samples.Samples with above proportion of failed p value (NA) will be removed.</h6>

                                detPcut&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>The detection p-value threshhold. Probes about this cutoff will be filtered
                                    out.default=0.01</h6>
                                <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>

                                filterBeads&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="FALSE">F
                                </label><br>
                                <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                    depending on the beadCutoff value. default=TRUE.</h6>

                                beadCutoff&nbsp;&nbsp;
                                <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                    less than 3 before the probe is removed.default=0.05</h6>
                                <input type="text" class="input_setting_text" name="beadCutoff"
                                       value="0.05"/><br>

                                filterNoCG&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterNoCG" value="FALSE">F
                                </label><br>
                                <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>

                                filterSNPs&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterSNPs" value="FALSE">F
                                </label><br>
                                <h6>If filterSNPs=TRUE,probes in which the probed CpG falls near a SNP as
                                    defined in Nordlund et al are removed.default=TRUE.</h6>

                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>

                                filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterXY" value="FALSE">F
                                </label>
                                <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                    removed.default=TRUE.</h6>

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('optional_center_setting_FN').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('optional_center_setting_FN').style.display='none';"/>

                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_FN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_FN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>

                <div id="detail_text_4" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(4);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_4" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_4').style.display='none'"/>
                    </div>
                </div><span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Fortin J. P. et al. Functional normalization of 450k methylation
                    array data improves replication in large cancer studies. Genome
                    Biol. 15, 503 (2014).
                </div>
            </div>
            <!------------------------ILLUMINA(BLAST)-------------------------------------------------------------->
            <div id="side_right_5" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_ill_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down32" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right32" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Illumina" id="illimina_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('illumina_exe','btn_illumina','wait_illumina');">
                    <div id="necessary_center_ill" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="ill_test">Please input the raw files</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_ILL_file" id="input_ILL_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_ill" class="fileField" id="fileField_ill_idat" onchange="return (fileChange(this,'input_ILL_file' )&& checkFileExt(this.value,'input_ILL_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_ill_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down33" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right33" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_ill" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_ill" id="optionalParameters_default_ill"
                                   class="optionalParameters_default" value="1"
                                   onclick="document.getElementById('optional_center_setting_ill').style.display='none'"
                                   checked="true"/>default
                            <input type="radio" name="optionalParameters_ill" id="optionalParameters_set_ill"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_ill').style.display='block'"/>set
                            the parameters by yourself
                        </div>
                        <div id="optional_center_setting_ill" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_blast_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">

                                bg.correct
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="FALSE">F
                                </label><br>
                                <h6>logical, should background correction be performed?default=TRUE.</h6>

                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_ill').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_ill').style.display='none'"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_ill"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_ill" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_5" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(5);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_5').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">

                </div>
            </div>
            <!------------------------Noob(Subread)-------------------------------------------------------------->
            <div id="side_right_6" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_Noob_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down34" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right34" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Noob" id="Noob_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('Noob_exe','btn_Noob','wait_Noob');">
                    <div id="necessary_center_Noob" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="noob_test">Please input the raw files</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_Noob_file" id="input_Noob_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_noob" class="fileField" id="fileField_noob_idat" onchange="return (fileChange(this,'input_Noob_file' )&& checkFileExt(this.value,'input_Noob_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_Noob_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down35" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right35" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_Noob" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_index_Noob" id="optionalParameters_default_noob"
                                   class="optionalParameters_default" value="1"
                                   onclick="document.getElementById('optional_center_setting_Noob').style.display='none'"
                                   checked="true"/>default
                            <input type="radio" name="optionalParameters_index_Noob" id="optionalParameters_set_noob"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_Noob').style.display='block'"/>set
                            the parameters by yourself
                            <div id="Noob_index_radio" class="radio_text"></div>
                        </div>
                        <div id="optional_center_setting_Noob" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_Noob_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                offset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6> an offset for the normexp background correction.default=15</h6>
                                <input type="text" class="input_setting_text" name="offset"
                                       value="15"/><br>

                                dyeCorr&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="FALSE">F
                                </label><br>
                                <h6>Should dye correction be done?default=TRUE.</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="FALSE">F
                                </label><br>
                                <h6>Should the function be verbose?default=TRUE.</h6>

                                <input type="button" value="submit" checked="true" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_Noob').style.display='none';JavaScript:Subread_index_radio(Subread_B.value,Subread_f.value,Subread_F.value,Subread_M.value)"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_Noob').style.display='none'"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Noob"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Noob" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_6" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(6);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_6" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_6').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    TJ Triche, DJ Weisenberger, D Van Den Berg, PW Laird and KD Siegmund Low-level processing
                    of Illumina Infinium DNA Methylation BeadArrays. (2013) Nucleic Acids Res 41, e90
                </div>
            </div>
            <!-----------------------SQN(NGM)-------------------------------------------------------------->
            <div id="side_right_7" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_SQN_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down36" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right36" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="SQN" id="SQN_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('SQN_exe','btn_SQN','wait_SQN');">
                    <div id="necessary_center_SQN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="SQN_test">Please input the raw files</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_SQN_file" id="input_SQN_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_sqn" class="fileField" id="fileField_sqn_idat" onchange="return (fileChange(this,'input_SQN_file' )&& checkFileExt(this.value,'input_SQN_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_SQN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down37" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right37" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_SQN" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_SQN" class="optionalParameters_default"
                                   value="1" checked="true"
                                   onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_SQN" class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_SQN').style.display='block'"/>set
                            the parameters by yourself
                        </div>
                        <div id="optional_center_setting_SQN" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_SQN_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                fixOutliers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="fixOutliers" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="fixOutliers" value="FALSE">F
                                </label><br>
                                <h6>Should low outlier Meth and Unmeth signals be fixed?default=TRUE.</h6>

                                removeBadSamples&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="removeBadSamples" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="removeBadSamples" value="TRUE">T
                                </label><br>
                                <h6>Should bad samples be removed?default=false.</h6>

                                badSampleCutoff&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>Samples with median Meth and Umneth signals below this
                                    cutoff will be labelled 'bad'.default=10.5</h6>
                                <input type="text" class="input_setting_text" name="badSampleCutoff"
                                       value="10.5"/><br>

                                quantileNormalize&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="quantileNormalize" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="quantileNormalize" value="FALSE">F
                                </label><br>
                                <h6>Should quantile normalization be performed?default=TRUE.</h6>

                                stratified&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="stratified" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="stratified" value="FALSE">F
                                </label><br>
                                <h6> Should quantile normalization be performed within genomic
                                    region strata (e.g. CpG island, shore, etc.)?default=TRUE.</h6>

                                mergeManifest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="mergeManifest" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="mergeManifest" value="TRUE">T
                                </label><br>
                                <h6>Should the information in the associated manifest
                                    package be merged into the output object?default=FALSE.</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose:" value="FALSE">F
                                </label><br>
                                <h6>Should the function be verbose?default=TRUE.</h6>

                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SQN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SQN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                    </div>
                </s:form>
                <div id="detail_text_7" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(7);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_7" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_7').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Touleimat, N., & Tost, J. (2012). Complete pipeline for infinium(®) human methylation 450k beadchip data processing using subset quantile normalization for accurate dna methylation estimation. Epigenomics, 4(3), 325-341.
                </div>
            </div>
            <!------------------------Raw（SICER）-------------------------------------------------------------->
            <div id="side_right_8" class="side_right" style="display:none">
                <form action="RAW" id="RAW_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('RAW_peakcalling','btn_RAW','wait_RAW');">
                    <div class="link" onclick="JavaScript:raw_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right10" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down10" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_raw" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="RAW_test">Please input the raw files</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_RAW_file" id="input_RAW_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file" name="fileField_raw" class="fileField" id="fileField_raw_idat" onchange="return (fileChange(this,'input_RAW_file' )&& checkFileExt(this.value,'input_RAW_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <!--
                                        <div class="link" onclick="JavaScript:raw_option_op();" style="cursor:hand;">
                                            <div class="arrow-right" id="arrow-right11" style="display:none"></div>
                                            <div class="arrow-down" id="arrow-down11" style="display:block"></div>
                                            Optional parameters
                                        </div>
                                        <div id="optional_center_raw" class="optional_center" style="display:block">
                                            <div class="blacktop_1">optional parameters</div>
                                            <div class="blackdown_1">
                                                <input type="radio" name="optionalParameters_raw" id="optionalParameters_default_raw"
                                                       class="optionalParameters_default" value="1" checked="true"
                                                       onclick="document.getElementById('raw_optional_setting').style.display='none'"/>default
                                                <input type="radio" name="optionalParameters_raw" id="optionalParameters_set_raw"
                                                       class="optionalParameters_set" value="2"
                                                       onclick="document.getElementById('raw_optional_setting').style.display='block'"/>set
                                                the parameters by yourself
                                                <div id="sicer_radio" class="radio_text"></div>
                                            </div>
                                            <div id="sicer_optional_setting" class="inputOption_setting" style="display:none">
                                                <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                                    Species: allowed species and genome versions are listed in GenomeData.py.<br> <h6>You
                                                    can add your own species and/or genome versions and relevant data there.</h6>
                                                    <input type="text" id="sicer_sp" value="hg18" class="input_setting_text"
                                                           name="sicer_sp">
                                                    Redundancy Threshold<br>
                                                    <h6>The number of copies of identical reads allowed in a library</h6>
                                                    <input type="text" id="sicer_RT" value="1" class="input_setting_text" name="sicer_RT">
                                                    Window size<br>
                                                    <h6>Resolution of SICER algorithm. For histone modifications, one can use 200
                                                        bp.Default:200</h6>
                                                    <input type="text" id="sicer_ws" value="200" class="input_setting_text" name="sicer_ws">
                                                    Fragment size<br>
                                                    <h6>for determination of the amount of shift from the beginning of a read to the center
                                                        of the DNA fragment represented by the read. FRAGMENT_SIZE=150 means the shift is
                                                        75.</h6>
                                                    <input type="text" id="sicer_fs" value="150" class="input_setting_text" name="sicer_fs">
                                                    Effective genome fraction<br>
                                                    <h6>Effective Genome as fraction of the genome size. It depends on read length.</h6>
                                                    <input type="text" id="sicer_egf" value="0.74" class="input_setting_text"
                                                           name="sicer_egf">
                                                    Gap size<br>
                                                    <h6>Needs to be multiples of window size. Namely if the window size is 200, the gap size
                                                        should be 0, 200, 400, 600, ...</h6>
                                                    <input type="text" id="sicer_gs" value="600" class="input_setting_text" name="sicer_gs">
                                                    Statistic threshold value<br>
                                                    <h6>FDR (with control) or E-value (without control)</h6>
                                                    <input type="text" id="sicer_fdr" value="0.01" class="input_setting_text"
                                                           name="sicer_fdr">
                                                    <input type="button" class="btn_submit" value="submit"
                                                           onclick="document.getElementById('sicer_optional_setting').style.display='none';JavaScript:sicer_radio(sicer_sp.value,sicer_RT.value,sicer_ws.value,sicer_fs.value,sicer_egf.value,sicer_gs.value,sicer_fdr.value);"/>
                                                    <input type="button" class="btn_cancel" value="cancel"
                                                           onclick="document.getElementById('sicer_optional_setting').style.display='none';"/>
                                                </div>
                                            </div>
                                        </div>
                    -->
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_RAW"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_RAW" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <div id="detail_text_8" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(8);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_8" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_8').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Converts the Red/Green channel for an Illumina methylation array into methylation signal, without
                    using any normalization.
                </div>
            </div>
            <!-----------------------limma(multi)------------------------------------------------------------>
            <div id="side_right_9" class="side_right" style="display:none">
                <s:form action="Limma" id="Tools_limma" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_limma','btn_limma','wait_limma');">
                    <div class="link" onclick="JavaScript:limma_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right44" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down44" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_limma" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="LIMMA_test">Please input the DNA methylation beta values or M values matrix(.csv)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSet_file" id="input_exprSet_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_limma" class="fileField" id="fileField_limma_exp" onchange="return (fileChange(this,'input_exprSet_file')&&checkFileExt(this.value,'input_exprSet_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet(.csv) to generate contrast matrix</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheet_file" id="input_sampleSheet_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_limma" class="fileField" id="fileField_limma_sam" onchange="return (fileChange(this,'input_sampleSheet_file' )&& checkFileExt(this.value,'input_sampleSheet_file'))" />
                            </div>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:limma_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right45" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down45" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_limma" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_limma" id="multi_optionalParameters_default" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('limma_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_limma" id="multi_optionalParameters_set" class="optionalParameters_set" value="2" onclick="document.getElementById('limma_optional_setting').style.display='block'"/>set the parameters by yourself
                            <div id="Limma_radio" class="radio_text"></div>
                        </div>
                        <div id="limma_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="limma_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">

                                proportion&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>numeric value between 0 and 1, assumed proportion of genes
                                    which are differentially expressed.default=10.5</h6>
                                <input type="text" class="input_setting_text" name="proportion"
                                       value="0.01"/><br>

                                trend&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="trend" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="trend" value="TRUE">T
                                </label><br>
                                <h6>logical, should an intensity-trend be allowed for the prior
                                    variance? Default is that the prior variance is constant.</h6>

                                robust&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="robust" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="robust" value="TRUE">T
                                </label><br>
                                <h6> logical, should the estimation of 'df.prior' and 'var.prior'
                                    be robustified against outlier sample variances?.</h6>

                                number
                                <h6>numeric value between 0 and 1, assumed proportion of genes
                                    which are differentially expressed.default=100</h6>
                                <input type="text" class="input_setting_text" name="number"
                                       value="100"/><br>


                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('limma_optional_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('limma_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('volcano_option').style.display='block'"/>volcano
                            <input type="radio" name="plot" class="optionalParameters_set" value="2" onclick="document.getElementById('volcano_option').style.display='none'"/>none
                        </div>
                        <div id="volcano_option" class="inputOption_setting" style="display:none">
                            <div id="volcano_option_center" class="inputOption_setting_center">
                                P.Value&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>default=0.05.</h6>
                                <input type="text" class="input_setting_text" name="P_Value"
                                       value="0.05"/><br>
                                logFC
                                <h6>default=1.</h6>
                                <input type="text" class="input_setting_text" name="logFC"
                                       value="1"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_limma"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_limma" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_9" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(9);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_9" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_9').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Smyth G K. limma: Linear Models for Microarray Data[M]// Bioinformatics and Computational Biology Solutions Using R and Bioconductor. Springer New York, 2005:397-420.
                </div>
            </div>
            <!------------------------DMRCate（MACS）-------------------------------------------------------------->
            <div id="side_right_10" class="side_right" style="display:none">
                <s:form action="DMRCate" id="Tools_DMRCate_PeakCalling" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_DMRCate_PeakCalling','btn_DMRCate','wait_DMRCate');">
                    <div class="link" onclick="JavaScript:dmrcate_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right8" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down8" style="display:block"></div>
                        Necessary parameters
                    </div>

                    <div id="necessary_center_dmrcate" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="DMRCate_test">Please input the DNA methylation beta values or M values matrix(.csv)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetdmr_file" id="input_exprSetdmr_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_dmrcate" class="fileField" id="fileField_dmr_exp" onchange="return (fileChange(this,'input_exprSetdmr_file')&&checkFileExt(this.value,'input_exprSetdmr_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet(.csv) to generate contrast matrix</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetdmr_file" id="input_sampleSheetdmr_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_dmrcate" class="fileField" id="fileField_dmr_sam" onchange="return (fileChange(this,'input_sampleSheetdmr_file' )&& checkFileExt(this.value,'input_sampleSheetdmr_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:dmrcate_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right9" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down9" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_dmrcate" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_dmrcate" id="optionalParameters_default"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('dmrcate_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_dmrcate" id="optionalParameters_set"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('dmrcate_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="dmrcate_radio" class="radio_text"></div>
                        </div>
                        <div id="dmrcate_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="dmrcate_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                rmSNPCH
                                <label class="checkbox-inline">
                                    <input type="radio" name="rmSNPCH" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="rmSNPCH" value="F">FALSE
                                </label><br>
                                <h6> Filters a matrix of M-values (or beta values) by distance to
                                    SNP. Also (optionally) removes crosshybridising probes and
                                    sex-chromosome probes. (default = TRUE)
                                </h6>
                                dist
                                <input type="text"name="dist" value="2" class="input_setting_text"/>
                                <h6>
                                    Maximum distance (from CpG to SNP) of probes to be filtered
                                    out. See details for when Illumina occasionally lists a
                                    CpG-to-SNP distance as being < 0. (default = 2)
                                </h6>
                                mafcut
                                <input type="text"name="mafcut" value="0.05" class="input_setting_text"/>
                                <h6>
                                    Minimum minor allele frequency of probes to be filtered out.
                                    (default = 0.05)
                                </h6>
                                lambda
                                <input type="text"name="lambda" value="1000" class="input_setting_text"/>
                                <h6>
                                    Gaussian kernel bandwidth for smoothed-function estimation.
                                    Also informs DMR bookend definition; gaps >= lambda between
                                    significant CpG sites will be in separate DMRs. Support is
                                    truncated at 5*lambda. See DMRcate package for further info.
                                    (default = 1000)
                                </h6>
                                C
                                <input type="text"name="C" value="2" class="input_setting_text"/>
                                <h6>
                                    Scaling factor for bandwidth. Gaussian kernel is calculated
                                    where lambda/C = sigma. Empirical testing shows that when
                                    lambda=1000, near-optimal prediction of sequencing-derived
                                    DMRs is obtained when C is approximately 2, i.e. 1 standard
                                    deviation of Gaussian kernel = 500 base pairs. Cannot be <
                                    0.2. (default = 2)
                                </h6>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('dmrcate_optional_setting').style.display='none';JavaScript:dmrcate_radio(macs_g.value,macs_s.value,macs_bw.value,macs_p.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('dmrcate_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_dmrcate"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_dmrcate" class="Upload_wait_dmrcate" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>

                <div id="detail_text_10" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(10);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_10" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_10').style.display='none'"/>
                    </div>
                </div><span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Peters TJ, Buckley MJ, Statham AL, et al. De novo identification
                    of differentially methylated regions in the human genome.
                    Epigenetics & Chromatin. 2015;8(1):1-16.
                </div>
            </div>
            <!------------------------Bumphunter (MACS2)-------------------------------------------------------------->
            <div id="side_right_11" class="side_right" style="display:none">
                <s:form action="Bumphunter" id="Tools_Bumphunter " enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_bumphunter','btn_bumphunter','wait_bumphunter');">
                    <div class="link" onclick="JavaScript:bumphunter_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right12" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down12" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_bumphunter" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="Bumphunter_test">Please input the DNA methylation beta values or M values matrix(.csv)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetbum_file" id="input_exprSetbum_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_bumphunter" class="fileField" id="fileField_bum_exp" onchange="return (fileChange(this,'input_exprSetbum_file')&&checkFileExt(this.value,'input_exprSetbum_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet(.csv) to generate contrast matrix</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetbum_file" id="input_sampleSheetbum_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_bumphunter" class="fileField" id="fileField_bum_sam" onchange="return (fileChange(this,'input_sampleSheetbum_file' )&& checkFileExt(this.value,'input_sampleSheetbum_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:bumphunter_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right13" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down13" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_bumphunter" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_bumphunter" id="optionalParameters_default_bumphunter"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('bumphunter_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_bumphunter" id="optionalParameters_set_bumphunter"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('bumphunter_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="bumphunter_radio" class="radio_text"></div>
                        </div>
                        <div id="bumphunter_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="bumphunter_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" id="minProbes" name="minProbes" value="7" class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>
                                adjPvalDmr
                                <input type="text" id="adjPvalDmr" name="adjPvalDmr" value="0.05" class="input_setting_text"/>
                                <h6>This is the significance threshold for including DMRs in
                                    the final DMR list. (default = 0.05)
                                </h6>
                                maxGap
                                <input type="text" id="maxGap" name="maxGap" value="300" class="input_setting_text"/>
                                <h6>The maximum length for a DMR should be detected, regions
                                    longer then this would be discarded. (default = 300)
                                </h6>
                                cutoff
                                <input type="text" id="cutoff" name="cutoff" value="NULL" class="input_setting_text"/>
                                <h6>A numeric value. Values of the estimate of the genomic
                                    profile above the cutoff or below the negative of the cutoff
                                    will be used as candidate regions. It is possible to give two
                                    separate values (upper and lower bounds). If one value is
                                    given, the lower bound is minus the value. (default = NULL)
                                </h6>
                                pickCutoff
                                <input type="text" id="pickCutoff" name="pickCutoff" value="TRUE" class="input_setting_text"/>
                                <h6>A bool value to indicate if bumphunter algorithm will
                                    automatically select the threshold of DMRs. If the value is
                                    TRUE, bumphunter will automatically generated 0.99 cutoff
                                    from permutation. If user think this threshold is not
                                    suitable, user may set their own cutoff here. (default =
                                    TRUE)
                                </h6>
                                smooth
                                <label class="checkbox-inline">
                                    <input type="radio" name="smooth" value="TRUE" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="smooth" value="FALSE">FALSE
                                </label><br>
                                <h6> A logical value. If TRUE the estimated profile will be
                                    smoothed with the smoother defined by 'smoothFunction'.
                                    (default = TRUE)
                                </h6>
                                smoothFunction
                                <label class="checkbox-inline">
                                    <input type="radio" name="smoothFunction" value="loessByCluster" checked>loessByCluster
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="smoothFunction" value="runmedByCluster">runmedByCluster
                                </label><br>
                                <h6> A function to be used for smoothing the estimate of the
                                    genomic profile. Two functions are provided by the package:
                                    'loessByCluster' and 'runmedByCluster'. (default =
                                    loessByCluster)
                                </h6>
                                useWeights
                                <label class="checkbox-inline">
                                    <input type="radio" name="useWeights" value="FALSE" checked>FALSE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="useWeights" value="TRUE">TRUE
                                </label><br>
                                <h6>A logical value. If 'TRUE' then the standard errors of the
                                    point-wise estimates of the profile function will be used as
                                    weights in the loess smoother 'loessByCluster'. If the
                                    'runmedByCluster' smoother is used this argument is ignored.
                                    (default = FALSE)
                                </h6>
                                permutations
                                <input type="text" id="permutations" name="permutations" value="NULL" class="input_setting_text"/>
                                <h6>
                                    is a matrix with columns providing indexes to be used to
                                    scramble the data and create a null distribution when
                                    'nullMethod' is set to permutations. If the bootstrap
                                    approach is used this argument is ignored. If this matrix is
                                    not supplied and 'B'>0 then these indexes are created using
                                    the function 'sample'. (default = NULL)

                                </h6>
                                B
                                <input type="text" id="B" name="B" value="250" class="input_setting_text"/>
                                <h6>An integer denoting the number of resamples to use when
                                    computing null distributions. If 'permutations' is supplied
                                    that defines the number of permutations/bootstraps and 'B' is
                                    ignored. (default = 250)
                                </h6>
                                nullMethod
                                <label class="checkbox-inline">
                                    <input type="radio" name="nullMethod" value="bootstrap" checked>bootstrap
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="nullMethod" value="permutation">permutation
                                </label><br>
                                <h6>
                                    Method used to generate null candidate regions, must be one
                                    of 'bootstrap' or 'permutation' (defaults to 'permutation').
                                    However, if covariates in addition to the outcome of interest
                                    are included in the design matrix (ncol(design)>2), the
                                    'permutation' approach is not recommended. See vignette and
                                    original paper for more information. (default = "bootstrap")
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('bumphunter_optional_setting').style.display='none';JavaScript:bumphunter_radio(arraytype.value,minProbes.value,adjPvalDmr.value,maxGap.value,cutoff.value,pickCutoff.value,smooth.value,useWeights.value,permutations.value,B.value,nullMethod.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('bumphunter_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_bumphunter"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="waitbumphunter" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_11" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(11);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_11" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_11').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Jaffe AE et a. Bump hunting to identify differentially methylated
                    regions in epigenetic epidemiology studies. Int J Epidemiol.
                    2012;41(1):200-209.
                </div>
            </div>
            <!------------------------ProbeLasso(PeakSeq)-------------------------------------------------------------->
            <div id="side_right_12" class="side_right" style="display:none">
                <s:form action="Lasso" id="probeLasso_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('probeLasso_exe','btn_probeLasso','wait_probeLasso');">
                    <div class="link" onclick="JavaScript:probeLasso_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right16" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down16" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_probeLasso" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="ProbeLasso_test">Please input the DNA methylation beta values or M values matrix(.csv)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetpro_file" id="input_exprSetpro_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_lasso" class="fileField" id="fileField_pro_exp" onchange="return (fileChange(this,'input_exprSetpro_file')&&checkFileExt(this.value,'input_exprSetpro_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet(.csv) to generate contrast matrix</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetpro_file" id="input_sampleSheetpro_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_lasso" class="fileField" id="fileField_pro_sam" onchange="return (fileChange(this,'input_sampleSheetpro_file' )&& checkFileExt(this.value,'input_sampleSheetpro_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:probeLasso_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right17" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down17" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_probeLasso" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_probeLasso"
                                   id="optionalParameters_default_probeLasso" class="optionalParameters_default" value="1"
                                   checked="true"
                                   onclick="document.getElementById('probeLasso_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_probeLasso" id="optionalParameters_set_probeLasso"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('probeLasso_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="probeLasso_radio" class="radio_text"></div>
                        </div>
                        <div id="probeLasso_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text"  name="minProbes" value="7" class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>
                                adjPvalDmr
                                <input type="text"  name="adjPvalDmr" value="0.05" class="input_setting_text"/>
                                <h6>This is the significance threshold for including DMRs in
                                    the final DMR list. (default = 0.05)
                                </h6>

                                meanLassoRadius
                                <input type="text" id="meanLassoRadius" name="meanLassoRadius" value="375" class="input_setting_text"/>
                                <h6> Radius around each DMP to detect DMR. (default = 375)</h6>
                                minDmrSep
                                <input type="text" id="minDmrSep" name="minDmrSep" value="1000" class="input_setting_text"/>
                                <h6>The minimum seperation (bp) between neighbouring DMRs.
                                    (default = 1000.)
                                </h6>
                                minDmrSize
                                <input type="text" id="minDmrSize" name="minDmrSize" value="50" class="input_setting_text"/>
                                <h6> The minimum DMR size (bp). (default = 50)
                                </h6>
                                adjPvalProbe
                                <input type="text" id="adjPvalProbe" name="adjPvalProbe" value="0.05" class="input_setting_text"/>
                                <h6>The minimum threshold of significance for probes to be
                                    includede in DMRs. (default = 0.05)
                                </h6>
                                PDFplot
                                <label class="checkbox-inline">
                                    <input type="radio" name="PDFplot" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="PDFplot" value="F">FALSE
                                </label><br>
                                <h6> If PDFplot would be generated and save in resultsDir.
                                    (default = TRUE)
                                </h6>
                                Rplot
                                <label class="checkbox-inline">
                                    <input type="radio" name="Rplot" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="Rplot" value="F">FALSE
                                </label><br>
                                <h6>If Rplot would be generated and save in resultsDir. Note if
                                    you are doing analysis on a server remotely, please make sure
                                    the server could connect your local graph applications. (For
                                    example X11 for linux.) (default = TRUE)
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('probeLasso_optional_setting').style.display='none';JavaScript:probeLasso_radio();"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('probeLasso_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_peakseq"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_probeLasso" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_12" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(12);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_12" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_12').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Butcher LM, Beck S. Probe lasso: A novel method to rope in
                    differentially methylated regions with 450K dna methylation data.
                    Methods. 2015;72:21-28.
                </div>
            </div>
            <!------------------------selqm(PeakRanger)-------------------------------------------------------------->
            <div id="side_right_13" class="side_right" style="display:none">
                <s:form action="Seqlm" id="seqlm_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('seqlm_exe','btn_seqlm','wait_seqlm');">
                    <div class="link" onclick="JavaScript:seqlm_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right18" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down18" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_seqlm" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="seqlm_test">Please input the DNA methylation beta values or M values matrix(.csv)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetseq_file" id="input_exprSetseq_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_seqlm" class="fileField" id="fileField_seq_exp" onchange="return (fileChange(this,'input_exprSetseq_file')&&checkFileExt(this.value,'input_exprSetseq_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet(.csv) to generate contrast matrix</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetseq_file" id="input_sampleSheetseq_file" class="input_text" />
                                <input type="button" class="btn" value="Choose File" />
                                <input type="file" name="fileField_seqlm" class="fileField" id="fileField_seq_sam" onchange="return (fileChange(this,'input_sampleSheetseq_file' )&& checkFileExt(this.value,'input_sampleSheetseq_file'))" />
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:seqlm_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right19" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down19" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_seqlm" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_seqlm"
                                   id="optionalParameters_default_seqlm" class="optionalParameters_default" value="1"
                                   checked="true"
                                   onclick="document.getElementById('seqlm_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_seqlm" id="optionalParameters_set_seqlm"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('seqlm_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="seqlm_radio" class="radio_text"></div>
                        </div>
                        <div id="seqlm_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                max_block_length
                                <input type="text"  name="max_block_length" value="50" class="input_setting_text"/>
                                <h6> maximal length of the block we are searching. This is
                                    used to speed up computation.default=50.
                                </h6>

                                max_dist
                                <input type="text"  name="max_dist" value="1000" class="input_setting_text"/>
                                <h6>maximal genomic distance between the sites to be considered
                                    the same region.default=1000.
                                </h6>

                                expand
                                <input type="text"  name="expand" value="100" class="input_setting_text"/>
                                <h6>number of basepairs to extend the region on plot</h6>

                                width
                                <input type="text"  name="width" value="8" class="input_setting_text"/>
                                <h6>picture width in inches</h6>

                                height
                                <input type="text"  name="height" value="5" class="input_setting_text"/>
                                <h6>picture height in inches</h6>

                                dpi
                                <input type="text"  name="dpi" value="100" class="input_setting_text"/>
                                <h6>dots per inch, to calibrate the picture size in pixels</h6>

                                main
                                <input type="text"  name="main" value="seqlm results" class="input_setting_text"/>
                                <h6>title for the report</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('seqlm_optional_setting').style.display='none';JavaScript:seqlm_radio();"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('seqlm_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_seqlm"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_seqlm" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_13" class="detail_tip" style="display:none" >
                    If you want to get detail information about the operation which just finished, please <a href="JavaScript:operation_detail(13);" style="text-decoration: none;color:#666666">click here</a>.
                    And the result will be sent to you by email as soon as possible.
                </div>
                <div id="detail_13" class="inputOption_setting_de" style="display:none;">
                    <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                        ${stdoutlist}<br>
                        <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_13').style.display='none'"/>
                    </div>
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Kolde R,Märtens K,Lokk K,et al.seqlm:an MDL based method for identifying differentially methylated regions in high density methylation array data[J].Bioinformatics, 2016, 32(17):btw304.
                </div>
            </div>

            <!------------------------PePr-------------------------------------------------------------->
            <div id="side_right_14" class="side_right" style="display:none">
                <form action="PePr_peakcalling" id="PePr_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('PePr_peakcalling','btn_Pepr','wait_Pepr');">
                    <div class="link" onclick="JavaScript:pepr_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right20" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down20" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_pepr" class="necessary_center" style="display:block">
                        <div class="blacktop_1">Input biological replicate file1</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_pepr_tagfile1" id="input_pepr_tagfile1"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_pepr" class="fileField" id="fileField_pepr_tag1"
                                       onchange="return (fileChange(this,'input_pepr_tagfile1' )&& checkFileExt(this.value,'input_pepr_tagfile1'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input biological replicate file2</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_pepr_tagfile2" id="input_pepr_tagfile2"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_pepr" class="fileField" id="fileField_pepr_tag2"
                                       onchange="return (fileChange(this,'input_pepr_tagfile2' )&& checkFileExt(this.value,'input_pepr_tagfile2'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input ChIP replicate file1</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_pepr_controlfile1" id="input_pepr_controlfile1"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_pepr" class="fileField" id="fileField_pepr_control1"
                                       onchange="return (fileChange(this,'input_pepr_controlfile1' )&& checkFileExt(this.value,'input_pepr_controlfile1'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input ChIP replicate file2</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_pepr_controlfile2" id="input_pepr_controlfile2"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_pepr" class="fileField" id="fileField_pepr_control2"
                                       onchange="return (fileChange(this,'input_pepr_controlfile2' )&& checkFileExt(this.value,'input_pepr_controlfile2'))"/>
                            </div>
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:pepr_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right21" style="display:block"></div>
                        <div class="arrow-down" id="arrow-down21" style="display:none"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_pepr" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_pepr" id="optionalParameters_default_pepr"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('pepr_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_pepr" id="optionalParameters_set_pepr"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('pepr_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="pepr_radio" class="radio_text"></div>
                        </div>
                        <div id="pepr_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                --peaktype.sharp or broad. <br>
                                <h6>Default is broad.</h6>
                                <input type="text" id="pepr_peaktype" value="broad" class="input_setting_text"
                                       name="pepr_peaktype"><br>
                                --threshold<br>
                                <h6>p-value cutoff. Default:1e-5.</h6>
                                <input type="text" id="pepr_p" value="1e-5" class="input_setting_text"
                                       name="pepr_p"><br>
                                --keep-max-dup<br>
                                <h6>maximum number of duplicated reads at each single position to keep. If not
                                    specified, will not remove any duplicate.</h6>
                                <input type="text" id="pepr_keep" value="2" class="input_setting_text" name="pepr_keep"><br>
                                --num-processors<br>
                                <h6>Number of CPUs to run in parallel.</h6>
                                <input type="text" id="pepr_num" value="1" class="input_setting_text"
                                       name="pepr_num"><br>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('pepr_optional_setting').style.display='none';JavaScript:pepr_radio(pepr_peaktype.value,pepr_p.value,pepr_keep.value,pepr_num.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('pepr_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Pepr"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Pepr" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Zhang, Y., Lin, Y. H., Johnson, T. D., Rozek, L. S., & Sartor, M. A. (2014). Pepr: a peak-calling
                    prioritization pipeline to identify consistent or differential peaks from replicated chip-seq data.
                    Bioinformatics, 30(18), 2568-2575.
                </div>
            </div>
            <!------------------------BCP-------------------------------------------------------------->
            <div id="side_right_15" class="side_right" style="display:none">
                <form action="BCP_peakcalling" id="BCP_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('BCP_peakcalling','btn_BCP','wait_BCP');">
                    <div class="link" onclick="JavaScript:BCP_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right22" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down22" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_BCP" class="necessary_center" style="display:block">
                        <div class="blacktop_1">Select the data type</div>
                        <div class="blackdown_1">
                            <input type="radio" value="1" name="BCP_type"
                                   onclick="document.getElementById('BCP_HM').style.display='block';document.getElementById('BCP_TF').style.display='none';"/>Histone
                            Modification case
                            <input type="radio" value="2" name="BCP_type"
                                   onclick="document.getElementById('BCP_TF').style.display='block';document.getElementById('BCP_HM').style.display='none';"/>Transcription
                            Factor Bingding Sites
                        </div>
                        <div class="blacktop_1">
                            ChIP-Seq Tag file
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_BCP_tagfile" id="input_BCP_tagfile" class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_bcp" class="fileField" id="fileField_bcp_tag"
                                       onchange="return (fileChange(this,'input_BCP_tagfile' )&& checkFileExt(this.value,'input_BCP_tagfile'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            ChIP-Seq control file
                            <div class="tip_out"><img class="tip" id="tip26" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(26)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_BCP_controlfile" id="input_BCP_controlfile"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_bcp" class="fileField" id="fileField_bcp_control"
                                       onchange="return (fileChange(this,'input_BCP_controlfile' )&& checkFileExt(this.value,'input_BCP_controlfile'))"/>
                            </div>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:BCP_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right23" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down23" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_BCP" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_BCP" id="optionalParameters_default_BCP"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('BCP_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_BCP" id="optionalParameters_set_BCP"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('BCP_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="BCP_radio" class="radio_text"></div>
                        </div>
                        <div id="BCP_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" id="BCP_HM" style="overflow-y:scroll;">
                                fragment size<br>
                                <h6>-f;Here fragment size is decided by the ChIP experiment sonication size (default
                                    value is 200bp)</h6>
                                <input type="text" id="BCP_f" value="200" class="input_setting_text" name="BCP_f">
                                window size<br>
                                <h6>Window size is a resolution parameter that is decided by user.We recommend 200bp as
                                    the default value because it isapproximately the size of a single nucleosome. </h6>
                                <input type="text" id="BCP_W" value="200" class="input_setting_text" name="BCP_W"><br>
                                p-value<br>
                                <h6>P-values are used when calling signi cant segments compared to control data (default
                                    is 1e-3). </h6>
                                <input type="text" id="BCP_p" value="1e-3" class="input_setting_text" name="BCP_p">
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('BCP_optional_setting').style.display='none';JavaScript:BCP_radio_HM(BCP_f.value,BCP_W.value,BCP_p.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('BCP_optional_setting').style.display='none';"/>
                            </div>

                            <div class="inputOption_setting_center" id="BCP_TF" style="overflow-y:scroll;display:none">
                                old enrichment<br>
                                <h6>-e;Fold enrichment is used when estimating shift size.The default value is 10 and we
                                    recommend users restrict within the range of 5
                                </h6>
                                <input type="text" id="BCP_e" value="10" class="input_setting_text" name="BCP_e"><br>
                                p-value<br>
                                <h6>p-value is also used to choose really significant peaks compared to the control
                                    data.The default p-value in the TFBS case is 1e-8. </h6>
                                <input type="text" id="BCP_p2" value="1e-8" class="input_setting_text" name="BCP_p2">
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('BCP_optional_setting').style.display='none';JavaScript:BCP_radio_TF(BCP_e.value,BCP_p2.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('BCP_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_BCP"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_BCP" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
            </div>
            <!------------------------diffReps-------------------------------------------------------------->
            <div id="side_right_16" class="side_right" style="display:none">
                <form action="diff_peakcalling" id="diff_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('diff_peakcalling','btn_diff','wait_diff');">
                    <div class="link" onclick="JavaScript:diff_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right24" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down24" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_diff" class="necessary_center" style="display:block">
                        <div class="blacktop_1">
                            ChIP-Seq Tag file
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_diff_tagfile" id="input_diff_tagfile"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_diff" class="fileField" id="fileField_diff_tag"
                                       onchange="return (fileChange(this,'input_diff_tagfile' )&& checkFileExt(this.value,'input_diff_tagfile'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            ChIP-Seq control file
                            <div class="tip_out"><img class="tip" id="tip28" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(28)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_diff_controlfile" id="input_diff_controlfile"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_diff" class="fileField" id="fileField_diff_control"
                                       onchange="return (fileChange(this,'input_diff_controlfile' )&& checkFileExt(this.value,'input_diff_controlfile'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Choose the currently built-in genomes</div>
                        <div class="blackdown_1">
                            <input type="radio" value="1" name="diff_gn"/>mm9
                            <input type="radio" value="2" name="diff_gn"/>hg19
                            <input type="radio" value="3" name="diff_gn"/>rn4
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:diff_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right25" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down25" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_diff" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_diff" id="optionalParameters_default_diff"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('diff_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_diff" id="optionalParameters_set_diff"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('diff_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="diff_radio" class="radio_text"></div>
                        </div>
                        <div id="diff_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                --mode<br>
                                <h6>Scanning mode: a selection implies a different window size.<br>
                                    Set window and step size manually to override.<br>
                                    (p)eak (=1000) Histone mark peak (Default).<br>
                                    (n)ucleosome(=200) Single nucleosome (+DNAlinker).<br>
                                    (b)lock (=10000) Large chromatin modification block.<br>
                                </h6>
                                <input type="radio" value="1" checked="true" name="diff_mode">peak
                                <input type="radio" value="2" name="diff_mode">nucleosome
                                <input type="radio" value="3" name="diff_mode">block<br>
                                --window(1000)<br>
                                <h6>Window size (default=Histone mark peak size).</h6>
                                <input type="text" id="diff_w" value="1000" class="input_setting_text"
                                       name="diff_w"><br>
                                --step(1/10 win) <br>
                                <h6>Window moving step size.</h6>
                                <input type="text" id="diff_step" value="1" class="input_setting_text" name="diff_step"><br>
                                --gap(0)<br>
                                <h6>Gap allowed between two consecutive windows.</h6>
                                <input type="text" id="diff_gap" value="0" class="input_setting_text"
                                       name="diff_gap"><br>
                                --nsd(broad)<br>
                                <h6>Z-score cutoff for low read count. Choose from two default modes or set your
                                    own.<br>
                                    (b)road (=2) Broad peak such as H3K36me3.<br>
                                    (s)harp (=20) Sharp peak such as H3K4me3 or Transcription factors.</h6>
                                <input type="radio" value="1" name="diff_nsd" checked="true">broad
                                <input type="radio" value="2" name="diff_nsd">sharp<br>
                                --alpha(0.05) <br>
                                <h6>Alpha for right-trimmed mean, must be in: [0, 0.5).</h6>
                                <input type="text" id="diff_alpha" value="0.05" class="input_setting_text"
                                       name="diff_alpha"><br>
                                --bkg(0)<br>
                                <h6>Use fold enrichment vs. background as filter instead. Set a float number such as 2.0
                                    here.</h6>
                                <input type="text" id="diff_bkg" value="0" class="input_setting_text" name="diff_bkg">

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('diff_optional_setting').style.display='none';JavaScript:diff_radio(diff_mode.value,diff_w.value,diff_step.value,diff_gap.value,diff_nsd.value,diff_alpha.value,diff_bkg.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('diff_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_diff"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_diff" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Shen, L., Shao, N. Y., Liu, X., Maze, I., Feng, J., & Nestler, E. J. (2012). Diffreps: detecting
                    differential chromatin modification sites from chip-seq data with biological replicates. Plos
                    One, 8(6), e65598.
                </div>
            </div>
            <!------------------------SISSRs-------------------------------------------------------------->
            <div id="side_right_17" class="side_right" style="display:none">
                <form action="SISSR_peakcalling" id="SISSR_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('SISSR_peakcalling','btn_SISSR','wait_SISSR');">
                    <div class="link" onclick="JavaScript:SISSR_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right26" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down26" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_SISSR" class="necessary_center" style="display:block">
                        <div class="blacktop_1">
                            ChIP-Seq Tag file
                            <div class="tip_out"><img class="tip" id="tip15" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(15)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_SISSR_tagfile" id="input_SISSR_tagfile"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_sissr" class="fileField" id="fileField_sissr_tag"
                                       onchange="return (fileChange(this,'input_SISSR_tagfile' )&& checkFileExt(this.value,'input_SISSR_tagfile'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            ChIP-Seq control file
                            <div class="tip_out"><img class="tip" id="tip30" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(30)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_SISSR_controlfile" id="input_SISSR_controlfile"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_sissr" class="fileField" id="fileField_sissr_control"
                                       onchange="return (fileChange(this,'input_SISSR_controlfile' )&& checkFileExt(this.value,'input_SISSR_controlfile'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Genome size (or length).</div>
                        <div class="blackdown_1">
                            <input type="text" name="input_SISSR_size" id="input_SISSR_size" class="input_text"/>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:SISSR_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right27" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down27" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_SISSR" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_SISSR" id="optionalParameters_default_SISSR"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('SISSR_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_SISSR" id="optionalParameters_set_SISSR"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('SISSR_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="SISSR_radio" class="radio_text"></div>
                        </div>
                        <div id="SISSR_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                False discovery rate if random background model based on Poisson probabilities need to
                                be
                                used as control<br>
                                <h6>
                                    i.e., no background data is available.Default: 0.001
                                </h6>
                                <input type="text" id="SISSR_D" value="0.001" class="input_setting_text" name="SISSR_D"><br>
                                e-value threshold.<br>
                                <h6>It is the maximum number of “enriched regions” one can expect to see by
                                    chance (Poisson probabilities), when analyzing a similar-sized dataset.Default:
                                    10</h6>
                                <input type="text" id="SISSR_e" value="10" class="input_setting_text"
                                       name="SISSR_e"><br>
                                p-value threshold.<br>
                                <h6>For a given F value (average DNA fragment length) and a candidate binding
                                    site (represented as genomic coordinate t in Fig 1 of Jothi et al [1]), let u be the
                                    number of tags
                                    mapped to the region [t - F, t] on the sense strand, and let v be the number of tags
                                    mapped to the
                                    region [t, t + F] on the anti-sense strand.Default: 0.001</h6>
                                <input type="text" id="SISSR_p" value="0.001" class="input_setting_text" name="SISSR_p"><br>
                                Fraction of genome (0.0 to 1.0) mappable by reads.<br>
                                <h6>Default: 0.8 for hg18, assuming ELAND was used for mapping. This could be different
                                    for
                                    different organisms and other mapping algorithms.</h6>
                                <input type="text" id="SISSR_m" value="0.8" class="input_setting_text"
                                       name="SISSR_m"><br>
                                Size of the overlapping/sliding scanning window (must be an even number >1), which is
                                one of
                                the parameters that attempts to control for noise in the data<br>
                                <h6>The amount of background noise in the data is a important factor one needs to
                                    consider before setting the size of the window.
                                    Default: 20</h6>
                                <input type="text" id="SISSR_w" value="20" class="input_setting_text"
                                       name="SISSR_w"><br>
                                Number of “directional” reads required within F base pairs on either side of the
                                inferred
                                binding site.<br>
                                <h6>Default: 2 (assuming that the data file contains ~2 to ~5 million reads; the value
                                    may need to
                                    be increased if the total number of reads is much larger).</h6>
                                <input type="text" id="SISSR_EE" value="2" class="input_setting_text"
                                       name="SISSR_E"><br>
                                Upper-bound on the DNA fragment length. It is the approximate length/size of the longest
                                DNA fragment that was sequenced.<br>
                                <h6>Default: 500</h6>
                                <input type="text" id="SISSR_L" value="500" class="input_setting_text" name="SISSR_L">
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('SISSR_optional_setting').style.display='none';JavaScript:SISSR_radio(SISSR_D.value,SISSR_e.value,SISSR_p.value,SISSR_m.value,SISSR_w.value,SISSR_E.value,SISSR_L.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('SISSR_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SISSR"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SISSR" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Jothi, R., Cuddapah, S., Barski, A., Cui, K., & Zhao, K. (2008). Genome-wide identification of in
                    vivo protein-dna binding sites from chip-seq data.Nucleic Acids Research, 36(16), 5221.
                </div>
            </div>
            <!------------------------findpeaks-------------------------------------------------------------->
            <div id="side_right_18" class="side_right" style="display:none">
                <form action="findpeaks_peakcalling" id="findpeaks_peakcalling" enctype="multipart/form-data"
                      method="post" onsubmit="return searchData('findpeaks_peakcalling','btn_find','wait_find');">
                    <div class="link" onclick="JavaScript:findpeak_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right28" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down28" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_findpeaks" class="necessary_center" style="display:block">
                        <div class="blacktop_1">Determines which aligner input to use</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="radio" name="findpeak_format" value="1" checked="true">ELAND
                                <input type="radio" name="findpeak_format" value="2">BED
                            </div>
                        </div>
                        <div class="blacktop_1">
                            Input the ChIP-Seq file
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_findpeaks_file" id="input_findpeaks_file"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_find" class="fileField" id="fileField_find_tag"
                                       onchange="return (fileChange(this,'input_findpeaks_file' )&& checkFileExt(this.value,'input_findpeaks_file'))"/>
                            </div>
                        </div>

                        <div class="blacktop_1">Input effective genome size</div>
                        <div class="blackdown_1">
                            <input type="text" name="input_findpeaks_gs" id="input_findpeaks_gs" class="input_text"/>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:findpeak_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right29" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down29" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_findpeaks" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_findpeaks"
                                   id="optionalParameters_default_findpeaks" class="optionalParameters_default"
                                   value="1" checked="true"
                                   onclick="document.getElementById('findpeaks_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_findpeaks"
                                   id="optionalParameters_set_findpeaks" class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('findpeaks_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="findpeak_radio" class="radio_text"></div>
                        </div>
                        <div id="findpeaks_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                -directional<br>
                                <h6>
                                    Engages directional mode, which considers directional reads for identifying the
                                    location of the maximum
                                    peak height. This may be useful for refining narrow peaks and filtering out noise.
                                    If flag is omitted: directional mode is not engaged.
                                </h6>
                                <input type="radio" name="findpeak_dir" value="1"/>on
                                <input type="radio" name="findpeak_dir" value="2" checked="true"/>off<br>
                                <br>-dist_type <br>
                                <h6>0: fixed width model<br>
                                    1: triangle distribution<br>
                                    2: Adaptive (sampled) distribution<br>
                                    3: Native mode<br>
                                    default:1 200
                                </h6>
                                <input type="text" id="findpeak_type" value="1 200" class="input_setting_text"
                                       name="findpeak_type"/>
                                <br>-filter<br>
                                <h6>Turns on duplicate filtering. Filtering is currently only performed to remove reads
                                    in the same direction
                                    that share a start location.
                                    If flag is omitted: duplicate filtering is off.
                                </h6>
                                <input type="radio" name="findpeak_filter" value="1"/>on
                                <input type="radio" name="findpeak_filter" value="2" checked="true"/>off
                                <br> -hist_size<br>
                                <h6>The number of cells in the output FDR histogram. The length of the histogram does
                                    not affect the running
                                    of the FindPeaks application, but only the maximum height for which data is shown in
                                    the final summary.
                                    Histogram always starts at one.
                                    If flag is omitted: histogram size is set to 30.</h6>
                                <input type="text" id="findpeak_hs" value="30" class="input_setting_text"
                                       name="findpeak_hs"/>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('findpeaks_optional_setting').style.display='none';JavaScript:findpeak_radio(findpeak_dir.value,findpeak_type.value,findpeak_filter.value,findpeak_hs.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('findpeaks_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_find"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_find" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Fejes, A. P., Robertson, G., Bilenky, M., Varhol, R., Bainbridge, M., & Jones, S. J. M. (2008).
                    Findpeaks 3.1: a tool for identifying areas of enrichment from massively parallel short-read
                    sequencing technology.Bioinformatics, 24(15), 1729.
                </div>
            </div>
            <!------------------------AREM------------------------------------------------------------->
            <div id="side_right_19" class="side_right" style="display:none">
                <form action="AREM_peakcalling" id="AREM_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('AREM_peakcalling','btn_AREM','wait_AREM');">
                    <div class="link" onclick="JavaScript:AREM_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right38" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down38" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_AREM" class="necessary_center" style="display:block">

                        <div class="blacktop_1">
                            Input the ChIP-Seq file

                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_AREM_file" id="input_AREM_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_arem" class="fileField" id="fileField_arem_tag"
                                       onchange="return (fileChange(this,'input_AREM_file' )&& checkFileExt(this.value,'input_AREM_file'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            Input the control file
                            <div class="tip_out"><img class="tip" id="tip32" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(32)"></div>

                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_AREM_control" id="input_AREM_control"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_arem" class="fileField" id="fileField_arem_control"
                                       onchange="return (fileChange(this,'input_AREM_control' )&& checkFileExt(this.value,'input_AREM_control'))"/>
                            </div>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:AREM_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right39" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down39" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_AREM" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_AREM" id="optionalParameters_default_AREM"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('AREM_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_AREM" id="optionalParameters_set_AREM"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('AREM_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="AREM_radio" class="radio_text"></div>
                        </div>
                        <div id="AREM_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                -g GSIZE, --gsize=GSIZE<br>
                                <h6>Effective genome size. It can be 1.0e+9 or 1000000000,
                                    or shortcuts:'hs' for human (2.7e9), 'mm' for mouse
                                    (1.87e9), 'ce' for C. elegans (9e7) and 'dm' for
                                    fruitfly (1.2e8), Default:hs</h6>
                                <input type="text" id="AREM_g" value="hs" class="input_setting_text" name="AREM_g"><br>
                                -s TSIZE, --tsize=TSIZE<br>
                                <h6>Tag size. This will overide the auto detected tag
                                    size. DEFAULT: 25</h6>
                                <input type="text" id="AREM_s" value="25" class="input_setting_text" name="AREM_s"><br>
                                --bw=BW <br>
                                <h6>Band width. This value is only used while building the
                                    shifting model. DEFAULT: 300</h6>
                                <input type="text" id="AREM_bw" value="300" class="input_setting_text"
                                       name="AREM_bw"><br>
                                -p PVALUE, --pvalue=PVALUE<br>
                                <h6>Pvalue cutoff for peak detection. DEFAULT: 1e-5</h6>
                                <input type="text" id="AREM_p" value="1e-5" class="input_setting_text"
                                       name="AREM_p"><br>
                                -m MFOLD, --mfold=MFOLD<br>
                                <h6>Select the regions within MFOLD range of high-
                                    confidence enrichment ratio against background to
                                    build model. The regions must be lower than upper
                                    limit, and higher than the lower limit. DEFAULT:10,30</h6>
                                <input type="text" id="AREM_m" value="10,30" class="input_setting_text"
                                       name="AREM_m"><br>
                                --slocal=SMALLLOCAL <br>
                                <h6>The small nearby region in basepairs to calculate
                                    dynamic lambda. This is used to capture the bias near
                                    the peak summit region. Invalid if there is no control
                                    data. DEFAULT: 1000</h6>
                                <input type="text" id="AREM_slocal" value="1000" class="input_setting_text"
                                       name="AREM_slocal"><br>
                                --shiftsize=SHIFTSIZE<br>
                                <h6>The arbitrary shift size in bp. When nomodel is true,
                                    MACS will use this value as 1/2 of fragment size.
                                    DEFAULT: 100</h6>
                                <input type="text" id="AREM_shift" value="100" class="input_setting_text"
                                       name="AREM_shift"><br>
                                --verbose=VERBOSE <br>
                                <h6>Set verbose level. 0: only show critical message, 1:
                                    show additional warning message, 2: show process
                                    information, 3: show debug messages. DEFAULT:2</h6>
                                <input type="text" id="AREM_verbose" value="2" class="input_setting_text"
                                       name="AREM_verbose"><br>
                                --fe-min=FEMIN <br>
                                <h6>For diagnostics, min fold enrichment to consider.
                                    DEFAULT: 0</h6>
                                <input type="text" id="AREM_femin" value="0" class="input_setting_text"
                                       name="AREM_femin"><br>
                                --EM-converge-diff=MIN_CHANGE<br>
                                <h6>The minimum entropy change between iterations before
                                    halting E-M steps. DEFAULT : 1e-05</h6>
                                <input type="text" id="AREM_EM_cd" value="1e-05" class="input_setting_text"
                                       name="AREM_EM_cd"><br>
                                --EM-min-score=MIN_SCORE<br>
                                <h6>Minimum enrichment score. Windows below this threshold
                                    will all look the same to the aligner. DEFAULT : 1.5</h6>
                                <input type="text" id="AREM_EM_min" value="1.5" class="input_setting_text"
                                       name="AREM_EM_min"><br>
                                --prior-snp=PRIOR_PROB_SNP<br>
                                <h6>Prior probability that a SNP occurs at any base in the
                                    genome. DEFAULT : 0.001</h6>
                                <input type="text" id="AREM_ps" value="0.001" class="input_setting_text" name="AREM_ps"><br>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('AREM_optional_setting').style.display='none';JavaScript:AREM_radio(findpeak_dir.value,findpeak_type.value,findpeak_filter.value,findpeak_hs.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('AREM_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_AREM"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_AREM" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>

            </div>
            <!------------------------Fseq------------------------------------------------------------->
            <div id="side_right_20" class="side_right" style="display:none">
                <form action="Fseq_peakcalling" id="Fseq_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('Fseq_peakcalling','btn_fseq','wait_fseq');">
                    <div class="link" onclick="JavaScript:Fseq_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right40" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down40" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_Fseq" class="necessary_center" style="display:block">

                        <div class="blacktop_1">
                            Input the ChIP-Seq file
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_Fseq_file" id="input_Fseq_file" class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_fseq" class="fileField" id="fileField_fseq_tag"
                                       onchange="return (fileChange(this,'input_Fseq_file' )&& checkFileExt(this.value,'input_Fseq_file'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            Input the control file
                            <div class="tip_out"><img class="tip" id="tip34" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(34)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_Fseq_control" id="input_Fseq_control"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_fseq" class="fileField" id="fileField_fseq_control"
                                       onchange="return (fileChange(this,'input_Fseq_control' )&& checkFileExt(this.value,'input_Fseq_control'))"/>
                            </div>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:Fseq_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right41" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down41" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_Fseq" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_Fseq" id="optionalParameters_default_Fseq"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('Fseq_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_Fseq" id="optionalParameters_set_Fseq"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('Fseq_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="Fseq_radio" class="radio_text"></div>
                        </div>
                        <div id="Fseq_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                -l <br>
                                <h6>feature length (default=600)</h6>
                                <input type="text" id="Fseq_l" value="600" class="input_setting_text"
                                       name="Fseq_l"/><br>
                                -s <br>
                                <h6>wiggle track step (default=1)</h6>
                                <input type="text" id="Fseq_s" value="1" class="input_setting_text" name="Fseq_s"/><br>
                                -t <br>
                                <h6>threshold (standard deviations) (default=4.0)</h6>
                                <input type="text" id="Fseq_t" value="4.0" class="input_setting_text"
                                       name="Fseq_t"/><br>
                                -v <br>
                                <h6>verbose output</h6>
                                <input type="radio" name="Fseq_v" value="1"/>on
                                <input type="radio" name="FSeq_v" value="2" checked="true"/>off<br>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('Fseq_optional_setting').style.display='none';JavaScript:Fseq_radio(Fseq_l.value,Fseq_s.value,Fseq_t.value,Fseq_v.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('Fseq_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_fseq"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_fseq" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Boyle, A. P., Guinney, J., Crawford, G. E., & Furey, T. S. (2008). F-seq: a feature density
                    estimator for high-throughput sequence tags.Bioinformatics, 24(21), 2537-2538.
                </div>
            </div>
            <!------------------------BroadPeak------------------------------------------------------------->
            <div id="side_right_21" class="side_right" style="display:none">
                <form action="BroadPeak_peakcalling" id="BroadPeak_peakcalling" enctype="multipart/form-data"
                      method="post" onsubmit="return searchData('BroadPeak_peakcalling','btn_broad','wait_broad');">
                    <div class="link" onclick="JavaScript:BroadPeak_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right42" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down42" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_BroadPeak" class="necessary_center" style="display:block">

                        <div class="blacktop_1">
                            Input the ChIP-Seq file
                            <div class="tip_out"><img class="tip" id="tip17" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(17)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_BroadPeak_file" id="input_BroadPeak_file"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_broad" class="fileField" id="fileField_broad_tag"
                                       onchange="return (fileChange(this,'input_BroadPeak_file' )&& checkFileExt(this.value,'input_BroadPeak_file'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">
                            Input the control file
                            <div class="tip_out"><img class="tip" id="tip36" src="./img/tip.png"
                                                      onclick="JavaScript:Tip_click(36)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_BroadPeak_control" id="input_BroadPeak_control"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_broad" class="fileField" id="fileField_broad_control"
                                       onchange="return (fileChange(this,'input_BroadPeak_control' )&& checkFileExt(this.value,'input_BroadPeak_control'))"/>
                            </div>
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:BroadPeak_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right43" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down43" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_BroadPeak" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_BroadPeak"
                                   id="optionalParameters_default_BroadPeak" class="optionalParameters_default"
                                   value="1" checked="true"
                                   onclick="document.getElementById('BroadPeak_optional_setting').style.display='none'"/>default
                            <input type="radio" name="optionalParameters_BroadPeak"
                                   id="optionalParameters_set_BroadPeak" class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('BroadPeak_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="BroadPeak_radio" class="radio_text"></div>
                        </div>
                        <div id="BroadPeak_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                -b: The size of bin<br>
                                <h6>default value 200 (bp). It should be consistent with the bedGraph format input
                                    file</h6>
                                <input type="text" id="BroadPeak_b" value="200" class="input_setting_text"
                                       name="BroadPeak_b"/><br>
                                -g: The size of the genome under consideration<br>
                                <h6>default value 3107677273 (bp) for the human genome
                                    (hg18).</h6>
                                <input type="text" id="BroadPeak_g" value="3107677273" class="input_setting_text"
                                       name="BroadPeak_g"/>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('BroadPeak_optional_setting').style.display='none';JavaScript:BroadPeak_radio(BroadPeak_b.value,BroadPeak_g.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('BroadPeak_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_broad"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_broad" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
            </div>
            <!------------------------Samtools-------------------------------------------------------------->
            <div id="side_right_22" class="side_right" style="display:none">
                <div class="link" style="cursor:hand;" onclick="JavaScript:samtools_option(1);">
                    <div class="arrow-right" id="arrow-right5" style="display:none"></div>
                    <div class="arrow-down" id="arrow-down5" style="display:block"></div>
                    Format convert
                    <h8>(convert SAM to BAM/convert BAM to SAM)</h8>
                </div>
                <div id="samtools_center_1" class="necessary_center" style="display:block">
                    <form action="SAM_TO_BAM" id="SAM_TO_BAM" enctype="multipart/form-data" method="post"
                          onsubmit="return searchData('SAM_TO_BAM','btn_sam1','wait_sam1')">
                        <div class="blacktop_1">Choose the convert type</div>
                        <div class="blackdown_1">
                            <input type="radio" name="samtools_convert_type" value="1"/>SAM to BAM
                            <input type="radio" name="samtools_convert_type" value="2"/>BAM to SAM
                        </div>
                        <div class="blacktop_1">Input the file to be converted</div>
                        <div class="blackdown_1">
                            <div class="file-box" style="display:block">
                                <input type="text" name="samtobam_origin" class="input_text" id="samtobam_origin"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_samtools_origin" class="fileField"
                                       id="fileField_samtools_origin"
                                       onchange="return (fileChange(this,'samtobam_origin' )&& checkFileExt(this.value,'samtobam_origin'))"/>
                            </div>
                        </div>

                        <input type="submit" value="Execute" class="Execute_btn_samtools" id="btn_sam1"/><s:fielderror
                            fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                        <div id="wait_sam1" class="Upload_wait_div" style="display:none;">
                            <img src="./img/wait.gif" class="Upload_wait"/>
                            Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                            access your job's results after the processing.
                        </div>
                    </form>
                </div>

                <div class="link" onclick="JavaScript:samtools_option(2);" style="cursor:hand;">
                    <div class="arrow-right" id="arrow-right6" style="display:none"></div>
                    <div class="arrow-down" id="arrow-down6" style="display:block"></div>
                    Sort BAM dataset
                </div>
                <form action="samtools_sort" id="samtools_sort" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('samtools_sort','btn_sam2','wait_sam2');">
                    <div id="samtools_center_2" class="necessary_center" style="display:none">
                        <div class="blacktop_1">Input .bam file</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_samtools_sort" id="input_samtools_sort"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_samtools_sort" class="fileField"
                                       id="fileField_samtools_sort"
                                       onchange="return (fileChange(this,'input_samtools_sort' )&& checkFileExt(this.value,'input_samtools_sort'))"/>
                            </div>
                        </div>

                        <input type="submit" value="Execute" class="Execute_btn_samtools" id="btn_sam2"/><s:fielderror
                            fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                        <div id="wait_sam2" class="Upload_wait_div" style="display:none;">
                            <img src="./img/wait.gif" class="Upload_wait"/>
                            Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                            access your job's results after the processing.
                        </div>
                    </div>
                </form>
                <div class="link" onclick="JavaScript:samtools_option(3);" style="cursor:hand;">
                    <div class="arrow-right" id="arrow-right7" style="display:none"></div>
                    <div class="arrow-down" id="arrow-down7" style="display:block"></div>
                    Index reference sequence in the FASTA ,BAM or CRAM format.
                </div>
                <form action="samtools_index" id="samtools_index" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('samtools_index','btn_sam3','wait_sam3');">
                    <div id="samtools_center_3" class="necessary_center" style="display:block">
                        <div class="blacktop_1">Choose the input format.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="samtools_index_radio" value="1"
                                   onclick="document.getElementById('samtools_index_fa').style.display='block';document.getElementById('samtools_index_bam').style.display='none';document.getElementById('samtools_index_cram').style.display='none';"/>FASTA
                            <input type="radio" name="samtools_index_radio" value="2"
                                   onclick="document.getElementById('samtools_index_bam').style.display='block';document.getElementById('samtools_index_fa').style.display='none';document.getElementById('samtools_index_cram').style.display='none';"/>BAM
                            <input type="radio" name="samtools_index_radio" value="3"
                                   onclick="document.getElementById('samtools_index_cram').style.display='block';document.getElementById('samtools_index_fa').style.display='none';document.getElementById('samtools_index_bam').style.display='none';"/>CRAM
                        </div>
                        <div class="blacktop_1">Input file to build index</div>
                        <div class="blackdown_1">
                            <div class="file-box" style="display:block">
                                <input type="text" name="input_samtools_index" id="input_samtools_index"
                                       class="input_text"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_samtools_index" class="fileField"
                                       id="fileField_samtools_index"
                                       onchange="return (fileChange(this,'input_samtools_index' )&& checkFileExt(this.value,'input_samtools_index'))"/>
                            </div>
                        </div>

                        <input type="submit" value="Execute" class="Execute_btn_samtools" id="btn_sam3"/><s:fielderror
                            fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                        <div id="wait_sam3" class="Upload_wait_div" style="display:none;">
                            <img src="./img/wait.gif" class="Upload_wait"/>
                            Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                            access your job's results after the processing.
                        </div>
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., & Homer, N., et al. (1987). The sequence
                    alignment/map (sam) format and samtools.Transplantation Proceedings, 19(1 Pt 2), 1653-4.
                </div>
            </div>
            <!------------------------bamCoverage-------------------------------------------------------->
            <div id="side_right_23" class="side_right" style="display: none">
                <form action="bamCoverage_exe" id="bamCoverage_exe" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('bamCoverage_exe','btn_bam','wait_bam');">
                    <div id="bamCoverage_center" class="necessary_center">
                        <div class="blacktop_1">Choose the format of the input file</div>
                        <div class="blackdown_1">
                            <input type="radio" name="convert_sam" value="1">SAM
                            <input type="radio" name="convert_sam" value="2">BAM
                        </div>
                        <div class="blacktop_1">Input the file to convert</div>
                        <div class="blackdown_1">
                            <div class="file-box" style="display:block">
                                <input type="text" name="convert_file" class="input_text" id="convert_file"/>
                                <input type='button' class='btn' value='Choose File'/>
                                <input type="file" name="fileField_samtools_convert" class="fileField"
                                       id="fileField_samtools_convert"
                                       onchange="return (fileChange(this,'convert_file' )&& checkFileExt(this.value,'convert_file'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Coverage file format</div>
                        <div class="blackdown_1">
                            <input type="radio" name="convert_for" value="1">bedgraph
                            <input type="radio" name="convert_for" value="2">bigwig
                        </div>

                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_bam"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_bam" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Ramírez, F., Dündar, F., Diehl, S., Grüning, B. A., & Manke, T. (2014). Deeptools: a flexible
                    platform for exploring deep-sequencing data.Nucleic Acids Research, 42(W1), 187-91.
                </div>
            </div>
            <!------------------------IGV------------------------------------------------------------->
            <%--<div id="side_right_22" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:IGV_mapping();"style="cursor:hand;">
                    <div class="arrow-right" id="arrow-right44" style="display:none"></div>
                    <div class="arrow-down"  id="arrow-down44" style="display:block"></div>
                    Visualization of mapping
                </div>
                <div id="IGV_center_1" class="necessary_center" style="display:block;overflow-y:scroll;">
                    <s:form action="mapping_visual">
                        <div class="blacktop_1">Input the Sam file(after mapping)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="sampath" id="input_sam_mavisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the reference file</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="workflowCustom_reference" id="input_reference_mavisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the path to save result</div>
                        <div class="blackdown_1">
                            <input type="text" name="workflowCustom_path" id="workflowCustom_path" class="input_text"/>
                        </div>
                        <div class="blacktop_1">Input the scope of the gene</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type='text' name='mapping_visual_scope' id="input_scope_mavisual" class='input_text' />
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file"  class="fileField"  onchange="document.getElementById('input_scope_mavisual').value=this.value" /><br>
                            </div>
                        </div>
                        <s:submit value="View" cssStyle="margin-bottom:10px;margin-top:10px;margin-left:10px;width:80px; height:30px; border: 01px ; background:#F9A32D;color: #ffffff; border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;border-top-left-radius: 5px;border-top-right-radius: 5px;"></s:submit>
                    </s:form>
                    <div class="outer" onclick="JavaScript:expandPhoto();">
                        <img  src="http://192.168.1.113:9080/ChIP-Seq_linux_war/img/mapping_visual.png" />
                    </div>
                </div>


                <div class="link" onclick="JavaScript:IGV_peakcalling();"style="cursor:hand;">
                    <div class="arrow-right" id="arrow-right45" style="display:block"></div>
                    <div class="arrow-down"  id="arrow-down45" style="display:none"></div>
                    Visualization of peakcalling
                </div>
                <div id="IGV_center_2" class="optional_center" style="display:none;overflow-y:scroll;">
                    <s:form action="peakcalling_visual">
                        <div class="blacktop_1">Input the Sam file(after mapping) of treatment</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="bampath_treatment" id="input_samtreat_pevisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the Sam file(after mapping) of control</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="bampath_control" id="input_samcontrol_pevisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the bed file(after peakcalling)</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="peakpath" id="input_peak_pevisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the reference file</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="workflowCustom_reference" id="input_refer_pevisual" class="input_text"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Input the path to save result</div>
                        <div class="blackdown_1">
                            <input type="text" name="workflowCustom_path" id="input_path_pevisual" class="input_text"/>
                        </div>
                        <div class="blacktop_1">Input the scope of the gene</div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type='text' name='peakcalling_scope' id="input_scope_pevisual" class='input_text' />
                                <input type='button' class='btn' value='Choose File' />
                                <input type="file"  class="fileField"  onchange="document.getElementById('input_scope_pevisual').value=this.value" /><br>
                            </div>
                        </div>
                        <s:submit value="View" cssStyle="margin-bottom:10px;margin-top:10px;margin-left:10px;width:80px; height:30px; border: 01px ; background:#F9A32D;color: #ffffff; border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;border-top-left-radius: 5px;border-top-right-radius: 5px;"></s:submit>
                    </s:form>
                    <div class="outer" onclick="JavaScript:expandPhoto1();">
                        <img src="http://192.168.1.113:9080/ChIP-Seq_linux_war/img/peakcalling_visual.png"/>
                    </div>
                </div>
            </div>--%>

        </div>
    </div>
    <div id="foot">
        Copyright © 2016 - CSU-Bioinformatics Group | All Rights Reserved
    </div>
  </div>
</body>
</html>
