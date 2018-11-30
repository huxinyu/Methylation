<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/13
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:form action="RAW" enctype="multipart/form-data" method="post">


    <div class="file-box">
    上传的文件：<input type="file" name="fileField_raw"  />
    </div><br>
    输入的字符串：<input type="text"  name="string_name" class="input_text"/><br>

    <input type="submit" value="Execute" class="Execute_btn" id="btn_RAW"/><s:fielderror
        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>

</s:form>

</body>
</html>