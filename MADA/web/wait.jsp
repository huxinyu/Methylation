<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: lily
  Date: 9/25/16
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="refresh" content="2;url=">
<html>
<head>
    <METE NAME="renderer" CONTENT="webkit|ie-comp|ie-stand"/>
    <META HTTP-EQUIV="pragma" CONTENT="no-cache"/>
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
    <META HTTP-EQUIV="expires" CONTENT="0"/>
    <title></title>
    <script language="JavaScript">
       function donTouch(){
           var msg = "If you leave this page, the operation will be stopped!";
           if (confirm(msg)==true){
               return true;
           }else{
               return false;
           }
       }
    </script>
    <style type="text/css">
        body{
            font-family: Arial;
        }
        #back{
            width:100%;
            height:100%;
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
            height:70%;
            margin:0 auto;
            margin-top:-20px;
            box-shadow:5px 5px 20px #999999;
            -moz-box-shadow:5px 5px 20px #999999;
            -webkit-box-shadow:5px 5px 20px #999999;
            background-size: 100%;
            z-index:990;
            background-color: #ffffff;
            overflow-y:scroll;
        }
        ul{
            padding-right:10px;
        }
       #side_center1{
           width:100%;
           height:100%;
           text-align:center;
           margin-top:10%;
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
<div id="center">
    <div id="back">
        <div id="banner">
            <div id="logo_span"></div>
            <div id="list_choose">
                <div  id="choose_help" onclick="donTouch()">About Us</div>
                <div  id="choose_meme" onclick="donTouch()">Downstream Analysis</div>
                <div  id="choose_tool" onclick="donTouch()">Tools</div>
                <div  id="choose_work" onclick="donTouch()">Work Flow</div>
                <div  id="choose_home" onclick="donTouch()">Home</div>
            </div>
        </div>
        <div id="side_center">
            <div id="side_center1">
                <img src="./img/wait.gif"><br>
                <h2>The server is processing your data, please wait.You may bookmark this page or click the Recent Jobs button at the top to access your job's results.</h2>
            </div>

            </div>
</div>
    </div>
</body>
</html>
