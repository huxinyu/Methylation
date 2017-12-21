<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/23
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>450k_Analysis</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Description</title>
  <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>

    body {
      padding-top: 50px;
      padding-bottom: 40px;
      color: #5a5a5a;
    }
    #banner {
      height: 190px;
      background:url("./images/back3.png") no-repeat;
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

    .carousel .item {
      height: 500px;
      background-color: #000;
    }

    .carousel .item img {
      width: 100%;
    }
    .carousel-caption p {
      margin-bottom: 20px;
      font-size: 20px;
      line-height: 1.8;
    }

    /* 简介 */

    .summary {
      padding-right: 15px;
      padding-left: 15px;
    }

    .summary .col-md-4 {
      margin-bottom: 20px;
      text-align: center;
    }

    /* 特性 */

    .feature-divider {
      margin: 40px 0;
    }

    .feature {
      padding: 30px 0;
    }

    .feature-heading {
      font-size: 50px;
      color: #2a6496;
    }

    .feature-heading .text-muted {
      font-size: 28px;
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
  </style>
</head>
<div>
  <div id="back">
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
            <li><a href="#summary-container">Description</a></li>
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
  </div>
  <!-- 主要内容 -->
  <div class="container summary">
    <!-- 简介 -->
    <div class="row" style="margin-top: 50px;" id="summary-container">
      <div class="col-md-4">
        <img class="img-circle" src="images/logo/champ_logo_small.png" alt="chrome">

        <h2>ChAMP</h2>

        <p>450k Chip Analysis Methylation Pipeline</p>

        <p><a class="btn btn-default"  href="champ.jsp" role="button">Click into Analysis</a></p>
      </div>
      <div class="col-md-4">
        <img class="img-circle" src="images/logo/minfi_logo_small.png" alt="firefox">

        <h2>Minfi</h2>

        <p>Analyze Illumina Infinium DNA methylation arrays</p>

        <p><a class="btn btn-default" href="minfi.jsp" role="button">Click into Analysis</a></p>
      </div>
      <div class="col-md-4">
        <img class="img-circle" src="images/logo/rnbeads_logo_small.png" alt="safari">

        <h2>RnBeads</h2>

        <p>Comprehensive Analysis of DNA Methylation Data</p>

        <p><a class="btn btn-default"href="rnbeads.jsp" role="button">Click into Analysis</a></p>
      </div>
    </div>

    <!-- 特性 -->
    <hr class="feature-divider">

    <ul class="nav nav-tabs" role="tablist" id="feature-tab">
      <li class="active"><a href="#tab-chrome" role="tab" data-toggle="tab">ChAMP</a></li>
      <li><a href="#tab-firefox" role="tab" data-toggle="tab">Minfi</a></li>
      <li><a href="#tab-safari" role="tab" data-toggle="tab">RnBeads</a></li>
      <li><a href="#tab-opera" role="tab" data-toggle="tab">Methylumi</a></li>
      <li><a href="#tab-ie" role="tab" data-toggle="tab">waterRmelon</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tab-chrome">
        <div class="row feature">
          <div class="col-md-7">

            <h2 class="feature-heading"><a href="champ.jsp">ChAMP</a><span class="text-muted">automates pipeline</span></h2>

            <p class="lead">ChAMP includes pre-processing and published methods for adjustment of type 2 bias (squares) and novel methods (circles) for batch effect assessment, DMR correction and CNA analysis</p>
          </div>
          <div class="col-md-5">
            <img class="feature-image img-responsive" src="images/logo/champ_logo.png"
                 alt="Chrome">
          </div>
        </div>
      </div>
      <div class="tab-pane" id="tab-firefox">
        <div class="row feature">
          <div class="col-md-5">
            <img class="feature-image img-responsive" src="images/logo/minfi_logo.png"
                 alt="Firefox">
          </div>
          <div class="col-md-7">

            <h2 class="feature-heading">Minfi <span class="text-muted">Comprehensive suite of functions</span>
            </h2>

            <p class="lead">Minfi package include preprocessing, QC assessments, identification of interesting methylation loci and plotting functionality.</p>
          </div>
        </div>
      </div>
      <div class="tab-pane" id="tab-safari">
        <div class="row feature">
          <div class="col-md-7">

            <h2 class="feature-heading">RnBeads <span class="text-muted">Comprehensive suite of functions</span></h2>

            <p class="lead">RnBeads is an R package for the comprehensive analysis of genome-wide DNA methylation data with single basepair resolution,devise effective algorithms for dealing with large-scale DNA methylation data and implements these methods.</p>
          </div>
          <div class="col-md-5">
            <img class="feature-image img-responsive" src="images/logo/rnbeads_logo.png"
                 alt="Safari">
          </div>
        </div>
      </div>
      <div class="tab-pane" id="tab-opera">
        <div class="row feature">
          <div class="col-md-5">
            <img class="feature-image img-responsive" src="images/logo/methylumi_logo.png"
                 alt="Opera">
          </div>
          <div class="col-md-7">

            <h2 class="feature-heading">Methylumi <span class="text-muted">Comprehensive suite of functions</span>
            </h2>

            <p class="lead">The methylumi package provides convenient mechanisms for loading the results of the Illumina methylation platform into R/Bioconductor. Classes based on common Bioconductor classes for encapsulating the data and facilitate data manipulation are at the core of the package, with methods for quality control, normalization,and plotting.</p>
          </div>
        </div>
      </div>
      <div class="tab-pane" id="tab-ie">
        <div class="row feature">
          <div class="col-md-7">

            <h2 class="feature-heading">waterRmelon <span class="text-muted">Preprocessing including performance metrics</span></h2>

            <p class="lead">The wateRmelon package is designed to make it convenient to use the data quality metrics and normalization methods from our paper [as part of existing pipelines or work flows.</p>
          </div>
          <div class="col-md-5">
            <img class="feature-image img-responsive" src="images/logo/water_logo.png"
                 alt="IE">
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
    <script src="bootstrap-3.3.7-dist/js/jquery-1.11.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <footer>
      <p class="pull-right"><a href="#top">To top</a></p>

      <p>&copy; 2017 450k_Analysis</p>
    </footer>
  </div>
</div>
</body>
</html>
</body>
</html>

