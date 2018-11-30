<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/9 0009
  Time: 上午 8:56
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
    <script language="javascript">
        function del() {
            var msg = "If you leave this page, the operation will be stopped!";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }

        window.onload = function () {
            var count = 1;
            var login =<%=session.getAttribute("login")%>;
            var obj = document.getElementById('choose_home');
            obj.onclick = function () {
                var x = document.getElementsByClassName("Upload_wait_div");
                var i;
                for (i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (del()) {
                            if (login == '2') {
                                window.location.href = "home.jsp";
                            }
                            else {
                                window.location.href = "home_initial.jsp";
                            }
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        if (login == '2') {
                            window.location.href = "home.jsp";
                        }
                        else {
                            window.location.href = "home_initial.jsp";
                        }
                    }
                }
            }
            var obj = document.getElementById('choose_tool');
            obj.onclick = function () {
                var x = document.getElementsByClassName("Upload_wait_div");
                var i;
                for (i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (del()) {
                            window.location.href = "Tools_initial.jsp";
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        window.location.href = "Tools_initial.jsp";
                    }
                }
            }
            var obj = document.getElementById('choose_meme');
            obj.onclick = function () {
                var x = document.getElementsByClassName("Upload_wait_div");
                var i;
                for (i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (del()) {
                            window.location.href = "MEME.jsp";
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        window.location.href = "MEME.jsp";
                    }
                }
            }
            var obj = document.getElementById('choose_work');
            obj.onclick = function () {
                var x = document.getElementsByClassName("Upload_wait_div");
                var i;
                for (i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (del()) {
                            window.location.href = "WorkFlow.jsp";
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        window.location.href = "WorkFlow.jsp";
                    }
                }
            }
            var obj = document.getElementById('choose_help');
            obj.onclick = function () {
                var x = document.getElementsByClassName("Upload_wait_div");
                var i;
                for (i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (del()) {
                            window.location.href = "ContactUs.jsp";
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        window.location.href = "ContactUs.jsp";
                    }
                }
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
            var arr = ["csv"];
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
                alert("The file uploaded should be in .bed");
                document.getElementById(box).value="";
                return false;
            }
        }

        window.onload=function(){
            var obj1 = document.getElementById('choose_home');
            var obj2 = document.getElementById('choose_tool');
            var obj3 = document.getElementById('choose_meme');
            var obj4 = document.getElementById('choose_work');
            var obj5 = document.getElementById('choose_help');
            var msg = "If you leave this page, the operation will be stopped!";
            var x = document.getElementsByClassName("Upload_wait_div");
            var signal="true";
            obj1.onclick = function (){
                for (var i = 0; i < x.length; i++){
                    if (x[i].style.display == 'block'){
                        if (confirm(msg)) {
                            signal="true";
                        }
                        else {
                            signal="false";
                            break;
                        }
                    }
                }
                if(signal=="true"){
                    window.location.href = "home_initial.jsp";
                }
                else{
                }
            }

            obj2.onclick = function () {
                for (var i = 0; i < x.length; i++){
                    if (x[i].style.display == 'block'){
                        if (confirm(msg)) {
                            signal="true";
                        }
                        else {
                            signal="false";
                            break;
                        }
                    }
                }
                if(signal=="true"){
                    window.location.href = "Tools_initial.jsp";
                }
                else{
                }
            }

            obj3.onclick = function () {
                for (var i = 0; i < x.length; i++){
                    if (x[i].style.display == 'block'){
                        if (confirm(msg)) {
                            signal="true";
                        }
                        else {
                            signal="false";
                            break;
                        }
                    }
                }
                if(signal=="true"){
                    window.location.href = "MEME.jsp";
                }
                else{
                }
            }

            obj4.onclick = function () {
                for (var i = 0; i < x.length; i++){
                    if (x[i].style.display == 'block'){
                        if (confirm(msg)) {
                            signal="true";
                        }
                        else {
                            signal="false";
                            break;
                        }
                    }
                }
                if(signal=="true"){
                    window.location.href = "WorkFlow.jsp";
                }
                else{
                }
            }

            obj5.onclick=function() {
                for (var i = 0; i < x.length; i++){
                    if (x[i].style.display == 'block'){
                        if (confirm(msg)) {
                            signal="true";
                        }
                        else {
                            signal="false";
                            break;
                        }
                    }
                }
                if(signal=="true"){
                    window.location.href = "ContactUs.jsp";
                }
                else{
                }
            }

            if("${flag}"=="1"||"${flag}"=="2"||"${flag}"=="3"){
                for(var i=1;i<=3;i++){
                    document.getElementById("side_right_"+i).style.display="none";

                }
                for(var g=1;g<=6;g++){
                    document.getElementById("detail_text_"+i).style.display="none";
                }
                for(var j=1;j<=3;j++){
                    document.getElementById("side_son_"+j).style.backgroundColor="#dadada";
                    document.getElementById("side_son_"+j).style.color="#555555";
                }
                document.getElementById("side_son_"+"${flag}").style.backgroundColor="#57779e";
                document.getElementById("side_son_"+"${flag}").style.color="#ffffff";
                document.getElementById("side_right_"+"${flag}").style.display="block";
                var h=${flag}+3;
                document.getElementById("detail_text_"+h).style.display="block";
            }


            var id_validate=parseInt('${flag_validate}');
            if(id_validate==2){
                for(var i=1;i<=6;i++){
                    document.getElementById("detail_text_"+i).style.display="none";
                }
            }

            if('${Session}'=='Y')
            {
                document.getElementById("login_spanUpdate").style.display="block";
            }
            else{
                document.getElementById("login_spanUpdate").style.display="none";
            }
        }

        function side_right_show(divId){
            for(var i=1;i<=4;i++){
                document.getElementById("side_right_"+i).style.display="none";
                document.getElementById("side_son_"+i).style.backgroundColor="#dadada";
                document.getElementById("side_son_"+i).style.color="#555555";
//                document.getElementById("Demo_btn"+i).style.display="none";
            }
            document.getElementById("side_son_"+divId).style.backgroundColor="#57779e";
            document.getElementById("side_son_"+divId).style.color="#ffffff";
            document.getElementById("side_right_"+divId).style.display="block";
//            document.getElementById("Demo_btn"+divId).style.display="block";
        }
        function recentShow(){
            window.location.href = "RecentJob.jsp";
        }

    </script>
    <style type="text/css">
        h5 {
            font-size: 23px;
            font-weight: 400;
            margin-left: -15px;
        }
        #logo_span{
            width:268px;
            height:109px;
            float:left;
            margin-left:6%;
            margin-top:23px;
            background-image: url("./img/logonew1.png");
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
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css">
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
        <div id="left_side">
            <div class="side_radio"></div>
            <div class="side_top"><h5>Downstream analysis</h5></div>

            <div class="side_parent">
                <div class="arrow1" id="arrow3" style="display: block"></div>
                <div class="arrow2" id="arrow4" style="display:none"></div>
                Gene ontology analysis
            </div>
            <div class="side_son" id="side_son_1" style="background-color: rgb(87, 119, 158);color:#ffffff" onclick="JavaScript:side_right_show(1)">GOSEQ</div>

            <div class="side_parent">
                <div class="arrow1" id="arrow5" style="display: block"></div>
                <div class="arrow2" id="arrow6" style="display:none"></div>
                Pathway analysis</div>
            <div class="side_son" id="side_son_2" onclick="JavaScript:side_right_show(2)">KEGG</div>


            <div class="side_parent">
                <div class="arrow1" id="arrow1" style="display: block"></div>
                <div class="arrow2" id="arrow2" style="display:none"></div>
                Cluster analysis</div>
            <div class="side_son" id="side_son_3" onclick="JavaScript:side_right_show(3)">Sample clustering</div>
            <div class="side_son" id="side_son_4" onclick="JavaScript:side_right_show(4)">Two-dimensional clustering</div>
            <!--
                       <div id="demo_describe">
                            <span style="font-size: 18px ;color:#ffffff">Demo dataset:</span>  <br>
                            <input type="button" id="Demo_btn1" class="Demo_btn" value="Use demo dataset" style="display:block;"onclick="window.location.reload();"/>
                            <input type="button" id="Demo_btn2" class="Demo_btn" value="Use demo dataset" style="display:none;"onclick="window.location.reload();"/>(Click here to fill the input.)<br>

                            <span style="font-size:16px;color:#ffffff">all experiments:</span>GEO GSE90060<br>
                            <span style="font-size:16px;color:#ffffff">design:</span>early- and midsecretory phase of 17 healthy women<br>
                            <span style="font-size:16px;color:#ffffff">Input:</span>DMP tools:Limma's results<br>
                            <span style="font-size:16px;color:#ffffff">The above demo dataset is from:</span> <br>
                            Kukushkina V, Modhukur V,et al. DNA methylation changes in endometrium and correlation with gene expression during the transition from pre-receptive to receptive phase[J]. Sci Rep, 2017, 7(1):3916.
                            <br>
                        </div>
            -->

        </div>
        <div id="side_right">
            <!------------------------GOSEQ------------------------------------------------------------------>
            <div class="side_right" id="side_right_1" style="display:block">
                <div id="attention1" class="blackdown_tips_1">
                    The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
                    <br>
                </div>
                <div class="link" onclick="JavaScript:nece_opt_show_GO_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down3" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right3" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="GO" id="GO_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('GO_exe','btn_GO','wait_GO')">
                    <div class="necessary_center" id="necessary_center_GO" style="display:block">
                        <div class="blacktop_1">
                            Please input the file of significant CpG sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'myDMP.csv', which is the output file of DMP step in Tools. You can also input your own file of significant CpG sites(.csv)"></div>
                            <s:fielderror fieldName="input_go" cssStyle="color:red;float:right;margin-top:0px;"/>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_go" class="input_text" value="DMP.csv" id="input_go"/>
                                <input type='button' class='btn1' value='Choose File'/>
                                <input type="file" name="Go_file" class="fileField"
                                       onchange="return( fileChange(this,'input_go')&& checkFileExt(this.value,'input_go'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"
                        </div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_GO_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down4" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right4" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div class="optional_center" id="optional_center_GO" style="display:block">
                        <div class="blacktop_1">Optional parameter</div>
                        <div class="blackdown_1">
                            <input type="radio" name="GO_option" id="GO_option_default" value="1" checked="true"
                                   onclick="document.getElementById('GO_option_input_setting').style.display='none';document.getElementById('GO_radio').style.visibility='hidden'"
                                   ;/>default
                            <input type="radio" name="GO_option" id="GO_option_setting" value="2"
                                   onclick="document.getElementById('GO_option_input_setting').style.display='block'" ;/>set the parameters by yourself
                            <div id="GO_radio" class="radio_text"></div>
                        </div>
                        <div class="inputOption_setting" id="GO_option_input_setting" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                    <%--adj.P.Val&nbsp;&nbsp;&nbsp;--%>
                                    <%--<input type="text" id="adj_P_Val" name="adj_P_Val" class="input_setting_text" value="0.05"/><br>--%>
                                    <%--<h6>select all CpG sites that have adjusted p-value of less than 0.05,default=0.05</h6>--%>


                                plot.bias&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plot_bias" value="FALSE" checked>False
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="plot_bias" value="TRUE">True
                                </label>
                                <h6>logical, if true a plot showing the bias due to the
                                    differing numbers of probes per gene will be displayed.(default = FALSE)</h6>

                                prior.prob&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="prior_prob" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="prior_prob" value="FALSE">False
                                </label>
                                <h6>logical, if true will take into account the probability of
                                    significant differentially methylation due to numbers of
                                    probes per gene. If false, a hypergeometric test is performed
                                    ignoring any bias in the data.
                                    .(default = TRUE)</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('GO_option_input_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('GO_option_input_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_GO_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down49" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right49" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_GO" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('histogram_option').style.display='block'"/>GO histogram
                            <input type="radio" name="plot" class="optionalParameters_set" value="2" onclick="document.getElementById('histogram_option').style.display='none'"/>none
                        </div>
                        <div id="histogram_option" class="inputOption_setting" style="display:none">
                            <div id="histogram_option_center" class="inputOption_setting_center">
                                number&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>maximum number of top GO terms  to list.For all terms or all pathways, set ‘number=Inf’.default=30.</h6>
                                <input type="text" class="input_setting_text" name="number"
                                       value="30"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('histogram_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('histogram_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_GO"/><s:fielderror fieldName="check1"
                                                                                                        cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_GO" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait...
                    </div>

                </s:form>

                <!--
          <div id="detail_text_2" class="detail_tip" style="display:none" >
              If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
              You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
          </div>
          <div id="detail_2" class="inputOption_setting_de" style="display:none;">
              <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                  ${stdoutlist}<br>
                  <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
              </div>
              <div id="detail_text_5" class="detail_tip_demo" style="display:none" >
                  You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
              </div>
              <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                  <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                      ${stdoutlist}<br>
                      <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                  </div>
              </div>
          </div>
          -->
            </div>
            <!-------------------------------------kegg----------------------------------->
            <div class="side_right" id="side_right_2" style="display:none;">
                <div id="attention2" class="blackdown_tips_1">
                    The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
                    <br>
                </div>
                <div class="link" onclick="JavaScript:nece_opt_show_KEGG_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down5" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right5" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="KEGG" id="KEGG_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('KEGG_exe','btn_KEGG','wait_KEGG')">
                    <div class="necessary_center" id="necessary_center_KEGG" style="display:block">
                        <div class="blacktop_1">
                            Please input the file of significant CpG sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'myDMP.csv', which is the output file of DMP step in Tools. You can also input your own file of significant CpG sites(.csv)"></div>
                            <s:fielderror fieldName="input_kegg" cssStyle="color:red;float:right;margin-top:0px;"/>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_kegg" class="input_text" value="DMP.csv" id="input_kegg"/>
                                <input type='button' class='btn1' value='Choose File'/>
                                <input type="file" name="KEGG_file" class="fileField"
                                       onchange="return( fileChange(this,'input_kegg')&& checkFileExt(this.value,'input_kegg'))"/>
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"
                        </div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_KEGG_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down6" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right6" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div class="optional_center" id="optional_center_KEGG" style="display:block">
                        <div class="blacktop_1">Optional parameter</div>
                        <div class="blackdown_1">
                            <input type="radio" name="KEGG_option" id="KEGG_option_default" value="1" checked="true"
                                   onclick="document.getElementById('KEGG_option_input_setting').style.display='none';document.getElementById('KEGG_radio').style.visibility='hidden'"
                                   ;/>default
                            <input type="radio" name="KEGG_option" id="KEGG_option_setting" value="2"
                                   onclick="document.getElementById('KEGG_option_input_setting').style.display='block'" ;/>set the
                            parameters by yourself
                            <div id="KEGG_radio" class="radio_text"></div>
                        </div>
                        <div class="inputOption_setting" id="KEGG_option_input_setting" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                    <%--adj.P.Val&nbsp;&nbsp;&nbsp;--%>
                                    <%--<input type="text"  name="adj_P_Val" class="input_setting_text" value="0.05"/><br>--%>
                                    <%--<h6>select all CpG sites that have adjusted p-value of less than 0.05,default=0.05</h6>--%>


                                plot.bias&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plot_bias" value="FALSE" checked>False
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="plot_bias" value="TRUE">True
                                </label>
                                <h6>logical, if true a plot showing the bias due to the
                                    differing numbers of probes per gene will be displayed.(default = FALSE)</h6>

                                prior.prob&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="prior_prob" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="prior_prob" value="FALSE">False
                                </label>
                                <h6>logical, if true will take into account the probability of
                                    significant differentially methylation due to numbers of
                                    probes per gene. If false, a hypergeometric test is performed
                                    ignoring any bias in the data.
                                    .(default = TRUE)</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('KEGG_option_input_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('KEGG_option_input_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_KEGG_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_KEGG" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('bubble_option').style.display='block'"/>KEGG bubble diagram
                            <input type="radio" name="plot" class="optionalParameters_set" value="2" onclick="document.getElementById('bubble_option').style.display='none'"/>none
                        </div>
                        <div id="bubble_option" class="inputOption_setting" style="display:none">
                            <div id="bubble_option_center" class="inputOption_setting_center">
                                number&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>maximum number of  top KEGG pathways to list.For all terms or all pathways, set ‘number=Inf’.default=20.</h6>
                                <input type="text" class="input_setting_text" name="number"
                                       value="20"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('bubble_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('bubble_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_KEGG"/><s:fielderror fieldName="check1"
                                                                                                          cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_KEGG" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait...
                    </div>
                </s:form>

                <!--
          <div id="detail_text_2" class="detail_tip" style="display:none" >
              If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
              You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
          </div>
          <div id="detail_2" class="inputOption_setting_de" style="display:none;">
              <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                  ${stdoutlist}<br>
                  <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
              </div>
              <div id="detail_text_5" class="detail_tip_demo" style="display:none" >
                  You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
              </div>
              <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                  <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                      ${stdoutlist}<br>
                      <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                  </div>
              </div>
          </div>
          -->
            </div>
            <!-------------------------------------sam_clustre----------------------------------->
            <div class="side_right" id="side_right_3" style="display:none;">
                <div id="attention2" class="blackdown_tips_1">
                    The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
                    <br>
                </div>
                <div class="link" onclick="JavaScript:nece_opt_show_Cluster1_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down9" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right9" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Cluster1" id="Cluster1_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('Cluster1_exe','btn_Cluster1','wait_Cluster1')">
                    <div class="necessary_center" id="necessary_center_Cluster1" style="display:block">
                        <div class="blacktop_1">
                            Please input the DNA methylation beta values or M values matrix file of significant CpG sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.The uploaded file is a DNA methylation beta values or M values matrix of significant CpG sites."></div>
                            <s:fielderror fieldName="input_cluster1" cssStyle="color:red;float:right;margin-top:0px;"/>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_cluster1" class="input_text" value="myNorm_dmps.csv" id="input_cluster1"/>
                                <input type='button' class='btn1' value='Choose File'/>
                                <input type="file" name="Cluster1_file" class="fileField"
                                       onchange="return( fileChange(this,'input_cluster1')&& checkFileExt(this.value,'input_cluster1'))"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_Cluster1_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down10" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right10" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div class="optional_center" id="optional_center_Cluster1" style="display:block">
                        <div class="blacktop_1">Optional parameter</div>
                        <div class="blackdown_1">
                            <input type="radio" name="Cluster1_option" id="Cluster1_option_default" value="1" checked="true"
                                   onclick="document.getElementById('Cluster1_option_input_setting').style.display='none';document.getElementById('Cluster1_radio').style.visibility='hidden'"
                                   ;/>default
                            <input type="radio" name="Cluster1_option" id="Cluster1_option_setting" value="2"
                                   onclick="document.getElementById('Cluster1_option_input_setting').style.display='block'" ;/>set the
                            parameters by yourself
                            <div id="Cluster1_radio" class="radio_text"></div>
                        </div>
                        <div class="inputOption_setting" id="Cluster1_option_input_setting" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                Cluster method&nbsp;&nbsp;<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="complete" checked>complete
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="ward.D">ward.D
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="ward.D2" checked>ward.D2
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="single">single
                                </label><br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="mcquitty">mcquitty
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="median" checked>median
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="centroid">centroid
                                </label>
                                <h6>Hierarchical cluster analysis on a set of dissimilarities and methods for analyzing it. The agglomeration method to be used.
                                    This should be (an unambiguous abbreviation of) one of ‘"ward.D"’, ‘"ward.D2"’,‘"single"’, ‘"complete"’, ‘"average"’ (= UPGMA), ‘"mcquitty"’(= WPGMA), ‘"median"’ (= WPGMC) or ‘"centroid"’ (= UPGMC).
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('Cluster1_option_input_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('Cluster1_option_input_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_Cluster1_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down59" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right59" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_Cluster1" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true"/>sample clustering diagram
                            <input type="radio" name="plot" class="optionalParameters_default" value="2" />dendrogram
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Cluster1"/><s:fielderror fieldName="check1"
                                                                                                              cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Cluster1" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait...
                    </div>
                </s:form>

                <!--
          <div id="detail_text_2" class="detail_tip" style="display:none" >
              If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
              You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
          </div>
          <div id="detail_2" class="inputOption_setting_de" style="display:none;">
              <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                  ${stdoutlist}<br>
                  <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
              </div>
              <div id="detail_text_5" class="detail_tip_demo" style="display:none" >
                  You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
              </div>
              <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                  <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                      ${stdoutlist}<br>
                      <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                  </div>
              </div>
          </div>
          -->
            </div>
            <!-------------------------------------2_cluster----------------------------------->
            <div class="side_right" id="side_right_4" style="display:none;">
                <div id="attention2" class="blackdown_tips_1">
                    The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
                    <br>
                </div>
                <div class="link" onclick="JavaScript:nece_opt_show_Cluster2_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down11" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right11" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Cluster2" id="Cluster2_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('Cluster2_exe','btn_Cluster2','wait_Cluster2')">
                    <div class="necessary_center" id="necessary_center_Cluster2" style="display:block">
                        <div class="blacktop_1">
                            Please input the DNA methylation beta values or M values matrix file of significant CpG sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.The uploaded file is a DNA methylation beta values or M values matrix of significant CpG sites."></div>
                            <s:fielderror fieldName="input_cluster2" cssStyle="color:red;float:right;margin-top:0px;"/>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_cluster2" class="input_text" value="myNorm_dmps.csv" id="input_cluster2"/>
                                <input type='button' class='btn1' value='Choose File'/>
                                <input type="file" name="cluster2_file" class="fileField"
                                       onchange="return( fileChange(this,'input_cluster2')&& checkFileExt(this.value,'input_cluster2'))"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_Cluster2_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down12" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right12" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div class="optional_center" id="optional_center_Cluster2" style="display:block">
                        <div class="blacktop_1">Optional parameter</div>
                        <div class="blackdown_1">
                            <input type="radio" name="Cluster2_option" id="Cluster2_option_default" value="1" checked="true"
                                   onclick="document.getElementById('Cluster2_option_input_setting').style.display='none';document.getElementById('Cluster2_radio').style.visibility='hidden'"
                                   ;/>default
                            <input type="radio" name="Cluster2_option" id="Cluster2_option_setting" value="2"
                                   onclick="document.getElementById('Cluster2_option_input_setting').style.display='block'" ;/>set the
                            parameters by yourself
                            <div id="Cluster2_radio" class="radio_text"></div>
                        </div>
                        <div class="inputOption_setting" id="Cluster2_option_input_setting" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                Cluster method&nbsp;&nbsp;<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="complete" checked>complete
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="ward.D">ward.D
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="ward.D2" checked>ward.D2
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="single">single
                                </label><br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="mcquitty">mcquitty
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="median" checked>median
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="method" value="centroid">centroid
                                </label>
                                <h6>Hierarchical cluster analysis on a set of dissimilarities and methods for analyzing it. The agglomeration method to be used.
                                    This should be (an unambiguous abbreviation of) one of ‘"ward.D"’, ‘"ward.D2"’,‘"single"’, ‘"complete"’, ‘"average"’ (= UPGMA), ‘"mcquitty"’(= WPGMA), ‘"median"’ (= WPGMC) or ‘"centroid"’ (= UPGMC).
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('Cluster2_option_input_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('Cluster2_option_input_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_Cluster2_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down60" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right60" style="display:none"></div>
                        Visualization
                    </div>

                    <div id="vis_center_Cluster2" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" />heatmap
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Cluster2"/><s:fielderror fieldName="check1"
                                                                                                              cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Cluster2" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait...
                    </div>
                </s:form>

                <!--
          <div id="detail_text_2" class="detail_tip" style="display:none" >
              If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
              You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
          </div>
          <div id="detail_2" class="inputOption_setting_de" style="display:none;">
              <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                  ${stdoutlist}<br>
                  <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
              </div>
              <div id="detail_text_5" class="detail_tip_demo" style="display:none" >
                  You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
              </div>
              <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                  <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                      ${stdoutlist}<br>
                      <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                  </div>
              </div>
          </div>
          -->
            </div>
            <!-------------------------------------over----------------------------------->

        </div>
    </div>
    <div id="foot">
        Copyright © 2018 - CSU-Bioinformatics Group | All Rights Reserved
    </div>
</div>
</body>
<script>
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</html>
