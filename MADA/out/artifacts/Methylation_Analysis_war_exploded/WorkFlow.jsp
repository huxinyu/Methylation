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
    <link rel="stylesheet" href="./css/workflow.css">
    <script src="./jquery-1.11.1/jquery.js"></script>
    <script src="./layer/layer.js"></script>
    <script src="./js/banner.js"></script>
    <script src="./js/workflow.js"></script>
    <script src="./js/jquery.easyui.min.js"></script>
    <script src="./js/jquery.min.js"></script>
    <script language="JavaScript">
        function ValidateChar(s) {
            var valid = false;
            var pattern = new Array("~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")", ";", "\"", "'", "\\", "<", ">", "?", "/", "<<", ">>", "+");
            for (var i = 0; i < pattern.length; i++) {
                if (s.indexOf(pattern[i]) >= 0) {
                    valid = true;
                    break;
                }
                else {
                    valid = false;
                }
            }
            if (valid) {
                return true;
            }
            else {
                return false;
            }
        }
        function searchData(id, btnbox, waitbox) {
            var flag = "valid";
            var frm = document.getElementById(id).getElementsByTagName("input");
            for (var i = 0; i < frm.length; i++) {
                if (frm[i].type == "text") {
                    if (frm[i].value == "" || frm[i].value == null) {
                        flag = "empty";
                        break;
                    }
                    else {
                        if (ValidateChar(frm[i].value)) {
                            flag = "invalid";
                            break;
                        }
                        else {
                            flag = "valid";
                        }
                    }
                }
            }
            if (flag == "invalid") {
                alert("The input contains invalid character,please input again!");
                return false;
            }
            else if (flag == "empty") {
                alert("The input cannot be empty!");
                return false;
            }
            else {
                document.getElementById(btnbox).style.backgroundColor = '#666666';
                document.getElementById(waitbox).style.display = 'block';
                return true;
            }
        }

        function checkFileExt(filename, box) {
            var flag = null; //状态
            var arr = ["zip"];
            //取出上传文件的扩展名
            var index = filename.lastIndexOf(".");
            var ext = filename.substr(index + 1);
            //循环比较
            if (document.getElementById(box).value == "" || document.getElementById(box).value == null) {
                flag = "empty";
            }
            else {
                for (var i = 0; i < arr.length; i++) {
                    if (ext == arr[i]) {
                        flag = "valid"; //一旦找到合适的，立即退出循环
                        break;
                    }
                    else {
                        flag = "invalid";
                    }
                }
            }

            //条件判断
            if (flag == "valid") {
                return true;
            }
            else if (flag == "empty") {
                alert("The input cannot be empty!");
                document.getElementById(box).value = "";
                return false;
            }
            else {
                alert("The file uploaded should be in right format!");
                document.getElementById(box).value = "";
                return false;
            }
        }
        function fileChange(target, box) {
            var filename;
            filename = target.files[0].name;
            var fileSize;
            var filemaxsize = 2048 * 1024;//1G
            fileSize = target.files[0].size;
            var size = fileSize / 1024;
            if (size > filemaxsize) {
                alert("Upload files can not be larger than 2G!");
                document.getElementById(box).value = "";
                target.value = "";
                return false;
            }
            if (size <= 0) {
                alert("Upload files can not be empty!");
                target.value = "";
                return false;
            }
            else {
                document.getElementById(box).value = filename;
                return true;
            }
        }
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
        //flag显示define还是result
        if ("${flag}" == "1" || "${flag}" == "2" || "${flag}" == "3") {
            for (var i = 1; i <= 3; i++) {
                document.getElementById("side_right_" + i).style.display = "none";
                document.getElementById("side_son_" + i).style.backgroundColor = "#dadada";
                document.getElementById("side_son_" + i).style.color = "#555555";
            }
            document.getElementById("side_son_" + '${flag}').style.backgroundColor = "#57779e";
            document.getElementById("side_son_" + '${flag}').style.color = "#ffffff";
            document.getElementById("side_right_" + '${flag}').style.display = "block";
        }

        //是否显示命令行查看框
        if ('${flag_command}' == 1) {
            document.getElementById("workflow_resultTips").style.display = "block";
        }
        else {
            document.getElementById("workflow_resultTips").style.display = "none";
        }

        <!--
                 var count = 1;
                 function Tip_click(TipId) {
                     var id = "#tip" + TipId;
                     if (TipId == 1) {
                         if (count == 1) {
                             layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
                             count++;
                         }
                         else {
                             layer.close(layer.index);
                             count--;
                         }
                     }
                     else if(TipId==2){
                         if(count==1){
                             layer.tips('Only five method (SWAN、 Funnorm、 Illumina、 Noob、 SQN) have this function.',id,{tips:[1,'#fa7923'],time:10000});
                             count++;
                         }
                         else{
                             layer.close(layer.index);
                             count--;
                         }

                     }
                     else if(TipId==3){
                         if(count==1){
                             layer.tips('Choose the preprocessing tool you want to use.',id,{
                                 tips:[1,'#fa7923'],time:10000
                             });
                             count++;}
                         else{
                             layer.close(layer.index);
                             count--;
                         }
                     }
                     else if(TipId==4) {
                         if(count==1) {
                             layer.tips('Choose the differential methylation analysis tool you want to use.', id, {
                                 tips: [1, '#fa7923'],time:10000
                             });
                             count++;
                         }
                         else{
                             layer.close(layer.index);
                             count--;
                         }
                     }
                 else{}
                 }
        -->
        function recentShow(){
            window.location.href = "RecentJob.jsp";
        }
        var count=1;
        function Tip_click(TipId){
            var id="#tip"+TipId;
            if(TipId==1){
                if(count==1){
                    layer.tips('Please input .fastq format file',id,{tips:[1,'#fa7923'],time:10000});
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==2){
                if(count==1){
                    layer.tips('If you choose to input reference ,please input .fasta format file.',id,{tips:[1,'#fa7923'],time:10000});
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }

            }
            else if(TipId==3){
                if(count==1){
                    layer.tips('Please input .fastq format file.',id,{tips:[1,'#fa7923'],time:10000});
                    count++;}
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==4) {
                if(count==1) {
                    layer.tips('Choose the mapping tool you want to use.', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==5){
                if(count==1) {
                    layer.tips('Choose the Peak calling tool you want to use."S" means the tool is suitable for detecting the sharp peaks, "B" means the tool is suitable for detecting the broad peaks.', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==6){
                if(count==1) {
                    layer.tips('Newly generated file:generated by the workflow finished just now.', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==7){
                if(count==1) {
                    layer.tips('Specify the name of the chrom and the loci(e.g.,chr1:113,114,120-113,164,120)', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==8){
                if(count==1) {
                    layer.tips('Newly generated file:generated by the workflow finished just now.', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==9){
                if(count==1) {
                    layer.tips('Specify the name of the chrom and the loci(e.g.,chr1:113,114,120-113,164,120)', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else if(TipId==10){
                if(count==1) {
                    layer.tips('The output file will be sent to this e-mail address.', id, {
                        tips: [1, '#fa7923'],time:10000
                    });
                    count++;
                }
                else{
                    layer.close(layer.index);
                    count--;
                }
            }
            else{}
        }
    </script>
    <style type="text/css">
        .blackdown_2_workflowCustom {
            width: 95%;
            height: 15%;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        .blackdown_1_workflowCustom {
            width: 95%;
            height: 18%;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        .workflowCustom_option {
            width: 80%;
            height: 50px;
            padding-left: 10px;
            padding-top: 5px;
            font-size: 15px;
            background-color: #dadada;
            color: #333333;
            border: 1px solid #999999;
            border-radius: 5px;
        }

        .workflowCustom_option1 {
            width: 80%;
            height: 80px;
            padding-left: 10px;
            padding-top: 5px;
            font-size: 15px;
            background-color: #dadada;
            color: #333333;
            border: 1px solid #999999;
            border-radius: 5px;
        }

        #workflowCustom_option_1 {
            width: 80%;
            height: 80px;
            padding-left: 10px;
            padding-top: 10px;
            font-size: 15px;
            background-color: #dadada;
            color: #333333;
            border: 1px solid #999999;
            border-radius: 5px;
        }

        #logo_span{
            width:268px;
            height:109px;
            float:left;
            margin-left:6%;
            margin-top:23px;
            background-image: url("./img/logonew1.png");
        }

        #login_spanUpdate {
            width: 110px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            top: 20px;
            right: 30px;
            color: #ffffff;
            position: absolute;
        }

        #login_spanUpdate:hover {
            width: 110px;
            height: 30px;
            top: 20px;
            right: 30px;
            text-align: center;
            line-height: 30px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.9);
            text-shadow: 1px 2px 3px #bdbcbb;
            color: #57779e;
            position: absolute;
            font-weight: 200;
        }

        .tip1 {
            width: 15px;
            height: 15px;
            margin-left: -8px;
        }

        a {
            color: #999999;
            font-size: 12px;
            margin-left: 3px;
        }

        a1 {
            color: #999999;
            font-size: 12px;
            margin-left: 3px;
        }

        h3 {
            position: relative;
            margin-top: -20px;
            padding-left: 5px;
            color: #999999;
            font-size: 12px;
        }

        h4 {
            margin-top: -20px;
            margin-left: 135px;
            color: #999999;
            font-size: 12px;
        }

        h6 {
            font-size: 12px;
            font-weight: 200;
            color: #666666;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        h5 {
            font-size: 25px;
            font-weight: 400;
            margin-left: -15px;
            margin-top: 5px;
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
<div id="back">
    <div id="banner">
        <input type="hidden" name="org.sunxin.token" value="<%=token%>"/>
        <input type="text" name="Session" style="display:none" value="<%=session.getAttribute("Session")%>">
        <div id="logo_span"></div>
        <div id="list_choose">
            <div id="choose_help">Help/contact</div>
            <div id="choose_meme">Downstream Analysis</div>
            <div id="choose_tool">Tools</div>
            <div id="choose_work">Work Flow</div>
            <div id="choose_home">Home</div>
        </div>
        <div id="login_spanUpdate" style="display: none" onclick="recentShow();">Recent Jobs</div>

    </div>
    <div id="side_center">
        <div id="left_side">
            <div class="side_radio"></div>
            <div class="side_top"><h5>Work Flow</h5></div>
            <div class="side_parent" id="side_parent1">
                <div class="arrow1" id="arrow1" style="display:block"></div>
                <div class="arrow2" id="arrow2" style="display:none"></div>
                Custom workflow
            </div>
            <div class="side_son" id="side_son_1" style="background-color: rgb(87, 119, 158);color:#ffffff"
                 onclick="JavaScript:side_right_show(1,1)">Define workflow input
            </div>
            <div id="demo_describe">
                <span style="font-size: 18px ;color:#ffffff">Demo dataset1:</span><br>
                <input type="button" id="Demo_btn1" class="Demo_btn" value="Use demo dataset" style="display:block;"
                       onclick="window.location.href='WorkFlow.jsp';"/>(Click here to fill the input.)<br>
                <span style="font-size:16px;color:#ffffff">all experiments:</span>GEO GSE90060<br>
                <span style="font-size:16px;color:#ffffff">microarray type:</span>"450K"<br>
                <span style="font-size:16px;color:#ffffff">design:</span>early- and midsecretory phase of 17 healthy women<br>
                <span style="font-size:16px;color:#ffffff">The above demo dataset is from:</span> <br>
                Kukushkina V, Modhukur V,et al. DNA methylation changes in endometrium and correlation with gene expression during the transition from pre-receptive to receptive phase[J]. Sci Rep, 2017, 7(1):3916.
                <br>
                <a href="${basepath}/MADA/upload/SampleSheet1_450K.csv"><span style="font-size:16px;color:rgb(87, 119, 158)">Download SampleSheet1[csv]</span></a><br>
            </div>
            <div id="demo_describe" style="height:285px;">
                <span style="font-size: 18px ;color:#ffffff">Demo dataset2:</span> <br>
                <input type="button" id="Demo_btn2" class="Demo_btn" value="Use demo dataset" style="display:block;"
                       onclick="window.location.href='workflowDemo2.jsp';"/>(Click here to fill the input.)<br>
                <span style="font-size:16px;color:#ffffff">all experiments:</span>GEO GSE100825<br>
                <span style="font-size:16px;color:#ffffff">microarray type:</span>"850K(EPIC)"<br>
                <span style="font-size:16px;color:#ffffff">design:</span>three patients affected by Werner syndrome compared with three age- and sex-matched healthy
                controls<br>
                <span style="font-size:16px;color:#ffffff">The above demo dataset is from:</span> <br>
                Guastafierro T, Bacalini M G, Marcoccia A, et al. Genome-wide DNA methylation analysis in blood cells from patients with Werner syndrome[J]. Clinical epigenetics, 2017, 9(1): 92.
                <br>
                <a href="${basepath}/MADA/upload/SampleSheet2_EPIC.csv"><span style="font-size:16px;color:rgb(87, 119, 158)">Download SampleSheet2[csv]</span></a><br>
            </div>
        </div>
        <div id="side_right">
            <div class="side_right" id="side_right_1" style="display:block">
                <div id="attention1" class="blackdown_tips_1">
                    The input of Demo workflow has been filled on this page. Please click the "Execute" to run the demo.
                    <br>
                </div>
                <s:form action="customWorkflow_exe" id="customWorkflow_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('customWorkflow_exe','btn_workflow','wait_workflow');">
                    <!--必选参数-->
                    <div class="blacktop_1">
                        Please input the raw files
                        <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                  data-container="body" data-toggle="popover" data-placement="top"
                                                  data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        <s:fielderror fieldName="workflowCustom_zip"
                                      cssStyle="color:#57779e;float:right;margin-top:0px;margin-right:10px;"/>
                    </div>
                    <div class="blackdown_1">
                        <div class="file-box" style="display:block">
                            <input type='text' name='workflowCustom_zip' id="workflowCustom_zip" value="GSE90060.zip"
                                   class='input_text' onBlur="ValidateChar(this.value,'workflowCustom_zip')"/>
                            <input type='button' class='btn1' value='Choose File'/>
                            <input type="file" name="fileField_workflow" class="fileField"
                                   id="fileField_workflow_control"
                                   onchange="return (fileChange(this,'workflowCustom_zip' )&& checkFileExt(this.value,'workflowCustom_zip'))"/>
                        </div>
                    </div>
                    <div class="blacktop_1">
                        Please input whether you prefer m-values M or beta-values B
                    </div>
                    <div class="blackdown_1">
                        <input type="radio" name="workflow_methValue" value="B" >B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="workflow_methValue" value="M" checked>M
                    </div>
                    <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                    <div class="blackdown_1">
                        <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                    </div>

                    <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                    <div class="blackdown_1">
                        <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="filterXY" value="FALSE">FALSE
                    </div>

                    <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                    <div class="blackdown_1">
                        <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="filterSNPs" value="FALSE">FALSE
                    </div>

                    <div class="blacktop_1">whether to remove all cross reactive probes
                        <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                  data-container="body" data-toggle="popover" data-placement="top"
                                                  data-content="Only five method (SWAN、 Funnorm、 Illumina、 Noob、 SQN) have this function"></div>
                    </div>
                    <div class="blackdown_1">
                        <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="filterCRO" value="FALSE">FALSE
                    </div>
                    <!---------------------------------preprocess_tools---------------------------------------------------->
                    <div class="blacktop_1">
                        Preprocessing
                        <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                  data-container="body" data-toggle="popover" data-placement="top"
                                                  data-content="Choose the preprocessing tool you want to use."></div>

                    </div>
                    <div class="blackdown_1_workflowCustom" style="overflow-y:scroll;">
                        <!--BMIQ-->
                        <input type="radio" name="workflowCustom_mapping" value="1"  onclick="
                    document.getElementById('workflowCustom_option_1').style.display='block';
                    document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">BMIQ
                        <a1>Correct for type I & II bias based on β-values.</a1>
                        <br>
                        <div id="workflowCustom_option_1" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_bmiq" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_bmiq" value="EPIC">EPIC<br>
                            --Whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_bmiq" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_bmiq').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_bmiq" value="2"
                                   onclick="document.getElementById('workflow_custom_bmiq').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_bmiq" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute1" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute1" value="FLASE">Flase
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should
                                    impute.knn(k=3) should be done for the rest NA?</h6>


                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit1" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit1" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>
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

                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('workflow_custom_bmiq').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_bmiq').style.display='none'"/>
                            </div>
                        </div>

                        <!--PBC-->
                        <input type="radio" name="workflowCustom_mapping" value="2"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='block';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">PBC
                        <a1>Correct for type I & II bias based on M-values .</a1>
                        <br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_2" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_pbc" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_pbc" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_pbc" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_pbc').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_pbc" value="2" checked="true"
                                   onclick="document.getElementById('workflow_custom_pbc').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_pbc" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute2" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute2" value="FLASE">Flase
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should
                                    impute.knn(k=3) should be done for the rest NA?</h6>

                                filterMultiHit
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit2" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterMultiHit2" value="FALSE">F
                                </label><br>
                                <h6>If filterMultiHit=TRUE,probes in which the probe aligns to multiple
                                    locations with bwa as defined in Nordlund et al are removed.default
                                    =TRUE.</h6>


                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('workflow_custom_pbc').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_pbc').style.display='none'"/>
                            </div>
                        </div>

                        <!--SWAN-->
                        <input type="radio" name="workflowCustom_mapping" value="3"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='block';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">SWAN
                        <a1>Correct for type I & II bias based on raw intensities.</a1>
                        <br>
                        <div class="workflowCustom_option" id="workflowCustom_option_3" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_swan" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_swan" value="EPIC">EPIC<br>
                        </div>


                        <!--FN-->
                        <input type="radio" name="workflowCustom_mapping" value="4"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='block';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">Funnorm
                        <a1>Remove unwanted variation using quantile normalization based on control probes.</a1>
                        <br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_4" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_fn" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_fn" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_FN" value="1"
                                   onclick="document.getElementById('workflow_custom_fn').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_FN" value="2"
                                   onclick="document.getElementById('workflow_custom_fn').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_fn" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll; ">
                                nPCs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>Number of principal components from the control probes PCA</h6>
                                <input type="text" class="input_setting_text" name="nPCs" value="2"/><br>

                                sex&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>An optional numeric vector containing the sex of the samples.</h6>
                                <input type="text" class="input_setting_text" name="sex" value="NULL"/><br>


                                bgCorr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bgCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bgCorr" value="FALSE">F
                                </label>
                                <h6>Should the NOOB background correction be done, prior to
                                    functional normalization.</h6>

                                dyeCorr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="FALSE">F
                                </label>
                                <h6>Should dye normalization be done as part of the NOOB
                                    background correction</h6>

                                keepCN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="keepCN" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="keepCN" value="FALSE">F
                                </label>
                                <h6>Should copy number estimates be kept around? Setting to‘FALSE’ will decrease the size of the output object significantly</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="FALSE">F
                                </label>
                                <h6>Should the function be verbose?</h6>
                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('workflow_custom_fn').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_fn').style.display='none'"/>
                            </div>
                        </div>

                        <!--ill-->
                        <input type="radio" name="workflowCustom_mapping" value="5"checked="true"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='block';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">Illumina
                        <a1>Background correction and reference normalization factor-based colour-channel
                            normalization.
                        </a1>
                        <br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_5" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_ill" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_ill" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_ILL" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_ill').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_ILL" value="2"
                                   onclick="document.getElementById('workflow_custom_ill').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_ill" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll; ">
                                bg.correct
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="TRUE" checked="true">T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="FALSE">F
                                </label><br>
                                <h6>logical, should background correction be performed?default=TRUE.</h6>
                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('workflow_custom_ill').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_ill').style.display='none'"/>
                            </div>
                        </div>

                        <!--noob-->
                        <input type="radio" name="workflowCustom_mapping" value="6"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='block';document.getElementById('workflowCustom_option_7').style.display='none';document.getElementById('workflowCustom_option_8').style.display='none';document.getElementById('workflowCustom_option_9').style.display='none';">Noob
                        <a1>Background correction and dye-bias adjustment on raw intensities .</a1>
                        <br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_6" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_noob" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_noob" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_Noob" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_noob').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_Noob" value="2"
                                   onclick="document.getElementById('workflow_custom_noob').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_noob" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll; ">
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
                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('workflow_custom_noob').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_noob').style.display='none'"/>
                            </div>
                        </div>

                        <!--SQN-->
                        <input type="radio" name="workflowCustom_mapping" value="7"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='block';">SQN
                        <a1> Correct for type I & II bias based on raw intensities.</a1>
                        <br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_7" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_sqn" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_sqn" value="EPIC">EPIC<br>
                            -- whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_SQN" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_sqn').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_SQN" value="2"
                                   onclick="document.getElementById('workflow_custom_sqn').style.display='block'">setting
                            by yourself
                        </div>
                        <div class="inputOption_setting" id="workflow_custom_sqn" style="display:none;">
                            <div class="inputOption_setting_center" style="overflow-y:scroll; ">
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
                                       onclick="document.getElementById('workflow_custom_sqn').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('workflow_custom_sqn').style.display='none'"/>
                            </div>
                        </div>

                        <!--Dasen-->
                        <input type="radio" name="workflowCustom_mapping" value="8"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">Dasen
                        <a1> A data-driven approach only to preprocessing Illumina 450K methylation array data</a1>
                        <br>

                        <!--RAW-->
                        <input type="radio" name="workflowCustom_mapping" value="9"
                               onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';document.getElementById('workflowCustom_option_4').style.display='none';document.getElementById('workflowCustom_option_5').style.display='none';document.getElementById('workflowCustom_option_6').style.display='none';document.getElementById('workflowCustom_option_7').style.display='none';">RAW
                        <a1> Converts the Red/Green channel for an Illumina methylation array
                            into methylation signal, without using any normalization.
                        </a1>
                        <br>
                    </div>
                    <!---------------------------------DMP/DMR_TOOLS------------------------------------------------------->
                    <div class="blacktop_1">
                        Differential Methylation Analysis
                        <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                  data-container="body" data-toggle="popover" data-placement="top"
                                                  data-content="Choose the differential methylation analysis tool you want to use."></div>

                    </div>
                    <div class="blackdown_2_workflowCustom" style="overflow-y:scroll;">
                        <!--limma--->
                        <input type="radio" name="workflowCustom_peak" value="1" checked="true"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='block';
                        document.getElementById('workflowCustom_option_samr').style.display='none';
                        document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                        document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                        document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                        document.getElementById('workflowCustom_option_lasso').style.display='none';
                        document.getElementById('workflowCustom_option_seqlm').style.display='none';">
                        Limma<a1>Limma calculates differential methylation probes between two phenotypes.</a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_limma" style="height:170px;display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_limma" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_limma" value="EPIC">EPIC<br>
                            --whether to apply covariates to the design matrix?<br>
                            <input type="radio" name="workflowCustom_cor_limma" value="1"
                                   onclick="document.getElementById('workflow_cor_limma').style.display='none';">False&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_cor_limma" value="2" checked="true"
                                   onclick="document.getElementById('workflow_cor_limma').style.display='block';">True<br>
                            --Please input the adjusted p-value to get the significant CpGs sites
                            <input type="text" class="input_setting_text" name="adjPval" value="0.05"/><br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_limma" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_limma').style.display='none';">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_limma" value="2"
                                   onclick="document.getElementById('workflow_custom_limma').style.display='block';">setting
                            by yourself
                        </div>
                        <div id="workflow_cor_limma" class="inputOption_setting" style="display:none">
                            <div id="cor1_option_center" class="inputOption_setting_center">
                                <br>
                                please input the name of covariate in your SampleSheet<br>
                                <input type="text" class="input_setting_text" name="cor1" value="age"/><br><br>
                                please choose the type of covariate in your SampleSheet<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="continuous" checked>continuous
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="discrete">discrete
                                </label><br>
                                <h6>eg:age is a continuous covariate and gender is a discrete covariat</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('workflow_cor_limma').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_cor_limma').style.display='none';"/>
                            </div>
                        </div>
                        <div id="workflow_custom_limma" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
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
                                       onclick="document.getElementById('workflow_custom_limma').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_custom_limma').style.display='none';"/>
                            </div>
                        </div>

                        <!--dmpFinder-->

                        <input type="radio" name="workflowCustom_peak" value="2"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='block';
                               document.getElementById('workflowCustom_option_samr').style.display='none';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                               document.getElementById('workflowCustom_option_lasso').style.display='none';
                               document.getElementById('workflowCustom_option_seqlm').style.display='none'; ">
                        dmpFinder<a1>Identify CpGs where methylation is associated with a continuous or categorical phenotype.</a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_dmpFinder" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_dmpfinder" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_dmpfinder" value="EPIC">EPIC<br>
                            --Please input the adjusted p-value to get the significant CpGs sites
                            <input type="text" class="input_setting_text" name="adjPval_dmpfinder" value="0.05"/><br>
                        </div>

                        <!--samr-->

                        <input type="radio" name="workflowCustom_peak" value="3"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                               document.getElementById('workflowCustom_option_samr').style.display='block';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                               document.getElementById('workflowCustom_option_lasso').style.display='none';
                               document.getElementById('workflowCustom_option_seqlm').style.display='none'; ">
                        samr<a1>Significance analysis of microarrays</a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_samr" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_samr" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_samr" value="EPIC">EPIC<br>
                            --Please input the q-value to get the significant CpGs sites
                            <input type="text" class="input_setting_text" name="adjPval_samr" value="0.05"/><br>
                        </div>

                        <!--DMRCate-->
                        <input type="radio" name="workflowCustom_peak" value="4"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_samr').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='block';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                               document.getElementById('workflowCustom_option_lasso').style.display='none';
                               document.getElementById('workflowCustom_option_seqlm').style.display='none';">DMRCate<a1>
                        DMRcate extracts and annotates differentially methylated regions using an array-bias corrected
                        smoothed estimate.</a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_dmrcate" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_dmrcate" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_dmrcate" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_dmrcate" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_dmrcate').style.display='none';">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_dmrcate" value="2"
                                   onclick="document.getElementById('workflow_custom_dmrcate').style.display='block';">setting
                            by yourself
                        </div>
                        <div id="workflow_custom_dmrcate" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
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
                                <input type="text" name="dist" value="2" class="input_setting_text"/>
                                <h6>
                                    Maximum distance (from CpG to SNP) of probes to be filtered
                                    out. See details for when Illumina occasionally lists a
                                    CpG-to-SNP distance as being < 0. (default = 2)
                                </h6>
                                mafcut
                                <input type="text" name="mafcut" value="0.05" class="input_setting_text"/>
                                <h6>
                                    Minimum minor allele frequency of probes to be filtered out.
                                    (default = 0.05)
                                </h6>
                                lambda
                                <input type="text" name="lambda" value="1000" class="input_setting_text"/>
                                <h6>
                                    Gaussian kernel bandwidth for smoothed-function estimation.
                                    Also informs DMR bookend definition; gaps >= lambda between
                                    significant CpG sites will be in separate DMRs. Support is
                                    truncated at 5*lambda. See DMRcate package for further info.
                                    (default = 1000)
                                </h6>
                                C
                                <input type="text" name="C" value="2" class="input_setting_text"/>
                                <h6>
                                    Scaling factor for bandwidth. Gaussian kernel is calculated
                                    where lambda/C = sigma. Empirical testing shows that when
                                    lambda=1000, near-optimal prediction of sequencing-derived
                                    DMRs is obtained when C is approximately 2, i.e. 1 standard
                                    deviation of Gaussian kernel = 500 base pairs. Cannot be <
                                    0.2. (default = 2)
                                </h6>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('workflow_custom_dmrcate').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_custom_dmrcate').style.display='none';"/>
                            </div>
                        </div>

                        <!--Bumphunter--->
                        <input type="radio" name="workflowCustom_peak" value="5"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_samr').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='block';
                               document.getElementById('workflowCustom_option_lasso').style.display='none';
                               document.getElementById('workflowCustom_option_seqlm').style.display='none';">Bumphunter<a1>Estimate
                        regions for which a genomic profile deviates from its baseline value.</a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_bumphunter" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_bum" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_bum" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_bumphunter" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_bumphunter').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_bumphunter" value="2"
                                   onclick="document.getElementById('workflow_custom_bumphunter').style.display='block'">setting
                            by yourself
                        </div>
                        <div id="workflow_custom_bumphunter" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" id="minProbes" name="minProbes" value="7"
                                       class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>
                                adjPvalDmr
                                <input type="text" id="adjPvalDmr" name="adjPvalDmr" value="0.05"
                                       class="input_setting_text"/>
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
                                <input type="text" id="pickCutoff" name="pickCutoff" value="TRUE"
                                       class="input_setting_text"/>
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
                                <input type="text" id="permutations" name="permutations" value="NULL"
                                       class="input_setting_text"/>
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
                                       onclick="document.getElementById('workflow_custom_bumphunter').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_custom_bumphunter').style.display='none';"/>
                            </div>
                        </div>

                        <!--lasso--->
                        <input type="radio" name="workflowCustom_peak" value="6"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_samr').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                               document.getElementById('workflowCustom_option_lasso').style.display='block';
                               document.getElementById('workflowCustom_option_seqlm').style.display='none';">ProbeLasso<a1>A
                        novel method to rope indifferentially methylated regions </a1><br>
                        <div class="workflowCustom_option1" id="workflowCustom_option_lasso" style="display:none">
                            --Choose microarray type is "450K" or "EPIC"<br>
                            <input type="radio" name="arraytype_las" value="450K" checked="true">450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype_las" value="EPIC">EPIC<br>
                            --whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_lasso" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_lasso').style.display='none'">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_lasso" value="2"
                                   onclick="document.getElementById('workflow_custom_lasso').style.display='block'">setting
                            by yourself
                        </div>
                        <div id="workflow_custom_lasso" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="minProbes1" value="7" class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>
                                adjPvalDmr
                                <input type="text" name="adjPvalDmr1" value="0.05" class="input_setting_text"/>
                                <h6>This is the significance threshold for including DMRs in
                                    the final DMR list. (default = 0.05)
                                </h6>

                                meanLassoRadius
                                <input type="text" id="meanLassoRadius" name="meanLassoRadius" value="375"
                                       class="input_setting_text"/>
                                <h6> Radius around each DMP to detect DMR. (default = 375)</h6>
                                minDmrSep
                                <input type="text" id="minDmrSep" name="minDmrSep" value="1000"
                                       class="input_setting_text"/>
                                <h6>The minimum seperation (bp) between neighbouring DMRs.
                                    (default = 1000.)
                                </h6>
                                minDmrSize
                                <input type="text" id="minDmrSize" name="minDmrSize" value="50"
                                       class="input_setting_text"/>
                                <h6> The minimum DMR size (bp). (default = 50)
                                </h6>
                                adjPvalProbe
                                <input type="text" id="adjPvalProbe" name="adjPvalProbe" value="0.05"
                                       class="input_setting_text"/>
                                <h6>The minimum threshold of significance for probes to be
                                    includede in DMRs. If the finaly result of probolasso is null, maybe there is no probe show significant difference accroding the value.
                                    You can set the parameter higher ,such as 0.1 or more. (default = 0.05)
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
                                       onclick="document.getElementById('workflow_custom_lasso').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_custom_lasso').style.display='none';"/>
                            </div>
                        </div>

                        <!---seqlm-->
                        <input type="radio" name="workflowCustom_peak" value="7"
                               onclick="document.getElementById('workflowCustom_option_limma').style.display='none';
                               document.getElementById('workflowCustom_option_samr').style.display='none';
                               document.getElementById('workflowCustom_option_dmpFinder').style.display='none';
                               document.getElementById('workflowCustom_option_dmrcate').style.display='none';
                               document.getElementById('workflowCustom_option_bumphunter').style.display='none';
                               document.getElementById('workflowCustom_option_lasso').style.display='none';
                               document.getElementById('workflowCustom_option_seqlm').style.display='block';">Seqlm<a1>Segments
                        genome based on given linear models and and calculatesthe significance of regions</a1><br>
                        <div class="workflowCustom_option" id="workflowCustom_option_seqlm" style="display:none">
                            whether to set optional parameters?<br>
                            <input type="radio" name="workflowCustom_option_seqlm" value="1" checked="true"
                                   onclick="document.getElementById('workflow_custom_seqlm').style.display='none';">default&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="workflowCustom_option_seqlm" value="2"
                                   onclick="document.getElementById('workflow_custom_seqlm').style.display='block';">setting
                            by yourself
                        </div>
                        <div id="workflow_custom_seqlm" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                max_block_length
                                <input type="text" name="max_block_length" value="50" class="input_setting_text"/>
                                <h6> maximal length of the block we are searching. This is
                                    used to speed up computation.default=50.
                                </h6>

                                max_dist
                                <input type="text" name="max_dist" value="1000" class="input_setting_text"/>
                                <h6>maximal genomic distance between the sites to be considered
                                    the same region.default=1000.
                                </h6>

                                expand
                                <input type="text" name="expand" value="100" class="input_setting_text"/>
                                <h6>number of basepairs to extend the region on plot</h6>

                                width
                                <input type="text" name="width" value="8" class="input_setting_text"/>
                                <h6>picture width in inches</h6>

                                height
                                <input type="text" name="height" value="5" class="input_setting_text"/>
                                <h6>picture height in inches</h6>

                                dpi
                                <input type="text" name="dpi" value="100" class="input_setting_text"/>
                                <h6>dots per inch, to calibrate the picture size in pixels</h6>

                                main
                                <input type="text" name="main" value="seqlm results" class="input_setting_text"/>
                                <h6>title for the report</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('workflow_custom_seqlm').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('workflow_custom_seqlm').style.display='none';"/>
                            </div>
                        </div>


                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_workflow"
                           style="margin-left: 15px"/><s:fielderror fieldName="check1"
                                                                    cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_workflow" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
            </div>
        </div>
    </div>
    <div id="foot">
        <p>Copyright © 2018 - CSU-Bioinformatics Group | All Rights Reserved</p>
    </div>
</div>
</body>
<script>
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</html>