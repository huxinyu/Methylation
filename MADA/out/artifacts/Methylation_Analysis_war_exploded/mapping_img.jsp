<%@page import="java.io.*" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2017/4/13
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
<%
  try{
  response.setHeader("Pragma","No-cache");
  response.setHeader("Cache-Control","no-cache");
  response.setDateHeader("Expires", 0);
  String img =request.getParameter("path");

  BufferedInputStream bis = null;
  OutputStream os = null;
  FileInputStream fileInputStream = new FileInputStream(new File(img));

  bis = new BufferedInputStream(fileInputStream);
  byte[] buffer = new byte[512];
  response.reset();
  //  response.setCharacterEncoding("UTF-8");
  //不同类型的文件对应不同的MIME类型
  response.setContentType("image/*");
  //文件以流的方式发送到客户端浏览器
  //response.setHeader("Content-Disposition","attachment; filename=img.jpg");
  //response.setHeader("Content-Disposition", "inline; filename=img.jpg");

  response.setContentLength(bis.available());

  os = response.getOutputStream();
  int n;
  while ((n = bis.read(buffer)) != -1) {
  os.write(buffer, 0, n);
  }
  bis.close();
  os.flush();
  os.close();
  }catch(Exception e){
  e.printStackTrace();
  }



%>
</body>
</html>
