<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>about us</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Avalon Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/move-top.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/easing.js"></script>

    <style type="text/css">
        .ipt{
            box-shadow: 2px 2px 50px  #888888;
        }
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
        #back{
            width:100%;
            height:800px;
            background-color:#ebeaea;
        }
        #banner{
            height:190px;
            background: url("./images/back3.png") no-repeat;
            background-size:cover;
            background-position:center;
            z-index:800;
        }
        #logo_span{
            width:258px;
            height:106px;
            float:left;
            margin-left:11%;
            margin-top:30px;
            background-image: url("./images/logo.png");
        }
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
                <li><a href="#" data-toggle="modal" data-target="#about-modal">About us</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="back">
    <div id="banner">
        <div id="logo_span"></div>
    </div>
    <!--content-->
    <div class="contact" style="padding-top:35px;">
        <div class="container" >
            <div class="contact-info">
                <h2>GET IN &nbsp;<span style="color: #faae23" ;>TOUCH</span></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-body"style="font-size: 20px;padding: 20px;box-shadow: 10px 10px 50px;">
                    <span style="color:#5d9cec">Address:</span>School of Information Science and Engineering，Central South University，Changsha,Hunan,China<br><br>
                    <span style="color:#5d9cec">Post:</span>410083<br><br>
                    <span style="color:#5d9cec">Phone：</span>+86-73188830212<br><br>
                    <span style="color:#5d9cec">Fax：</span>+86-73188830212<br><br>
                    <span style="color:#5d9cec">Contact：</span>+86-1310328854<br><br>
                    <span style="color:#5d9cec">Jianxin Wang (Professor): </span>jxwang@mail.csu.edu.cn<br><br>
                    <span style="color:#5d9cec">Min Li (Professor):</span>limin@mail.csu.edu.cn<br><br>
                </div>
            </div>

            <div class="contact-form"style="padding-top:35px;">
                <div class="contact-info">
                    <h2>CONTACT &nbsp;<span style="color: #faae23">FORM</span></h2>
                </div>
                <form>
                    <div class="contact-left">
                        <input type="text" class="ipt" placeholder="Name" required>
                        <input type="text" class="ipt" placeholder="E-mail" required>
                        <input type="text" class="ipt" placeholder="Subject" required>
                    </div>
                    <div class="contact-right"style="box-shadow: 10px 10px 50px;">
                        <textarea placeholder="Message" required></textarea>
                    </div>
                    <div class="clearfix"></div>
                    <input type="submit" value="SUBMIT" style="background-color: #faae23;border: 3px solid #faae23;">
                </form>
            </div>
        </div>
    </div>
</div>
<script src="bootstrap-3.3.7-dist/js/jquery-1.11.1.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</body>
</html>


