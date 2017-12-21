<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/28
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>workflow</title>
    <link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function turnoff(obj) {
            document.getElementById(obj).style.display = "none";
        }
    </script>
    <style type="text/css">
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
        h6 {
            font-size: 13px;
            font-weight: 200;
            color: #666666;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .panel-title{  font-size: 18px;  }
        .inputOption_setting_center {
            width: 98%;
            height: 97%;
            overflow-y: scroll;
            padding-left: 15px;
            padding-top: 5px;
            background-color: #b1c9e9;
            font-size: 15px;
            font-weight: 500;
            color: #464646;
        }

        .inputOption_setting {
            width: 450px;
            height: 280px;
            position: fixed;
            top: 40%;
            left: 50%;
            background-color: rgba(177, 201, 233, 0.5);
            padding-left: 8px;
            padding-top: 8px;
            z-index:2;
        }

        .input_setting_text {
            width: 98%;
            margin: 0 auto;
            height: 23px;
            line-height: 23px;
            border-radius: 5px;
            border: 1px solid #999999;
            margin-bottom: 5px;
            padding-left: 5px;
        }

        .btn_submit, .btn_cancel {
            line-height: 20px;
            border-radius: 5px;
            border: 1px solid #F9A32D;
            color: #ffffff;
            background-color: #F9A32D;
            height: 25px;
            width: 60px;
            margin-left: 18%;
            margin-right: 10%;
            margin-top: 15px;
            margin-bottom: 10px;
        }

        .btn {
            line-height: 10px;
            height: 3%;
            width: 10%;
            color: white;
            margin-left: 7%;
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #faae23;
        }

        .panel-heading {
            color: #fa7923;
        }

        .content {
            margin-left: 5%;
            margin-right: 5%;
        }

        #back {
            width: 100%;
            height: 800px;
            background-color: #ebeaea;
        }

        #banner {
            height: 190px;
            background: url("./images/back3.png") no-repeat;
            background-size: cover;
            background-position: center;
        }

        #logo_span {
            width: 258px;
            height: 106px;
            float: left;
            margin-left: 11%;
            margin-top: 30px;
            background-image: url("./images/logo.png");
        }
        .blacktop_1{
            width:95%;
            height:25px;
            line-height:25px;
            background-color: #999999;
            padding-left: 8px;
            color: #ffffff;
            margin:0 auto;
            margin-top: 10px;
            font-size: 18px;
        }

        .blackdown_2{
            width:95%;
            height:auto;
            font-size:15px;
            color:#666666;
            background-color: #dadada;
            padding-left: 8px;
            padding-top:8px;
            margin:0 auto;
            margin-bottom:10px;
            border-radius: 5px;
            border:1px solid #999999;
        }
        .blackdown_1{
            width:95%;
            height:45px;
            line-height: 40px;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin:0 auto;
            font-size: 16px;
        }
        .side_right{
            width:90%;
            height:auto;
            padding-top: 20px;
            padding-left: 40px;
            color: #ffffff;
        }
        #side_right{
            margin-top:-20px;
            margin-left:25%;
            width:70%;
            height:800px;
            position:relative;
            background-color: #ffffff;
            z-index: 9;
            box-shadow:5px 5px 20px #999999;
            -moz-box-shadow:5px 5px 20px #999999;
            -webkit-box-shadow:5px 5px 20px #999999;
        }
        .input_text{
            border:1px solid #999999;
            width:80%;
            height:28px;
            color: #999999;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding-left: 10px;
        }
        .workflowCustom_option{
            width:80%;
            height:50px;
            padding-left:10px;
            padding-top:5px;
            font-size:15px;
            background-color:#dadada;
            color:#333333;
            border:1px solid #999999;
            border-radius: 5px;
        }
        .blackdown_1_workflowCustom{
            width:95%;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin:0 auto;
        }


        /* 响应式布局 */

        @media (max-width: 768px) {

            .summary {
                padding-right: 3px;
                padding-left: 3px;
            }

            .carousel {
                height: 300px;
                margin-bottom: 30px;
            }

            .carousel .item {
                height: 300px;
            }

            .carousel img {
                min-height: 300px;
            }

            .carousel-caption p {
                font-size: 16px;
                line-height: 1.4;
            }

            .feature-heading {
                font-size: 34px;
            }

            .feature-heading .text-muted {
                font-size: 22px;
            }
        }

        @media (min-width: 992px) {
            .feature-heading {
                margin-top: 120px;
            }
        }
        a:active { color:#FFFFFF;}
        a:hover { color:#337ab7; text-decoration:none; }
    </style>
</head>
<body>
<!-- 顶部导航 -->
<div class="navbar-inverse navbar-fixed-top" style="font-size: 16px;"role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home.jsp">Welcome</a></li>
                <li><a href="index.jsp">Description</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tools<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="champ.jsp">ChAMP</a></li>
                        <li><a href="minfi.jsp">Minfi</a></li>
                        <li><a href="rnbeads.jsp">RnBeads</a></li>
                        <li><a href="#">Methylumi</a></li>
                        <li><a href="#">waterRmelon</a></li>
                    </ul>
                </li>
                <li><a href="workflow.jsp">WorkFlow</a></li>
                <li><a href="#">Downstream Analysis</a></li>
                <li><a href="about.jsp">About us</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="banner">
    <div id="logo_span"></div>
</div>
<div id="back">
    <!--左右栅格4：8-->
    <div id="ShanGe" class="container" style="width:80%;margin:0 auto;">
        <!--左边的珊格 -->
        <div id="left_side" style="width:20%;height:80%;float:left;margin-top:18px;margin-left:4%;">
            <div style="font-size: 30px;">
                <img src="./images/tools.png">&nbsp;&nbsp;<strong>WorkFlow</strong>
            </div>
            <div class="panel-group" id="accordion1"style="margin-top:5px;">
                <div class="panel">
                    <div class="panel-heading" style="color:#fa7923;">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                Define workflow input
                            </a>
                        </h4>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading" style="color:#fa7923;">
                        <h4 class="panel-title">
                            <a href="generic/web/viewer.html?file=myLassos.pdf">Results visualization</a>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
        <!--右边的珊格 -->
        <div id="side_right"style="box-shadow: 10px 10px 50px;">
            <div class="side_right" id="side_right_1" style="display:block">
                <s:form action="workflowCustom_exe" method="POST" >
            <div class="blacktop_1">Please input the raw files</div>
            <div class="blackdown_1">
                <input type="text"class="input_text" name="workflowDirectory" placeholder="please input the raw file path" />
            </div>
            <div class="blacktop_1">Please input the path to save result</div>
            <div class="blackdown_1">
                <input type="text" class="input_text" name="workflowSavePath" placeholder="input the path to save result" />
            </div>
                <div class="blacktop_1">Load and Fitter</div>
                <div class="blackdown_1">
                    <div>optional parameter
                    <label class="checkbox-inline">
                        <input type="radio" name="workflow_optional_Load"	id="default" value="1" checked onclick="javascript:turnoff('champload_op')">default
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" name="workflow_optional_Load"	id="setbymyself" value="2" onclick="document.getElementById('champload_op').style.display='block'">set parameters by yourself
                    </label></div>
                    <!--champload可选参数-->
                    <div id="champload_op" class="inputOption_setting" style="display:none;">
                        <div id="advancedPair_setting_center" class="inputOption_setting_center"
                             style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champload_op')">×
                            </button>
                            methValue
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="B" checked>B
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="M">M
                            </label><br>
                            <h6>Indicates whether you prefer m-values M or beta-values B.default=B</h6>
                            filterDetP&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterDetP" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filterDetP" value="FLASE">Flase
                            </label>
                            <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>
                            detPcut
                            <h6>The detection p-value threshhold. Probes about this cutoff will be filtered
                                out.default=0.01</h6>
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                            removeDetP
                            <h6>The removeDetP parameter represents the fraction of samples that can contain
                                a detection p-value above the detPcut.default=0</h6>
                            <input type="text" class="input_setting_text" name="removeDetP" value="0"/><br>
                            filterBeads
                            &nbsp;&nbsp;<label class="checkbox-inline">
                            <input type="radio" name="filterBeads" value="TRUE" checked>T
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterBeads" value="FLASE">F
                            </label><br>
                            <h6>If filterBeads=TRUE,probes with a beadcount less than 3 will be removed
                                depending on the beadCutoff value. default=TRUE.</h6>
                            beadCutoff
                            <h6>The beadCutoff represents the fraction of samples that must have a beadcount
                                less than 3 before the probe is removed.default=0.05</h6>
                            <input type="text" class="input_setting_text" name="beadCutoff"
                                   value="0.05"/><br>
                            filterNoCG
                            &nbsp;&nbsp;<label class="checkbox-inline">
                            <input type="radio" name="filterNoCG" value="TRUE" checked>T
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterNoCG" value="FLASE">F
                            </label><br>
                            <h6>If filterNoCG=TRUE, non-cg probes are removed.default=false.</h6>
                            filterSNPs
                            &nbsp;&nbsp; <label class="checkbox-inline">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>T
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterSNPs" value="FLASE">F
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
                            filterXY
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="checkbox-inline">
                            <input type="radio" name="filterXY" value="TRUE" checked>T
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="FALSE">F
                            </label>
                            <h6>If filterXY=TRUE,probes from X and Y chromosomes are
                                removed.default=TRUE.</h6>
                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champload_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champload_op')"/>
                        </div>
                    </div>
                </div>
                <div class="blacktop_1">Normalization</div>
                <div class="blackdown_1_workflowCustom" style="overflow-y:scroll;">
                    <input type="radio" name="workflow_norm" value="1" onclick="
                    document.getElementById('workflowCustom_option_1').style.display='block';
                    document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='none';">BMIQ<h6></h6>
                    <div class="workflowCustom_option" id="workflowCustom_option_1" style="display:none">
                        whether to set optional parameters?<br>
                        <input type="radio" name="workflow_optional_bmiq" value="1" onclick="document.getElementById('champBMIQ_op').style.display='none'">default
                        <input type="radio" name="workflow_optional_bmiq" value="2" onclick="document.getElementById('champBMIQ_op').style.display='block'">setting by yourself
                    </div>
                    <!--champnorm_BMIQ可选参数-->
                    <div id="champBMIQ_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_bmiq" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champBMIQ_op')">×
                            </button>
                            methValue&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="B" checked>B
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="M">M
                            </label><br>
                            <h6>Indicates whether you prefer the methylation scores to be calculated as
                                m-values M or beta-values B.default=B.</h6>
                            fromFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="FLASE">Flase
                            </label>
                            <h6>If loadFile=TRUE, then the beta values and sample sheet need to be
                                uploaded.</h6>
                            filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="FLASE">Flase
                            </label>
                            <h6>Not yet implemented.If fromFile=T and this is from a genome studio
                                file,probes that have a detection p-value below detPcut are filtered out.
                                default=TRUE</h6>
                            filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="FLASE">Flase
                            </label>
                            <h6>If filterXY=True, probes from X and Y chromosomes are removed.
                                default=TRUE.</h6>
                            QCimages&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="FLASE">Flase
                            </label>
                            <h6>If QCimages=TRUE, then quality control images are saved to the
                                resultsDir.default=TRUE</h6>
                            plotBMIQ&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="plotBMIQ" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="plotBMIQ" value="FLASE">Flase
                            </label>
                            <h6>If plotBMIQ=TRUE,BMIQ plots will be saved.default=TRUE</h6>
                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champBMIQ_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champBMIQ_op')"/>
                        </div>
                    </div>
                    <input type="radio" name="workflow_norm" value="2" onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='block';document.getElementById('workflowCustom_option_3').style.display='none';">PBC<h6></h6>
                    <div class="workflowCustom_option" id="workflowCustom_option_2" style="display:none">
                        whether to set optional parameters?<br>
                        <input type="radio" name="workflow_optional_pbc" value="1" onclick="document.getElementById('champPBC_op').style.display='none'">default
                        <input type="radio" name="workflow_optional_pbc" value="2" onclick="document.getElementById('champPBC_op').style.display='block'">setting by yourself
                    </div>
                    <!--champnorm_PBC可选参数-->
                    <div id="champPBC_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_pbc" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champPBC_op')">×
                            </button>
                            methValue&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="B" checked>B
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="M">M
                            </label><br>
                            <h6>Indicates whether you prefer the methylation scores to be calculated as
                                m-values M or beta-values B.default=B.</h6>
                            fromFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="FLASE">Flase
                            </label>
                            <h6>If loadFile=TRUE, then the beta values and sample sheet need to be
                                uploaded.</h6>
                            filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="FLASE">Flase
                            </label>
                            <h6>Not yet implemented.If fromFile=T and this is from a genome studio
                                file,probes that have a detection p-value below detPcut are filtered out.
                                default=TRUE</h6>
                            filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="FLASE">Flase
                            </label>
                            <h6>If filterXY=True, probes from X and Y chromosomes are removed.
                                default=TRUE.</h6>
                            QCimages&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="FLASE">Flase
                            </label>
                            <h6>If QCimages=TRUE, then quality control images are saved to the
                                resultsDir.default=TRUE</h6>

                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champPBC_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champPBC_op')"/>
                        </div>
                    </div>
                    <input type="radio" name="workflow_norm" value="3" onclick="document.getElementById('workflowCustom_option_1').style.display='none';document.getElementById('workflowCustom_option_2').style.display='none';document.getElementById('workflowCustom_option_3').style.display='block';">SWAN<h6></h6>
                    <div class="workflowCustom_option" id="workflowCustom_option_3" style="display:none">
                        whether to set optional parameters?<br>
                        <input type="radio" name="workflow_optional_swan" value="1" onclick="document.getElementById('champSWAN_op').style.display='none'">default
                        <input type="radio" name="workflow_optional_swan" value="2" onclick="document.getElementById('champSWAN_op').style.display='block'">setting by yourself
                    </div>
                    <!--champnorm_SWAN可选参数-->
                    <div id="champSWAN_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_swan" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champSWAN_op')">×
                            </button>
                            methValue&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="B" checked>B
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methValue" value="M">M
                            </label><br>
                            <h6>Indicates whether you prefer the methylation scores to be calculated as
                                m-values M or beta-values B.default=B.</h6>
                            fromFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="FLASE">Flase
                            </label>
                            <h6>If loadFile=TRUE, then the beta values and sample sheet need to be
                                uploaded.</h6>
                            filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filter" value="FLASE">Flase
                            </label>
                            <h6>Not yet implemented.If fromFile=T and this is from a genome studio
                                file,probes that have a detection p-value below detPcut are filtered out.
                                default=TRUE</h6>
                            filterXY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="FLASE">Flase
                            </label>
                            <h6>If filterXY=True, probes from X and Y chromosomes are removed.
                                default=TRUE.</h6>
                            QCimages&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="QCimages" value="FLASE">Flase
                            </label>
                            <h6>If QCimages=TRUE, then quality control images are saved to the
                                resultsDir.default=TRUE</h6>

                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champSWAN_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champSWAN_op')"/>
                        </div>
                    </div>
                </div>
                <div class="blacktop_1">Batch effects correction</div>
                <div class="blackdown_1">
                    <div>optional parameter
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_ChampSVD"  value="1" checked
                                   onclick="javascript:turnoff('champSVD_op')">default
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_ChampSVD"  value="2"
                                   onclick="document.getElementById('champSVD_op').style.display='block'">set
                            parameters by yourself
                        </label></div>
                    <!--champ_SVD可选参数-->
                    <div id="champSVD_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_svd" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champSVD_op')">×
                            </button>
                            methProfile&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="methProfile" value="FALSE" checked>False
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="methProfile" value="TRUE">True
                            </label>
                            <h6>If methprofile=TRUE then the beta values will be uploaded using the MethylationProbeProfile file from Genome Studio.
                                default=FALSE.</h6>
                            controlProfile
                            <label class="checkbox-inline">
                                <input type="radio" name="controlProfile" value="FALSE" checked>False
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="controlProfile" value="TRUE">True
                            </label>
                            <h6>If rawdata = FALSE and runSVD = TRUE, then it is useful to have a control probe profile file exported from Genome Studio so that internal control probes can be included in the SVD analyis..default=TRUE</h6>
                            studyInfo&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="studyInfo" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="studyInfo" value="FALSE">False
                            </label>
                            <h6>If studyInfo=TRUE, additional study covariate information can be included in the SVD analysis..default=TRUE</h6>
                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champSVD_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champSVD_op')"/>
                        </div>
                    </div>
                </div>
                <div class="blacktop_1">DMPs</div>
                <div class="blackdown_1">
                    <div>optional parameter
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_MVP"  value="1" checked
                                   onclick="javascript:turnoff('champMVP_op')">default
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_MVP"  value="2"
                                   onclick="document.getElementById('champMVP_op').style.display='block'">set
                            parameters by yourself
                        </label></div>
                    <!--champMVP可选参数-->
                    <div id="champMVP_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_mvp" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champMVP_op')">×
                            </button>
                            adjPVal
                            <h6>The minimum threshold of significance for probes to be considered an MVP, default = 0.05</h6>
                            <input type="text" class="input_setting_text" name="adjPVal " value="0.05"/><br>
                            bedFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="bedFile" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="bedFile" value="FALSE">False
                            </label>
                            <h6>If bedFile=TRUE, the MVPs will be saved in bedFile format for downstream analysis.</h6>

                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champMVP_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champMVP_op')"/>
                        </div>
                    </div>
                </div>
                <div class="blacktop_1">DMRs</div>
                <div class="blackdown_1">
                    <div>optional parameter
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_lasso"  value="1" checked
                                   onclick="javascript:turnoff('champLASSO_op')">default
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="workflow_optional_lasso"  value="2"
                                   onclick="document.getElementById('champLASSO_op').style.display='block'">set
                            parameters by yourself
                        </label></div>
                    <!--champlasso可选参数-->
                    <div id="champLASSO_op" class="inputOption_setting" style="display:none;">
                        <div id="inner_lasso" class="inputOption_setting_center" style="overflow-y:scroll;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    onclick="javascript:turnoff('champLASSO_op')">×
                            </button>
                            fromFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="FALSE" checked>False
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="fromFile" value="TRUE">True
                            </label>
                            <h6>If bedFile=TRUE, the MVPs will be saved in bedfile format for downstream analysis.Default is Flase.</h6>
                            uploadResults
                            <label class="checkbox-inline">
                                <input type="radio" name="uploadResults" value="FALSE" checked>False
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="uploadResults" value="TRUE">True
                            </label>
                            <h6>Set uploadResults=TRUE if you haven't loaded data from .idat files and need to upload the limma file.Default is Flase.</h6>
                            filterXY&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="filterXY" value="FALSE">False
                            </label>
                            <h6>If filterXY=T, probes from the X and Y chromosomes are removed.</h6>
                            image&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="image" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="image" value="FALSE">False
                            </label>
                            <h6>If image=T, images will be saved as a pdf file in the resultsDir.Default is TRUE.</h6>
                            mafPol.lower
                            <h6>The lower limit for the minor allele frequencies of included polymorphisms.default=0.</h6>
                            <input type="text" class="input_setting_text" name="mafPol_lower" value="0"/><br>
                            mafPol.upper
                            <h6>The lower limit for the minor allele frequencies of included polymorphisms.default=0.05.</h6>
                            <input type="text" class="input_setting_text" name="mafPol_upper" value="0.05"/><br>
                            lassoRadius
                            <h6>The lasso size, default = 2000</h6>
                            <input type="text" class="input_setting_text" name="lassoRadius" value="2000"/><br>
                            minSigProbesLasso
                            <h6>The minimum number of significant probes to be captured in lasso, default = 3</h6>
                            <input type="text" class="input_setting_text" name="minSigProbesLasso" value="3"/><br>
                            minDmrSep
                            <h6>The minimum seperation (bp) between neighbouring DMRs, default = 1000</h6>
                            <input type="text" class="input_setting_text" name="minDmrSep" value="1000"/><br>
                            minDmrSize
                            <h6>The minimum DMR size (bp), default = 0</h6>
                            <input type="text" class="input_setting_text" name="minDmrSize" value="0"/><br>
                            adjPVal
                            <h6>The minimum threshold of significance for probes to be includede in DMRs, default = 0.05.</h6>
                            <input type="text" class="input_setting_text" name="adjPVal" value="0.05"/><br>
                            bedFile&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="image" value="TRUE" checked>True
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="image" value="FALSE">False
                            </label>
                            <h6>If bedFile=TRUE, the DMRs will be saved in bedfile format for downstream analysis.Default is TRUE.</h6>
                            DMRpval
                            <h6>TThis is the significance threshold for including DMRs in the final DMR list.default = 0.05.</h6>
                            <input type="text" class="input_setting_text" name="DMRpval" value="0.05"/><br>
                            batchDone&nbsp;&nbsp;&nbsp;
                            <label class="checkbox-inline">
                                <input type="radio" name="batchDone" value="FALSE" checked>False
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="batchDone" value="TRUE">True
                            </label>
                            <h6>Internal variable to indicate if combat batch correction was performed.Default is Flase.</h6>
                            <input type="button" value="submit" class="btn_submit"
                                   onclick="javascript:turnoff('champLASSO_op')"/>
                            <input type="reset" value="cancel" class="btn_cancel"
                                   onclick="javascript:turnoff('champLASSO_op')"/>
                        </div>
                    </div>
                </div>
                    <div class="contact-form" style="padding-top:35px;margin-left: 20px;">
                        <input type="submit" value="SUBMIT" style="background-color: #faae23;border: 3px solid #faae23;">
                    </div>
                </s:form>
        </div>
        </div>
       </div>
    </div>
    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">About us</h4>
                </div>
                <div class="modal-body">
                    <p><strong>This is a web site for DNA methylation analysis.</strong></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">I know</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

