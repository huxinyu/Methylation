<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="mas.TokenProcessor" %>
<%--
  Created by IntelliJ IDEA.
  User: lily
  Date: 11/28/16
  Time: 5:08 PM
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
    <script src="./js/banner.js"></script>
    <script language="JavaScript">
        window.onload=function(){
            var obj=document.getElementById('choose_home');
            var login=<%=session.getAttribute("login")%>;
            if(login=='2'){
                obj.onclick = function () {
                    window.location.href = "home.jsp";
                }
            }
            else{
                obj.onclick = function () {
                    window.location.href = "home_initial.jsp";
                }
            }
            var obj=document.getElementById('choose_tool');
            obj.onclick=function(){
                window.location.href="Tools_initial.jsp";
            }
            var obj=document.getElementById('choose_meme');
            obj.onclick=function(){
                window.location.href="MEME.jsp";
            }
            var obj=document.getElementById('choose_work');
            obj.onclick=function(){
                window.location.href="WorkFlow.jsp";
            }
            //1 是未登录
            if(login=='2'){
                document.getElementById("login_span").style.display="block";
            }
            else{
                document.getElementById("login_span").style.display="none";
            }
        }
        function mouseOver(){
            document.getElementById("login_menu").style.display="block";
        }
        function mouseOut(){
            document.getElementById("login_menu").style.display="none";
        }
    </script>
    <style type="text/css">
        body{
            font-family: Arial;
        }
        #back{
            width:100%;
            height:800px;
            background-color:#ebeaea;
        }
        #banner{
            height:200px;
            background: url("./img/back3new.png") no-repeat;
            background-size:cover;
            background-position:center;
            z-index:800;
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
            color:#57779e;
            border-radius: 5px;
            background-color:rgba(255,255,255,0.9);
            text-shadow:1px 2px 3px #bdbcbb;
            width:65px;
            padding-left:12px;
            height:35px;
            float:right;
            font-weight: 300;
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
            color:##57779e;
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
        #choose_tool{
            color:#ffffff;
            background:none;
            width:60px;
            padding-left:12px;
            height:35px;
            float:right;
            font-weight: 300;
        }
        #choose_tool:hover{
            color:#57779e;
            border-left:none;
            border-right:none;
            border-top:none;
            border-radius: 5px;
            font-weight: 500;
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
            background-color: #ffffff;
            text-align:center;
            overflow:hidden;
        }
        #i9_img{
            margin-top:50px;
            width:64px;
            height:64px;

        }
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
    <div id="list_choose">
        <div  id="choose_help">About Us</div>
        <div  id="choose_meme">Downstream Analysis</div>
        <div  id="choose_tool">Tools</div>
        <div  id="choose_work">Work Flow</div>
        <div  id="choose_home">Home</div>
    </div>
    <div id="login_span" style="display:none" onmouseover="mouseOver();" onmouseout="mouseOut();">
        <%=session.getAttribute("account")%><div id="arrow-down_user"></div>
    </div>
    <div id="login_menu" onmouseover="mouseOver();" onmouseout="mouseOut();" style="display:none">
        <div id="Work" onclick="JavaScript:myWork();">My work</div>
        <form action="Exit" method="post"><input type="submit" id="Exit" value="Exit"></form>
    </div>
</div>
    <div id="side_center">
        <img id="i9_img" src="./img/i9.png"/>
        <div id="content">
        There are some errors in the web page:<br>
        The server error code:${requestScope["javax.servlet.error.status_code"]}
            </div>
        </div>
</div>
</body>
</html>
