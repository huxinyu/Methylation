<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/22
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script language="JavaScript">
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
        function turnoff(obj){
            document.getElementById(obj).style.display="none";
        }
    </script>
    <style type="text/css">
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
        #side_center{
            width:80%;
            height:360px;
            margin:0 auto;
            margin-top:-20px;
            box-shadow:5px 5px 20px #999999;
            -moz-box-shadow:5px 5px 20px #999999;
            -webkit-box-shadow:5px 5px 20px #999999;
            background-size: 100%;
            z-index:990;
            background-image: url("./images/login-back.png");
        }
        #box_top{
            padding-top:50px;
            width:30%;
            height:30px;
            float:right;
            margin-right:10%;
        }
        #box_top_1{
            width:50%;
            height:50px;
            text-align: center;
            line-height: 50px;
            float:left;
            font-weight:300;
            color:#666666;
            background-color: rgba(255,255,255,0.8);
        }
        #box_top_2{
            width:50%;
            height:50px;
            text-align: center;
            line-height: 50px;
            float:right;
            font-weight:300;
            color:#666666;
        }
        #box_down_1{
            width:30%;
            height:60%;
            float:right;
            margin-top:100px;
            margin-right: -30%;
            background-color:rgba(255,255,255,0.8);
        }
        #box_down_2{
            width:30%;
            height:60%;
            float:right;
            margin-top:100px;
            margin-right: -30%;
            background-color:rgba(255,255,255,0.8);
        }
        #login_user_regi{
            color:#666666;
            float:right;
            margin-right:20px;
            margin-top:35px;
        }
        #login_user_regi:hover{
            color:#fa7923;
            float:right;
            margin-right:20px;
            margin-top:35px;

        }
        .inputOption_setting{
            width:380px;
            height:200px;
            position:fixed;
            top:40%;
            left:50%;
            background-color:rgba(177,201,233,0.5);
            padding-left:5px;
            padding-top:8px;
        }
        .inputOption_setting_center{
            width:98%;
            height:97%;
            padding-left:15px;
            padding-top:5px;
            background-color: #b1c9e9;
            font-size:14px;
            font-weight: 500;
            color:#464646;
        }
        .input_setting_text{
            width:98%;
            margin:0 auto;
            height:23px;
            line-height: 23px;
            border-radius: 5px;
            border:1px solid #999999;
            margin-bottom:5px;
            padding-left:5px;
        }
        .btn_submit,.btn_cancel{
            line-height: 20px;
            border-radius: 5px;border: 1px solid #F9A32D;
            color:#ffffff;
            background-color:#F9A32D;
            height:25px; width:60px;
            margin-left:80px;
            margin-bottom:15px;
        }
        .btn{
            line-height: 20px;
            border-radius: 5px;border: 1px solid #F9A32D;
            color:#ffffff;
            background-color:#F9A32D;
            height:40px; width:80px;
            margin-left:110px;
            margin-right: 10px;
            margin-top:25px;
            margin-bottom:15px;
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
                <li><a href="about.jsp">About us</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="back">
    <div id="banner">
        <div id="logo_span"></div>
    </div>
    <div id="side_center">
        <div id="box_top">
            <div id="box_top_1" onmousemove="JavaScript:mousemove(1);"><span style="color: #337ab7;font-size: 17px;"><strong>Login for users</strong></span></div>
            <div id="box_top_2" onmousemove="JavaScript:mousemove(2);"><span style="color: #337ab7;font-size: 17px" ><strong>Login for admin</strong></span></div>
        </div>
        <div id="box_down_1">
            <s:form action="login">
            <input type="text" name="name" placeholder="Please input your account" style ="width:80%;height:28px;padding-left:10px;margin-left:30px;margin-top:20px;border-radius: 10px;border:1px solid #999999;">
            <input type="text" name="password" placeholder="Please input your password" style="width:80%;height:28px;padding-left:10px;margin-left:30px;margin-top:20px;border-radius: 10px;border:1px solid #999999;">
            <input type="submit" value="submit" class="btn"/>
            </s:form>
            <s:form action="reg">
                    <div id="login_user_regi" onclick="document.getElementById('register').style.display='block'">Register</div>
                    <div id="register" class="inputOption_setting" style="display:none;">
                        <div id="advancedPair_setting_center" class="inputOption_setting_center">
                            Please input your account(used for logging in)
                            <input type="text" name="name" class="input_setting_text">
                            Please input your password
                            <input type="text" name="password" class="input_setting_text">
                            Please repeat your password
                            <input type="text" name="register_pass_re" class="input_setting_text">
                            <input type="submit" value="register" class="btn_submit" />
                            <input type="button" value="cancel" class="btn_cancel" onclick="javascript:turnoff('register')" />
                        </div>
                    </div>

            </s:form>
        </div>
        <div id="box_down_2" style="display:none">
            <s:form action="login_admin">
            <input type="text" name="login_admin_name" placeholder="Please input your account" style="width:80%;height:28px;padding-left:10px;margin-left:30px;margin-top:20px;border-radius: 10px;border:1px solid #999999;">
            <input type="text" name="login_admin_pass" placeholder="Please input your password" style="width:80%;height:28px;padding-left:10px;margin-left:30px;margin-top:20px;border-radius: 10px;border:1px solid #999999;">

                <input type="button" value="submit" class="btn"/>
            </s:form>
        </div>
    </div>

    <script src="bootstrap-3.3.7-dist/js/jquery-1.11.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</div>
</body>
</html>
