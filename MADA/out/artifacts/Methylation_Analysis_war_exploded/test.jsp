<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/15
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <%--<link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet" type="text/css" media="all"/>--%>
    <%--<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style type="text/css">
        .tip{
            width:15px;
            height:15px;
        }

        .tip_out{
            float:right;
            margin-left:5px;
        }
    </style>
</head>
<body>

<div class="tip_out"><img class="tip" id="tip2" src="./img/tip.png"
                          data-container="body" data-toggle="popover" data-placement="left"
                          data-content="左侧的 Popover 中的一些内容"></div>
</body>
<script>
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</html>
