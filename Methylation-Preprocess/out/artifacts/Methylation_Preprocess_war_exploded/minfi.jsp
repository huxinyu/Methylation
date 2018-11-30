<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/23
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tools_minfi</title>
    <link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        <!--左右触发点击事件-->
        function mousemove(div) {
            for (var i = 1; i <= 6; i++) {
                document.getElementById('box_top_' + i).style.backgroundColor = 'rgba(255,255,255,0)';
                document.getElementById('box_top_' + i).style.color = '#666666';
                document.getElementById('box_down_' + i).style.display = 'none';
            }
            document.getElementById('box_top_' + div).style.backgroundColor = 'rgba(255,255,255,0.8)';
            document.getElementById('box_top_' + div).style.color = '#666666';
            document.getElementById('box_down_' + div).style.display = 'block';
        }
        function turnoff(obj) {
            document.getElementById(obj).style.display = "none";
        }
//        function toggleSection(sid) {
//            var elh = document.getElementById('hsection' + sid)
//            var eld = document.getElementById('section' + sid)
//            if (elh.className == "collapsed") {
//                elh.className = "expanded"
//                eld.style.display = "block"
//            } else { // el.className == "expanded"
//                elh.className = "collapsed"
//                eld.style.display = "none"
//            }
//        }
    </script>
    <style type="text/css">
        /*.expanded {*/
            /*background-image: url('./images/arrow_down.png');*/
            /*background-repeat: no-repeat;*/
            /*text-indent: 23px;*/
        /*}*/
        /*.collapsed {*/
            /*background-image: url('./images/arrow_right.png');*/
            /*background-repeat: no-repeat;*/
            /*text-indent: 23px;*/
        /*}*/
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
        .panel-title{
            font-size: 18px;
        }
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
            position: absolute;
            top: 40%;
            left: 50%;
            background-color: rgba(177, 201, 233, 0.5);
            padding-left: 8px;
            padding-top: 8px;
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
            width: 169px;
            height: 97px;
            float: left;
            margin-left: 11%;
            margin-top: 30px;
            background-image: url("./images/minfilogo.png");
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
                border-left:2px solid #fa7923;
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
<div class="navbar-inverse navbar-fixed-top" style="font-size: 16px;" role="navigation" id="menu-nav">
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
        <div id="left_side" style="width:20%;height:80%;float:left;margin-top:35px;margin-left:0.5%;font-size:16px;">
            <div style="font-size: 30px;">
                <img src="./images/tools.png">&nbsp;&nbsp;Tools
            </div>
            <div class="panel-group" id="accordion1"style="margin-top:5px;">
                <div class="panel">
                    <div class="panel-heading" style="color:#fa7923;">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                Reading Data
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" >
                            <div id="box_top1">
                                <div id="box_top_1" onclick="JavaScript:mousemove(1);"><a>read.450k</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                                Quality Control
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id="box_top2">
                                <div id="box_top_2" onclick="JavaScript:mousemove(2);"><a>qcReport</a></div>
                                <div id="box_top_3" onclick="JavaScript:mousemove(3);"><a >density plots</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree">
                                Normalization
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id="box_top3">
                                <div id="box_top_4" onclick="JavaScript:mousemove(4);"><a>SWAN</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseFour">
                                DMPs
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div id="box_top4">
                                <div id="box_top_5" onclick="JavaScript:mousemove(5);"><a>Categorical phenotypes</a></div>
                                <div id="box_top_6" onclick="JavaScript:mousemove(6);"><a>Continuous phenotypes</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">

                $(function () {
                    $('#collapseTwo').collapse('hide')
                });
                $(function () {
                    $('#collapseThree').collapse('hide')
                });
                $(function () {
                    $('#collapseOne').collapse('show')
                });
                $(function () {
                    $('#collapseFour').collapse('hide')
                });
                $(function () {
                    $('#collapseFive').collapse('hide')
                });
                $(function () {
                    $('#collapseSix').collapse('hide')
                });

            </script>
        </div>

        <!--右边的珊格 -->
        <div id="right_side" style="margin-top:68px;margin-left:23%;width:70%;position:relative;background-color:#ffffff;font-size:16px;box-shadow: 10px 10px 50px;">
            <!-- minfi.read450k参数选择 -->
            <div class="panel-group" id="box_down_1" style="display:block;border-color: #0f0f0f">
                <s:form action="MinfiRead" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#champ_nece">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">read.450k</span>
                            </h4>
                        </div>
                        <div id="champ_nece" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>Please input the raw files</label>
                                    <input type="text" class="form-control" name="directory"
                                           placeholder="please input the raw file path"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfiread_opt">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="minfiread_opt" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfiread" value="1" checked
                                           onclick="javascript:turnoff('minfiread_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfiread" value="2"
                                           onclick="document.getElementById('minfiread_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--minfiread可选参数-->
                                <div id="minfiread_op" class="inputOption_setting" style="display:none;">
                                    <div id="advancedPair_setting_center" class="inputOption_setting_center"
                                         style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('minfiread_op')">×
                                        </button>
                                       <!-- ignore.case
                                        <label class="checkbox-inline">
                                            <input type="radio" name="ignore.case" value="TRUE" checked>TRUE
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="ignore.case" value="FLASE">FLASE
                                        </label><br>
                                        <h6>Should the file search be case sensitive.default=TRUE</h6>
                                        -->
                                        recursive
                                        <label class="checkbox-inline">
                                            <input type="radio" name="recursive" value="TRUE" checked>TRUE
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="recursive" value="FLASE">FLASE
                                        </label><br>
                                        <h6>Should the file search be recursive.If recursive is TRUE, the function searches base and all subdirectories.default=TRUE</h6>
                                        verbose
                                        <label class="checkbox-inline">
                                            <input type="radio" name="verbose" value="TRUE" checked>TRUE
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="verbose" value="FLASE">FLASE
                                        </label><br>
                                        <h6>Should the function be verbose.default=TRUE</h6>
                                        extended
                                        <label class="checkbox-inline">
                                            <input type="radio" name="extended" value="TRUE" checked>TRUE
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="extended" value="FLASE">FLASE
                                        </label><br>
                                        <h6>Should the output of the function be a "RGChannelSetExtended" (default is"RGChannelSet")FLASE.</h6>
                                        <input type="button" value="submit" class="btn_submit"
                                               onclick="javascript:turnoff('minfiread_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('minfiread_op')"/>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#champ_opt').collapse('show')
                                });
                                $(function () {
                                    $('#champ_nece').collapse('show')
                                });
                            </script>
                            <!--折叠拦ending-->
                        </div>
                    </div>
                    <div class="contact-form" style="margin: 25px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!-- end-->

            <!--minfi.qcReport参数选择-->
            <div class="panel-group" id="box_down_2" style="display:none">
                <s:form action="MinfiqcReport" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#champ_nece1">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">qcReport</span>
                            </h4>
                        </div>
                        <div id="champ_nece1" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>please input the path to save result</label>
                                    <input type="text" class="form-control" name="pdf"
                                           placeholder="input the path to save qcReport"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfiqc_opt1">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="minfiqc_opt1" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfiqc" value="1" checked
                                           onclick="javascript:turnoff('minfiQC_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfiqc" value="2"
                                           onclick="document.getElementById('minfiQC_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--minfi_qcReport可选参数-->
                                <div id="minfiQC_op" class="inputOption_setting" style="display:none;">
                                    <div id="inner_qcreport" class="inputOption_setting_center" style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('minfiQC_op')">×
                                        </button>
                                        maxSamplesPerPage
                                        <h6>Maximum number of samples to plot per page in those sections that plot each
                                            sample separately.default=24</h6>
                                        <input type="text" class="input_setting_text" name="maxSamplesPerPage"
                                               value="24"/><br>
                                        <input type="button" value="submit" class="btn_submit"
                                               onclick="javascript:turnoff('minfiQC_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('minfiQC_op')"/>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#champ_opt1').collapse('show')
                                });
                                $(function () {
                                    $('#champ_nece1').collapse('show')
                                });
                            </script>
                            <!--折叠拦ending-->
                        </div>
                    </div>
                    <div class="contact-form" style="margin: 20px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!-- end-->

            <!--minfi.densityPlot参数选择-->
            <div class="panel-group" id="box_down_3" style="display:none">
                <s:form action="MinfidensityPlot" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#champ_nece2">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">density plots</span>
                            </h4>
                        </div>
                        <div id="champ_nece2" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>please input the path to save result</label>
                                    <input type="text" class="form-control" name="resultsDir"
                                           placeholder="input the path to save result"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfidP_opt2">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="minfidP_opt2" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfidP" value="1" checked
                                           onclick="javascript:turnoff('minfidP_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_minfidP" value="2"
                                           onclick="document.getElementById('minfidP_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--champnorm_PBC可选参数-->
                                <div id="minfidP_op" class="inputOption_setting" style="display:none;">
                                    <div id="inner_pbc" class="inputOption_setting_center" style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('minfidP_op')">×
                                        </button>
                                        add&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="add" value="TRUE" checked>TRUE
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="add" value="FLASE">FLASE
                                        </label><br>
                                        <h6>Start a new plot?default=TRUE.</h6>
                                        legend&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="legend" value="TRUE" checked>TRUE
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="legend" value="FLASE">FLASE
                                        </label>
                                        <h6>Plot legend.default=TRUE.</h6>
                                        n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <h6>Number of different colors in the palette, minimum 3, maximum depending on palette.default=3.</h6>
                                        <input type="text" class="input_setting_text" name="n" value="3"/><br>
                                        name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <h6>A palette name from the lists below.</h6>
                                        <input type="text" class="input_setting_text" name="name"/><br>


                                        <input type="button" value="submit" class="btn_submit"
                                               onclick="javascript:turnoff('minfidP_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('minfidP_op')"/>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#champ_opt2').collapse('show')
                                });
                                $(function () {
                                    $('#champ_nece2').collapse('show')
                                });
                            </script>
                            <!--折叠拦ending-->
                        </div>
                    </div>
                    <div class="contact-form" style="margin: 25px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!-- end-->

            <!-- preprocessSWAN()参数选择-->
            <div class="panel-group" id="box_down_4" style="display:none">
                    <s:form action="MinfiSwan" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfi_nece5">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">SWAN</span>
                            </h4>
                        </div>
                        <div id="minfi_nece5" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>please input the path to save result</label>
                                    <input type="text" class="form-control" name="resultsDir"
                                           placeholder="input the path to save result"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfi_opt5">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="minfi_opt5" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameter_MinfiRaw"  value="1" checked
                                           onclick="javascript:turnoff('MinfiSwan_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameter_MinfiRaw"  value="2"
                                           onclick="document.getElementById('MinfiSwan_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--MinfiSwan可选参数-->
                                <div id="MinfiSwan_op" class="inputOption_setting" style="display:none;">
                                    <div id="inner_Swan" class="inputOption_setting_center" style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('MinfiSwan_op')">×
                                        </button>
                                     <!--   bg.correct&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="bg.correct" value="TRUE" checked>True
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="bg.correct" value="FLASE">Flase
                                        </label>
                                        <h6>logical, should background correction be performed.default=TRUE.</h6>

                                        reference&nbsp;&nbsp;
                                        <h6>for control normalization, which array is the reference.default=2</h6>
                                        <input type="text" class="input_setting_text" name="reference"
                                               value="2"/><br>


                                        method&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="checkbox-inline">
                                            <input type="radio" name="method" value="1">SWAN
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="method" value="2">None
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="method" value="3">Illumina
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="method" value="4">Noob
                                        </label>

                                        <h6>some method for normalization.default=SWAN</h6>-->
                                        verbose
                                        <label class="checkbox-inline">
                                            <input type="radio" name="verbose" value="TRUE" checked>True
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="verbose" value="FLASE">Flase
                                        </label>
                                        <h6>Should the function be verbose?.default=TRUE.</h6>
                                        <input type="button" value="submit" class="btn_submit"
                                               onclick="javascript:turnoff('MinfiSwan_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('MinfiSwan_op')"/>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#champ_opt4').collapse('show')
                                });
                                $(function () {
                                    $('#champ_nece4').collapse('show')
                                });
                            </script>
                            <!--折叠拦ending-->
                        </div>
                    </div>
                    <div class="contact-form" style="margin: 25px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!-- end-->

            <!-- dmp1参数选择-->
            <div class="panel-group" id="box_down_5" style="display: none">
                <s:form action="MinifDMP1" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfi_nece8">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">Categorical phenotypes</span>
                            </h4>
                        </div>
                        <div id="minif_nece8" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>please input the path to save result</label>
                                    <input type="text" class="form-control" name="resultsDir"
                                           placeholder="input the path to save result"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minif_opt8">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="minfi_opt8" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_MinfiDMP1"  value="1" checked
                                           onclick="javascript:turnoff('minfiDMP1_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_MinfiDMP1"  value="2"
                                           onclick="document.getElementById('minfiDMP1_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--minfiDMP1_op可选参数-->
                                <div id="minfiDMP1_op" class="inputOption_setting" style="display:none;">
                                    <div id="inner_DMP1" class="inputOption_setting_center" style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('minfiDMP1_op')">×
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
                                               onclick="javascript:turnoff('minfiDMP1_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('minfiDMP1_op')"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="contact-form" style="margin: 25px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!--end-->

            <!--dmp2-->
            <div class="panel-group" id="box_down_6" style="display: none">
                <s:form action="MinfiDMP2" role="form" method="post">
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#minfi_nece9">
                                    necessary parameter
                                </a>
                                <span style="float: right;color: #337ab7">Continuous phenotypes</span>
                            </h4>
                        </div>
                        <div id="minfi_nece9" class="panel-collapse collapse in">
                            <div class="content">
                                <div class="form-group">
                                    <label>please input the path to save result</label>
                                    <input type="text" class="form-control" name="resultsDir"
                                           placeholder="input the path to save result"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#champ_opt6">
                                    optional parameter
                                </a>
                            </h4>
                        </div>
                        <div id="champ_opt6" class="panel-collapse collapse in">
                            <div class="content" style="margin-left:4%;">
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_MinfiDMP2"  value="1" checked
                                           onclick="javascript:turnoff('minfiDMP2_op')">default
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="optionalParameters_MinfiDMP2"  value="2"
                                           onclick="document.getElementById('minfiDMP2_op').style.display='block'">set
                                    parameters by yourself
                                </label>
                                <!--champlasso可选参数-->
                                <div id="minfiDMP2_op" class="inputOption_setting" style="display:none;">
                                    <div id="inner_DMP2" class="inputOption_setting_center" style="overflow-y:scroll;">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                                onclick="javascript:turnoff('minfiDMP2_op')">×
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
                                               onclick="javascript:turnoff('minfiDMP2_op')"/>
                                        <input type="reset" value="cancel" class="btn_cancel"
                                               onclick="javascript:turnoff('minfiDMP2_op')"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="contact-form" style="margin: 25px;">
                        <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
                    </div>
                </s:form>
            </div>
            <!--end-->

        </div>
    </div>
</div>
</body>
</html>
