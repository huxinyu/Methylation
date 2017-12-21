<%@ taglib prefix="s" uri="/struts-tags" %>
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
  <title>Tools_champ</title>
  <link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    <!--左右触发点击事件-->
    function mousemove(div) {
      for (var i = 1; i <= 7; i++) {
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
  </script>
  <style type="text/css">
    .panel-title{
      font-size: 18px;
    }
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
      width: 192px;
      height: 95px;
      float: left;
      margin-left: 11%;
      margin-top: 30px;
      background-image: url("./images/logo_champ.png");
    }

    /* 响应式布局 */

    @media (max-width: 768px) {

      .summary {
        padding-right: 3px;
        padding-left: 3px;
      }
1
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
        <li class="active"><a href="#">Welcome</a></li>
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
        <li><a href="about.jsp" >About us</a></li>
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
    <div id="left_side" style="width:21%;height:80%;float:left;margin-top:25px;margin-left:0.5%;font-size: 16px">
      <div style="font-size: 30px;">
        <img src="./images/tools.png">&nbsp;&nbsp;Tools
      </div>
      <div class="panel-group" id="accordion1"style="margin-top:15px;">
        <div class="panel">
          <div class="panel-heading" style="color:#fa7923;">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion"
                 href="#collapseOne">
                Pre-processing
              </a>
            </h4>
          </div>
          <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">
              <div id="box_top1">
                <div id="box_top_1" onclick="JavaScript:mousemove(1);"><a>BMIQ</a></div>
                <div id="box_top_2" onclick="JavaScript:mousemove(2);"><a>PBC</a></div>
                <div id="box_top_3" onclick="JavaScript:mousemove(3);"><a>SWAN</a></div>
                <div id="box_top_4" onclick="JavaScript:mousemove(4);"><a>Funnorm</a></div>
                <div id="box_top_5" onclick="JavaScript:mousemove(5);"><a>Illumina</a></div>
                <div id="box_top_6" onclick="JavaScript:mousemove(6);"><a>Dasen</a></div>
                <div id="box_top_7" onclick="JavaScript:mousemove(7);"><a>SQN</a></div>
                <div id="box_top_8" onclick="JavaScript:mousemove(8);"><a>Noob</a></div>
                <div id="box_top_9" onclick="JavaScript:mousemove(9);"><a>ASMN</a></div>

              </div>
            </div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion"
                 href="#collapseTwo">
                DMPs
              </a>
            </h4>
          </div>
          <div id="collapseTwo" class="panel-collapse collapse in">
            <div class="panel-body">
              <div id="box_top2">
                <div id="box_top_10" onclick="JavaScript:mousemove(10);"><a>DMRcate</a></div>
                <div id="box_top_11" onclick="JavaScript:mousemove(11);"><a>comb-p</a></div>
                <div id="box_top_12" onclick="JavaScript:mousemove(12);"><a>Probe Lasso</a></div>
                <div id="box_top_13" onclick="JavaScript:mousemove(13);"><a>Bumphunter</a></div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion"
                 href="#collapseThree">
                DMR
              </a>
            </h4>
          </div>
          <div id="collapseThree" class="panel-collapse collapse in">
            <div class="panel-body">
              <div id="box_top3">

              </div>
            </div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion"
                 href="#collapseFour">
                Visualization
              </a>
            </h4>
          </div>
          <div id="collapseFour" class="panel-collapse collapse in">
            <div class="panel-body">
              <div id="box_top4">
              </div>
            </div>
          </div>
        </div>

        <!--

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
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFive">
                      DMRs
                    </a>
                  </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse in">
                  <div class="panel-body">
                    <div id="box_top5">
                    </div>
                  </div>
                </div>
              </div>
              -->
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
    <div id="right_side" style="margin-top:68px;margin-left:25%;width:70%;position:relative;background-color:#ffffff;font-size:16px;box-shadow: 10px 10px 50px">
    <!-- champ.load()_bmiq参数选择-->
      <div class="panel-group" id="box_down_1" style="display:block">
        <s:form action="Load_first1" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">BMIQ</span>
              </h4>
            </div>
            <div id="champ_nece" class="panel-collapse collapse in">
              <div class="content">
                <div class="form-group">
                  <label>Please input the raw files</label>
                  <input type="text" class="form-control" name="directory"
                         placeholder="please input the raw file path"/>
                  <label>please input the path to save result</label>
                  <input type="text" class="form-control" name="resultsDir"
                         placeholder="input the path to save result"/>
                  <label>please input whether you prefer m-values M or beta-values B</label><br>
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="B" checked>B
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="M">M
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_opt">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_Load" value="1" checked
                         onclick="javascript:turnoff('champload_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_Load" value="2"
                         onclick="document.getElementById('champload_op').style.display='block'">set
                  parameters by yourself
                </label>
                <!--champload可选参数-->
                <div id="champload_op" class="inputOption_setting" style="display:none;">
                  <div id="advancedPair_setting_center" class="inputOption_setting_center"
                       style="overflow-y:scroll;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="javascript:turnoff('champload_op')">×
                    </button>
                    <!--
                    methValue
                    <label class="checkbox-inline">
                      <input type="radio" name="methValue" value="B" checked>B
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="checkbox-inline">
                      <input type="radio" name="methValue" value="M">M
                    </label><br>
                    <h6>Indicates whether you prefer m-values M or beta-values B.default=B</h6>
                    -->
                    filterDetP&nbsp;&nbsp;
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="TRUE" checked>True
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="FLASE">Flase
                    </label>
                    <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>

                    detSamplecut
                    <h6>The detection p value threshhold for samples.Samples with above proportion of failed p value will be removed.default=0.1</h6>
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
                      <input type="radio" name="filterBeads" value="FLASE">F
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

                    <input type="button" value="submit" class="btn_submit"
                           onclick="javascript:turnoff('champload_op')"/>
                    <input type="reset" value="cancel" class="btn_cancel"
                           onclick="javascript:turnoff('champload_op')"/>
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

      <!--champ.norm()_pbc参数选择-->
      <div class="panel-group" id="box_down_2" style="display:none">
        <s:form action="PBC" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece1">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">PBC</span>
              </h4>
            </div>
            <div id="champ_nece1" class="panel-collapse collapse in">
              <div class="content">
                <div class="form-group">
                  <label>please input the path to save result</label>
                  <label>Please input the raw files</label>
                  <input type="text" class="form-control" name="directory"
                         placeholder="please input the raw file path"/>
                  <label>please input the path to save result</label>
                  <input type="text" class="form-control" name="resultsDir"
                         placeholder="input the path to save result"/>
                  <label>please input whether you prefer m-values M or beta-values B</label><br>
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="B" checked>B
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="M">M
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_opt1">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt1" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_BMIQ" value="1" checked
                         onclick="javascript:turnoff('champBMIQ_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_BMIQ" value="2"
                         onclick="document.getElementById('champBMIQ_op').style.display='block'">set
                  parameters by yourself
                </label>
                <!--champnorm_BMIQ可选参数-->
                <div id="champBMIQ_op" class="inputOption_setting" style="display:none;">
                  <div id="inner_bmiq" class="inputOption_setting_center" style="overflow-y:scroll;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="javascript:turnoff('champBMIQ_op')">×
                    </button>

                    filterDetP&nbsp;&nbsp;
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="TRUE" checked>True
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="FLASE">Flase
                    </label>
                    <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>

                    detSamplecut
                    <h6>The detection p value threshhold for samples.Samples with above proportion of failed p value will be removed.default=0.1</h6>
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
                      <input type="radio" name="filterBeads" value="FLASE">F
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

                    <input type="button" value="submit" class="btn_submit"
                           onclick="javascript:turnoff('champBMIQ_op')"/>
                    <input type="reset" value="cancel" class="btn_cancel"
                           onclick="javascript:turnoff('champBMIQ_op')"/>
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
          <div class="contact-form" style="margin: 25px;">
            <input type="submit" value="excute" style="margin-left:12px;background-color: #faae23;border: 0px solid #faae23;">
          </div>
        </s:form>
      </div>
      <!-- end-->

      <!--champ.norm()_swan参数选择-->
      <div class="panel-group" id="box_down_3" style="display:none">
        <s:form action="SWAN" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece2">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">SWAN</span>
              </h4>
            </div>
            <div id="champ_nece2" class="panel-collapse collapse in">
              <div class="content">
                <div class="form-group">
                  <label>please input the path to save result</label>
                  <label>Please input the raw files</label>
                  <input type="text" class="form-control" name="directory"
                         placeholder="please input the raw file path"/>
                  <label>please input the path to save result</label>
                  <input type="text" class="form-control" name="resultsDir"
                         placeholder="input the path to save result"/>
                  <label>please input whether you prefer m-values M or beta-values B</label><br>
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="B" checked>B
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="M">M
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_opt2">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt2" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_PBC" value="1" checked
                         onclick="javascript:turnoff('champPBC_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_PBC" value="2"
                         onclick="document.getElementById('champPBC_op').style.display='block'">set
                  parameters by yourself
                </label>
                <!--champnorm_PBC可选参数-->
                <div id="champPBC_op" class="inputOption_setting" style="display:none;">
                  <div id="inner_pbc" class="inputOption_setting_center" style="overflow-y:scroll;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="javascript:turnoff('champPBC_op')">×
                    </button>

                    filterDetP&nbsp;&nbsp;
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="TRUE" checked>True
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="FLASE">Flase
                    </label>
                    <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>

                    detSamplecut
                    <h6>The detection p value threshhold for samples.Samples with above proportion of failed p value will be removed.default=0.1</h6>
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
                      <input type="radio" name="filterBeads" value="FLASE">F
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

                    <input type="button" value="submit" class="btn_submit"
                           onclick="javascript:turnoff('champPBC_op')"/>
                    <input type="reset" value="cancel" class="btn_cancel"
                           onclick="javascript:turnoff('champPBC_op')"/>
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

      <!-- champ.norm()_FunctionalNormalize参数选择-->
      <div class="panel-group" id="box_down_4" style="display:none">
        <s:form action="FunctionalNormalize" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece3">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">FunctionalNormalize</span>
              </h4>
            </div>
            <div id="champ_nece3" class="panel-collapse collapse in">
              <div class="content">
                <div class="form-group">
                  <label>please input the path to save result</label>
                  <label>Please input the raw files</label>
                  <input type="text" class="form-control" name="directory"
                         placeholder="please input the raw file path"/>
                  <label>please input the path to save result</label>
                  <input type="text" class="form-control" name="resultsDir"
                         placeholder="input the path to save result"/>
                  <label>please input whether you prefer m-values M or beta-values B</label><br>
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="B" checked>B
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label class="checkbox-inline">
                    <input type="radio" name="methValue" value="M">M
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_opt3">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt3" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_SWAN" id="default" value="1" checked
                         onclick="javascript:turnoff('champSWAN_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_SWAN" id="setbymyself" value="2"
                         onclick="document.getElementById('champSWAN_op').style.display='block'">set
                  parameters by yourself
                </label>
                <!--champnorm_SWAN可选参数-->
                <div id="champSWAN_op" class="inputOption_setting" style="display:none;">
                  <div id="inner_swan" class="inputOption_setting_center" style="overflow-y:scroll;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="javascript:turnoff('champSWAN_op')">×
                    </button>

                    filterDetP&nbsp;&nbsp;
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="TRUE" checked>True
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="filterDetP" value="FLASE">Flase
                    </label>
                    <h6>If filter=T,then probes above the detPcut will be filtered out.</h6>

                    detSamplecut
                    <h6>The detection p value threshhold for samples.Samples with above proportion of failed p value will be removed.default=0.1</h6>
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
                      <input type="radio" name="filterBeads" value="FLASE">F
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

                    <input type="button" value="submit" class="btn_submit"
                           onclick="javascript:turnoff('champSWAN_op')"/>
                    <input type="reset" value="cancel" class="btn_cancel"
                           onclick="javascript:turnoff('champSWAN_op')"/>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(function () {
                  $('#champ_opt3').collapse('show')
                });
                $(function () {
                  $('#champ_nece3').collapse('show')
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

      <!-- champ.SVD()参数选择-->
      <div class="panel-group" id="box_down_5" style="display:none">
        <s:form action="Champ_SVD" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece4">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">SVD</span>

              </h4>
            </div>
            <div id="champ_nece4" class="panel-collapse collapse in">
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
                   href="#champ_opt4">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt4" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameter_ChampSVD"  value="1" checked
                         onclick="javascript:turnoff('champSVD_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameter_ChampSVD"  value="2"
                         onclick="document.getElementById('champSVD_op').style.display='block'">set
                  parameters by yourself
                </label>
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

                    <input type="button" value="submit" class="btn_submit"
                           onclick="javascript:turnoff('champSVD_op')"/>
                    <input type="reset" value="cancel" class="btn_cancel"
                           onclick="javascript:turnoff('champSVD_op')"/>
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

      <!-- champ.MVP()参数选择-->
      <div class="panel-group" id="box_down_6" style="display: none">
        <s:form action="Champ_MVP" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece5">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">MVP</span>
              </h4>
            </div>
            <div id="champ_nece5" class="panel-collapse collapse in">
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
                   href="#champ_opt5">
                  optional parameter
                </a>
              </h4>
            </div>
            <div id="champ_opt5" class="panel-collapse collapse in">
              <div class="content" style="margin-left:4%;">
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_MVP"  value="1" checked
                         onclick="javascript:turnoff('champMVP_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_MVP"  value="2"
                         onclick="document.getElementById('champMVP_op').style.display='block'">set
                  parameters by yourself
                </label>
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
              <script type="text/javascript">
                $(function () {
                  $('#champ_opt5').collapse('show')
                });
                $(function () {
                  $('#champ_nece5').collapse('show')
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
      <!--end-->

      <!--champ.lasso-->
      <div class="panel-group" id="box_down_7" style="display: none">
        <s:form action="Champ_lasso" role="form" method="post">
          <div class="panel">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#champ_nece6">
                  necessary parameter
                </a>
                <span style="float: right;color: #337ab7">lasso</span>
              </h4>
            </div>
            <div id="champ_nece6" class="panel-collapse collapse in">
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
                  <input type="radio" name="optionalParameters_lasso"  value="1" checked
                         onclick="javascript:turnoff('champLASSO_op')">default
                </label>
                <label class="checkbox-inline">
                  <input type="radio" name="optionalParameters_lasse"  value="2"
                         onclick="document.getElementById('champLASSO_op').style.display='block'">set
                  parameters by yourself
                </label>
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
              <script type="text/javascript">
                $(function () {
                  $('#champ_opt6').collapse('show')
                });
                $(function () {
                  $('#champ_nece6').collapse('show')
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
      <!--end-->

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
