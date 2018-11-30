<%@ page import="mas.TokenProcessor" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/9 0009
  Time: 下午 10:41
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
    <link rel="stylesheet" href="./layer/skin/layer.css">
    <link rel="stylesheet" href="./layer/skin/layer.ext.css">

    <script src="./js/banner.js"></script>
    <script src="./jquery-1.11.1/jquery.js"></script>
    <script src="./layer/layer.js"></script>
    <script language="javascript">
        function fileChange(target, box) {
            var filename;
            filename = target.files[0].name;
            var fileSize;
            var filemaxsize = 2048 * 1024;//1G
            fileSize = target.files[0].size;
            var size = fileSize / 1024;
            if (size > filemaxsize) {
                alert("Upload files can not be larger than 2G!");
                document.getElementById(box).value = "";
                target.value = "";
                return false;
            }
            if (size <= 0) {
                alert("Upload files can not be empty!");
                target.value = "";
                return false;
            }
            else {
                document.getElementById(box).value = filename;
                return true;
            }
        }
        function ValidateChar(s) {
            var valid = false;
            var pattern = new Array("~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")", ";", "\"", "'", "|", "\\", "<", ">", "?", "/", "<<", ">>", "+");
            for (var i = 0; i < pattern.length; i++) {
                if (s.indexOf(pattern[i]) >= 0) {
                    valid = true;
                    break;
                }
                else {
                    valid = false;
                }
            }
            if (valid) {
                return true;
            }
            else {
                return false;
            }
        }

        function searchData(id, btnbox, waitbox) {
            var flag = "valid";
            //    var pattern = new RegExp("[<>\"`~!@#$^&*()=|{}';'\\[\\]<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]") ;
            var frm = document.getElementById(id).getElementsByTagName("input");
            for (var i = 0; i < frm.length; i++) {
                if (frm[i].type == "text") {
                    if (frm[i].value == "" || frm[i].value == null) {
                        flag = "empty";
                        break;
                    }
                    else {
                        if (ValidateChar(frm[i].value)) {
                            flag = "invalid";
                            break;
                        }
                        else {
                            flag = "valid";
                        }
                    }
                }
            }
            if (flag == "invalid") {
                alert("The input contains invalid character,please input again!");
                return false;
            }
            else if (flag == "empty") {
                alert("The input cannot be empty!");
                return false;
            }
            else {
                document.getElementById(btnbox).style.backgroundColor = '#666666';
                document.getElementById(waitbox).style.display = 'block';
                return true;
            }
        }

        function checkFileExt(filename, box) {
            var flag = null; //状态
            var arr = ["zip","csv"];
            //取出上传文件的扩展名
            var index = filename.lastIndexOf(".");
            var ext = filename.substr(index + 1);
            //循环比较
            if (document.getElementById(box).value == "" || document.getElementById(box).value == null) {
                flag = "empty";
            }
            else {
                for (var i = 0; i < arr.length; i++) {
                    if (ext == arr[i]) {
                        flag = "valid"; //一旦找到合适的，立即退出循环
                        break;
                    }
                    else {
                        flag = "invalid";
                    }
                }
            }

            //条件判断
            if (flag == "valid") {
                return true;
            }
            else if (flag == "empty") {
                alert("The input cannot be empty!");
                document.getElementById(box).value = "";
                return false;
            }
            else {
                alert("The file uploaded should be in right format!");
                document.getElementById(box).value = "";
                return false;
            }
        }

        window.onload = function () {
            var obj1 = document.getElementById('choose_home');
            var obj2 = document.getElementById('choose_tool');
            var obj3 = document.getElementById('choose_meme');
            var obj4 = document.getElementById('choose_work');
            var obj5 = document.getElementById('choose_help');
            var msg = "If you leave this page, the operation will be stopped!";
            var x = document.getElementsByClassName("Upload_wait_div");
            var signal = "true";
            obj1.onclick = function () {
                for (var i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (confirm(msg)) {
                            signal = "true";
                        }
                        else {
                            signal = "false";
                            break;
                        }
                    }
                }
                if (signal == "true") {
                    window.location.href = "home_initial.jsp";
                }
                else {
                }
            }

            obj2.onclick = function () {
                for (var i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (confirm(msg)) {
                            signal = "true";
                        }
                        else {
                            signal = "false";
                            break;
                        }
                    }
                }
                if (signal == "true") {
                    window.location.href = "Tools_initial.jsp";
                }
                else {
                }
            }

            obj3.onclick = function () {
                for (var i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (confirm(msg)) {
                            signal = "true";
                        }
                        else {
                            signal = "false";
                            break;
                        }
                    }
                }
                if (signal == "true") {
                    window.location.href = "MEME.jsp";
                }
                else {
                }
            }

            obj4.onclick = function () {
                for (var i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (confirm(msg)) {
                            signal = "true";
                        }
                        else {
                            signal = "false";
                            break;
                        }
                    }
                }
                if (signal == "true") {
                    window.location.href = "WorkFlow.jsp";
                }
                else {
                }
            }

            obj5.onclick = function () {
                for (var i = 0; i < x.length; i++) {
                    if (x[i].style.display == 'block') {
                        if (confirm(msg)) {
                            signal = "true";
                        }
                        else {
                            signal = "false";
                            break;
                        }
                    }
                }
                if (signal == "true") {
                    window.location.href = "ContactUs.jsp";
                }
                else {
                }
            }
        }

        function side_right_show(divId, count) {
            for (var i = 1; i <= count; i++) {
                document.getElementById("side_right_" + i).style.display = "none";
                document.getElementById("side_son_" + i).style.backgroundColor = "#dadada";
                document.getElementById("side_son_" + i).style.color = "#555555";
            }
            document.getElementById("side_son_" + divId).style.backgroundColor = "#57779e";
            document.getElementById("side_son_" + divId).style.color = "#ffffff";
            document.getElementById("side_right_" + divId).style.display = "block";
        }
        function side_mapping(divId, arrowId) {
            var r = arrowId + 1;
            for (var i = 1; i <= 4; i++) {
                var j = 2 * i - 1;
                var jj = j + 1;
                document.getElementById("side_" + i).style.display = 'none';
                document.getElementById("arrow" + j).style.display = 'none';
                document.getElementById("arrow" + jj).style.display = 'block';
            }
            document.getElementById(divId).style.display = 'block';
            document.getElementById("arrow" + arrowId).style.display = 'block';
            document.getElementById("arrow" + r).style.display = 'none';
        }

        function nece_opt_show_PCA_ne(){
            if(document.getElementById("necessary_center_PCA").style.display=='block'){
                document.getElementById("necessary_center_PCA").style.display="none";
                document.getElementById("arrow-down7").style.display="none";
                document.getElementById("arrow-right7").style.display="block";
            }
            else{
                document.getElementById("necessary_center_PCA").style.display="block";
                document.getElementById("arrow-down7").style.display="block";
                document.getElementById("arrow-right7").style.display="none";
            }
        }
        function nece_opt_show_PCA_op(){
            if(document.getElementById("optional_center_PCA").style.display=='block'){
                document.getElementById("optional_center_PCA").style.display="none";
                document.getElementById("arrow-down8").style.display="none";
                document.getElementById("arrow-right8").style.display="block";
            }
            else{
                document.getElementById("optional_center_PCA").style.display="block";
                document.getElementById("arrow-down8").style.display="block";
                document.getElementById("arrow-right8").style.display="none";
            }
        }

        function nece_vis_show_PCA_op(){
            if (document.getElementById("vis_center_PCA").style.display == 'block') {
                document.getElementById("vis_center_PCA").style.display = "none";
                document.getElementById("arrow-down58").style.display = "none";
                document.getElementById("arrow-right58").style.display = "block";
            }
            else {
                document.getElementById("vis_center_PCA").style.display = "block";
                document.getElementById("arrow-down58").style.display = "block";
                document.getElementById("arrow-right58").style.display = "none";
            }
        }

        function nece_opt_show_BMIQ_ne() {
            if (document.getElementById("necessary_center_BMIQ").style.display == 'block') {
                document.getElementById("necessary_center_BMIQ").style.display = "none";
                document.getElementById("arrow-down3").style.display = "none";
                document.getElementById("arrow-right3").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_BMIQ").style.display = "block";
                document.getElementById("arrow-down3").style.display = "block";
                document.getElementById("arrow-right3").style.display = "none";
            }
        }
        function nece_opt_show_BMIQ_op() {
            if (document.getElementById("optional_center_BMIQ").style.display == 'block') {
                document.getElementById("optional_center_BMIQ").style.display = "none";
                document.getElementById("arrow-down4").style.display = "none";
                document.getElementById("arrow-right4").style.display = "block";
            }
            else {
                document.getElementById("optional_center_BMIQ").style.display = "block";
                document.getElementById("arrow-down4").style.display = "block";
                document.getElementById("arrow-right4").style.display = "none";
            }
        }
        function nece_opt_show_FN_op() {
            if (document.getElementById("optional_center_FN").style.display == 'block') {
                document.getElementById("optional_center_FN").style.display = "none";
                document.getElementById("arrow-down31").style.display = "none";
                document.getElementById("arrow-right31").style.display = "block";
            }
            else {
                document.getElementById("optional_center_FN").style.display = "block";
                document.getElementById("arrow-down31").style.display = "block";
                document.getElementById("arrow-right31").style.display = "none";
            }
        }
        function nece_opt_show_FN_ne() {
            if (document.getElementById("necessary_center_FN").style.display == 'block') {
                document.getElementById("necessary_center_FN").style.display = "none";
                document.getElementById("arrow-down30").style.display = "none";
                document.getElementById("arrow-right30").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_FN").style.display = "block";
                document.getElementById("arrow-down30").style.display = "block";
                document.getElementById("arrow-right30").style.display = "none";
            }
        }

        function nece_opt_show_PBC_ne() {
            if (document.getElementById("necessary_center_PBC").style.display == 'block') {
                document.getElementById("necessary_center_PBC").style.display = "none";
                document.getElementById("arrow-down14").style.display = "none";
                document.getElementById("arrow-right14").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_PBC").style.display = "block";
                document.getElementById("arrow-down14").style.display = "block";
                document.getElementById("arrow-right14").style.display = "none";
            }
        }
        function nece_opt_show_PBC_op() {
            if (document.getElementById("optional_center_PBC").style.display == 'block') {
                document.getElementById("optional_center_PBC").style.display = "none";
                document.getElementById("arrow-down15").style.display = "none";
                document.getElementById("arrow-right15").style.display = "block";
            }
            else {
                document.getElementById("optional_center_PBC").style.display = "block";
                document.getElementById("arrow-down15").style.display = "block";
                document.getElementById("arrow-right15").style.display = "none";
            }
        }
        function nece_vis_show_BMIQ_op(){
            if (document.getElementById("vis_center_BMIQ").style.display == 'block') {
                document.getElementById("vis_center_BMIQ").style.display = "none";
                document.getElementById("arrow-down48").style.display = "none";
                document.getElementById("arrow-right48").style.display = "block";
            }
            else {
                document.getElementById("vis_center_BMIQ").style.display = "block";
                document.getElementById("arrow-down48").style.display = "block";
                document.getElementById("arrow-right48").style.display = "none";
            }
        }
        function nece_vis_show_PBC_op(){
            if (document.getElementById("vis_center_PBC").style.display == 'block') {
                document.getElementById("vis_center_PBC").style.display = "none";
                document.getElementById("arrow-down49").style.display = "none";
                document.getElementById("arrow-right49").style.display = "block";
            }
            else {
                document.getElementById("vis_center_PBC").style.display = "block";
                document.getElementById("arrow-down49").style.display = "block";
                document.getElementById("arrow-right49").style.display = "none";
            }
        }

        function nece_vis_show_SWAN_op(){
            if (document.getElementById("vis_center_SWAN").style.display == 'block') {
                document.getElementById("vis_center_SWAN").style.display = "none";
                document.getElementById("arrow-down50").style.display = "none";
                document.getElementById("arrow-right50").style.display = "block";
            }
            else {
                document.getElementById("vis_center_SWAN").style.display = "block";
                document.getElementById("arrow-down50").style.display = "block";
                document.getElementById("arrow-right50").style.display = "none";
            }
        }

        function nece_vis_show_FN_op(){
            if (document.getElementById("vis_center_FN").style.display == 'block') {
                document.getElementById("vis_center_FN").style.display = "none";
                document.getElementById("arrow-down51").style.display = "none";
                document.getElementById("arrow-right51").style.display = "block";
            }
            else {
                document.getElementById("vis_center_FN").style.display = "block";
                document.getElementById("arrow-down51").style.display = "block";
                document.getElementById("arrow-right51").style.display = "none";
            }
        }

        function nece_vis_show_ILL_op(){
            if (document.getElementById("vis_center_ILL").style.display == 'block') {
                document.getElementById("vis_center_ILL").style.display = "none";
                document.getElementById("arrow-down52").style.display = "none";
                document.getElementById("arrow-right52").style.display = "block";
            }
            else {
                document.getElementById("vis_center_ILL").style.display = "block";
                document.getElementById("arrow-down52").style.display = "block";
                document.getElementById("arrow-right52").style.display = "none";
            }
        }

        function nece_vis_show_Noob_op(){
            if (document.getElementById("vis_center_Noob").style.display == 'block') {
                document.getElementById("vis_center_Noob").style.display = "none";
                document.getElementById("arrow-down53").style.display = "none";
                document.getElementById("arrow-right53").style.display = "block";
            }
            else {
                document.getElementById("vis_center_Noob").style.display = "block";
                document.getElementById("arrow-down53").style.display = "block";
                document.getElementById("arrow-right53").style.display = "none";
            }
        }

        function nece_vis_show_SQN_op(){
            if (document.getElementById("vis_center_SQN").style.display == 'block') {
                document.getElementById("vis_center_SQN").style.display = "none";
                document.getElementById("arrow-down54").style.display = "none";
                document.getElementById("arrow-right54").style.display = "block";
            }
            else {
                document.getElementById("vis_center_SQN").style.display = "block";
                document.getElementById("arrow-down54").style.display = "block";
                document.getElementById("arrow-right54").style.display = "none";
            }
        }

        function nece_vis_show_Dasen_op(){
            if (document.getElementById("vis_center_Dasen").style.display == 'block') {
                document.getElementById("vis_center_Dasen").style.display = "none";
                document.getElementById("arrow-down55").style.display = "none";
                document.getElementById("arrow-right55").style.display = "block";
            }
            else {
                document.getElementById("vis_center_Dasen").style.display = "block";
                document.getElementById("arrow-down55").style.display = "block";
                document.getElementById("arrow-right55").style.display = "none";
            }
        }

        function nece_vis_show_Raw_op(){
            if (document.getElementById("vis_center_RAW").style.display == 'block') {
                document.getElementById("vis_center_RAW").style.display = "none";
                document.getElementById("arrow-down56").style.display = "none";
                document.getElementById("arrow-right56").style.display = "block";
            }
            else {
                document.getElementById("vis_center_RAW").style.display = "block";
                document.getElementById("arrow-down56").style.display = "block";
                document.getElementById("arrow-right56").style.display = "none";
            }
        }

        function nece_vis_show_limma_op(){
            if (document.getElementById("vis_center_limma").style.display == 'block') {
                document.getElementById("vis_center_limma").style.display = "none";
                document.getElementById("arrow-down57").style.display = "none";
                document.getElementById("arrow-right57").style.display = "block";
            }
            else {
                document.getElementById("vis_center_limma").style.display = "block";
                document.getElementById("arrow-down57").style.display = "block";
                document.getElementById("arrow-right57").style.display = "none";
            }
        }
        function nece_vis_show_dmpFinder_op(){
            if (document.getElementById("vis_center_dmpFinder").style.display == 'block') {
                document.getElementById("vis_center_dmpFinder").style.display = "none";
                document.getElementById("arrow-down70").style.display = "none";
                document.getElementById("arrow-right70").style.display = "block";
            }
            else {
                document.getElementById("vis_center_dmpFinder").style.display = "block";
                document.getElementById("arrow-down70").style.display = "block";
                document.getElementById("arrow-right70").style.display = "none";
            }
        }
        function nece_vis_show_samr_op(){
            if (document.getElementById("vis_center_samr").style.display == 'block') {
                document.getElementById("vis_center_samr").style.display = "none";
                document.getElementById("arrow-down71").style.display = "none";
                document.getElementById("arrow-right71").style.display = "block";
            }
            else {
                document.getElementById("vis_center_samr").style.display = "block";
                document.getElementById("arrow-down71").style.display = "block";
                document.getElementById("arrow-right71").style.display = "none";
            }
        }
        function nece_vis_show_sva_op(){
            if (document.getElementById("vis_center_sva").style.display == 'block') {
                document.getElementById("vis_center_sva").style.display = "none";
                document.getElementById("arrow-down72").style.display = "none";
                document.getElementById("arrow-right72").style.display = "block";
            }
            else {
                document.getElementById("vis_center_sva").style.display = "block";
                document.getElementById("arrow-down72").style.display = "block";
                document.getElementById("arrow-right72").style.display = "none";
            }
        }


        function nece_opt_show_ill_ne() {
            if (document.getElementById("necessary_center_ill").style.display == 'block') {
                document.getElementById("necessary_center_ill").style.display = "none";
                document.getElementById("arrow-down32").style.display = "none";
                document.getElementById("arrow-right32").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_ill").style.display = "block";
                document.getElementById("arrow-down32").style.display = "block";
                document.getElementById("arrow-right32").style.display = "none";
            }
        }
        function nece_opt_show_ill_op() {
            if (document.getElementById("optional_center_ill").style.display == 'block') {
                document.getElementById("optional_center_ill").style.display = "none";
                document.getElementById("arrow-down33").style.display = "none";
                document.getElementById("arrow-right33").style.display = "block";
            }
            else {
                document.getElementById("optional_center_ill").style.display = "block";
                document.getElementById("arrow-down33").style.display = "block";
                document.getElementById("arrow-right33").style.display = "none";
            }
        }
        function nece_opt_show_Noob_ne() {
            if (document.getElementById("necessary_center_Noob").style.display == 'block') {
                document.getElementById("necessary_center_Noob").style.display = "none";
                document.getElementById("arrow-down34").style.display = "none";
                document.getElementById("arrow-right34").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_Noob").style.display = "block";
                document.getElementById("arrow-down34").style.display = "block";
                document.getElementById("arrow-right34").style.display = "none";
            }
        }
        function nece_opt_show_Noob_op() {
            if (document.getElementById("optional_center_Noob").style.display == 'block') {
                document.getElementById("optional_center_Noob").style.display = "none";
                document.getElementById("arrow-down35").style.display = "none";
                document.getElementById("arrow-right35").style.display = "block";
            }
            else {
                document.getElementById("optional_center_Noob").style.display = "block";
                document.getElementById("arrow-down35").style.display = "block";
                document.getElementById("arrow-right35").style.display = "none";
            }
        }
        function nece_opt_show_SQN_ne() {
            if (document.getElementById("necessary_center_SQN").style.display == 'block') {
                document.getElementById("necessary_center_SQN").style.display = "none";
                document.getElementById("arrow-down36").style.display = "none";
                document.getElementById("arrow-right36").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_SQN").style.display = "block";
                document.getElementById("arrow-down36").style.display = "block";
                document.getElementById("arrow-right36").style.display = "none";
            }
        }
        function nece_opt_show_SQN_op() {
            if (document.getElementById("optional_center_SQN").style.display == 'block') {
                document.getElementById("optional_center_SQN").style.display = "none";
                document.getElementById("arrow-down37").style.display = "none";
                document.getElementById("arrow-right37").style.display = "block";
            }
            else {
                document.getElementById("optional_center_SQN").style.display = "block";
                document.getElementById("arrow-down37").style.display = "block";
                document.getElementById("arrow-right37").style.display = "none";
            }
        }
        function limma_option_ne() {
            if (document.getElementById("necessary_center_limma").style.display == 'block') {
                document.getElementById("necessary_center_limma").style.display = "none";
                document.getElementById("arrow-down44").style.display = "none";
                document.getElementById("arrow-right44").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_limma").style.display = "block";
                document.getElementById("arrow-down44").style.display = "block";
                document.getElementById("arrow-right44").style.display = "none";
            }
        }
        function limma_option_op() {
            if (document.getElementById("optional_center_limma").style.display == 'block') {
                document.getElementById("optional_center_limma").style.display = "none";
                document.getElementById("arrow-down45").style.display = "none";
                document.getElementById("arrow-right45").style.display = "block";
            }
            else {
                document.getElementById("optional_center_limma").style.display = "block";
                document.getElementById("arrow-down45").style.display = "block";
                document.getElementById("arrow-right45").style.display = "none";
            }
        }
        function dmrcate_option_ne() {
            if (document.getElementById("necessary_center_dmrcate").style.display == 'block') {
                document.getElementById("necessary_center_dmrcate").style.display = "none";
                document.getElementById("arrow-down8").style.display = "none";
                document.getElementById("arrow-right8").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_dmrcate").style.display = "block";
                document.getElementById("arrow-down8").style.display = "block";
                document.getElementById("arrow-right8").style.display = "none";
            }
        }
        function dmrcate_option_op() {
            if (document.getElementById("optional_center_dmrcate").style.display == 'block') {
                document.getElementById("optional_center_dmrcate").style.display = "none";
                document.getElementById("arrow-down9").style.display = "none";
                document.getElementById("arrow-right9").style.display = "block";
            }
            else {
                document.getElementById("optional_center_dmrcate").style.display = "block";
                document.getElementById("arrow-down9").style.display = "block";
                document.getElementById("arrow-right9").style.display = "none";
            }
        }
        function bumphunter_option_ne() {
            if (document.getElementById("necessary_center_bumphunter").style.display == 'block') {
                document.getElementById("necessary_center_bumphunter").style.display = "none";
                document.getElementById("arrow-down12").style.display = "none";
                document.getElementById("arrow-right12").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_bumphunter").style.display = "block";
                document.getElementById("arrow-down12").style.display = "block";
                document.getElementById("arrow-right12").style.display = "none";
            }
        }

        function bumphunter_option_op() {
            if (document.getElementById("optional_center_bumphunter").style.display == 'block') {
                document.getElementById("optional_center_bumphunter").style.display = "none";
                document.getElementById("arrow-down13").style.display = "none";
                document.getElementById("arrow-right13").style.display = "block";
            }
            else {
                document.getElementById("optional_center_bumphunter").style.display = "block";
                document.getElementById("arrow-down13").style.display = "block";
                document.getElementById("arrow-right13").style.display = "none";
            }
        }
        function nece_opt_show_ne() {
            if (document.getElementById("necessary_center_SWAN").style.display == 'block') {
                document.getElementById("necessary_center_SWAN").style.display = "none";
                document.getElementById("arrow-down1").style.display = "none";
                document.getElementById("arrow-right1").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_SWAN").style.display = "block";
                document.getElementById("arrow-down1").style.display = "block";
                document.getElementById("arrow-right1").style.display = "none";
            }
        }
        function nece_opt_show_op() {
            if (document.getElementById("optioanl_center_SWAN").style.display == 'block') {
                document.getElementById("optioanl_center_SWAN").style.display = "none";
                document.getElementById("arrow-down2").style.display = "none";
                document.getElementById("arrow-right2").style.display = "block";
            }
            else {
                document.getElementById("optioanl_center_SWAN").style.display = "block";
                document.getElementById("arrow-down2").style.display = "block";
                document.getElementById("arrow-right2").style.display = "none";
            }
        }

        function probeLasso_option_ne() {
            if (document.getElementById("necessary_center_probeLasso").style.display == 'block') {
                document.getElementById("necessary_center_probeLasso").style.display = "none";
                document.getElementById("arrow-down16").style.display = "none";
                document.getElementById("arrow-right16").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_probeLasso").style.display = "block";
                document.getElementById("arrow-down16").style.display = "block";
                document.getElementById("arrow-right16").style.display = "none";
            }
        }
        function probeLasso_option_op() {
            if (document.getElementById("optional_center_probeLasso").style.display == 'block') {
                document.getElementById("optional_center_probeLasso").style.display = "none";
                document.getElementById("arrow-down17").style.display = "none";
                document.getElementById("arrow-right17").style.display = "block";
            }
            else {
                document.getElementById("optional_center_probeLasso").style.display = "block";
                document.getElementById("arrow-down17").style.display = "block";
                document.getElementById("arrow-right17").style.display = "none";
            }
        }
        function seqlm_option_ne() {
            if (document.getElementById("necessary_center_seqlm").style.display == 'block') {
                document.getElementById("necessary_center_seqlm").style.display = "none";
                document.getElementById("arrow-down18").style.display = "none";
                document.getElementById("arrow-right18").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_seqlm").style.display = "block";
                document.getElementById("arrow-down18").style.display = "block";
                document.getElementById("arrow-right18").style.display = "none";
            }
        }
        function seqlm_option_op() {
            if (document.getElementById("optional_center_seqlm").style.display == 'block') {
                document.getElementById("optional_center_seqlm").style.display = "none";
                document.getElementById("arrow-down19").style.display = "block";
                document.getElementById("arrow-right19").style.display = "none";
            }
            else {
                document.getElementById("optional_center_seqlm").style.display = "block";
                document.getElementById("arrow-down19").style.display = "none";
                document.getElementById("arrow-right19").style.display = "block";
            }
        }
        function raw_option_ne() {
            if (document.getElementById("necessary_center_raw").style.display == 'block') {
                document.getElementById("necessary_center_raw").style.display = "none";
                document.getElementById("arrow-down10").style.display = "none";
                document.getElementById("arrow-right10").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_raw").style.display = "block";
                document.getElementById("arrow-down10").style.display = "block";
                document.getElementById("arrow-right10").style.display = "none";
            }
        }

        function dasen_option_ne() {
            if (document.getElementById("necessary_center_dasen").style.display == 'block') {
                document.getElementById("necessary_center_dasen").style.display = "none";
                document.getElementById("arrow-down20").style.display = "none";
                document.getElementById("arrow-right20").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_dasen").style.display = "block";
                document.getElementById("arrow-down20").style.display = "block";
                document.getElementById("arrow-right20").style.display = "none";
            }
        }

        function dmpFinder_option_ne() {
            if (document.getElementById("necessary_center_dmpFinder").style.display == 'block') {
                document.getElementById("necessary_center_dmpFinder").style.display = "none";
                document.getElementById("arrow-down60").style.display = "none";
                document.getElementById("arrow-right60").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_dmpFinder").style.display = "block";
                document.getElementById("arrow-down60").style.display = "block";
                document.getElementById("arrow-right60").style.display = "none";
            }
        }
        function dmpFinder_option_op() {
            if (document.getElementById("optional_center_dmpFinder").style.display == 'block') {
                document.getElementById("optional_center_dmpFinder").style.display = "none";
                document.getElementById("arrow-down61").style.display = "block";
                document.getElementById("arrow-right61").style.display = "none";
            }
            else {
                document.getElementById("optional_center_dmpFinder").style.display = "block";
                document.getElementById("arrow-down61").style.display = "none";
                document.getElementById("arrow-right61").style.display = "block";
            }
        }

        function samr_option_ne() {
            if (document.getElementById("necessary_center_samr").style.display == 'block') {
                document.getElementById("necessary_center_samr").style.display = "none";
                document.getElementById("arrow-down62").style.display = "none";
                document.getElementById("arrow-right62").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_samr").style.display = "block";
                document.getElementById("arrow-down62").style.display = "block";
                document.getElementById("arrow-right62").style.display = "none";
            }
        }
        function samr_option_op() {
            if (document.getElementById("optional_center_samr").style.display == 'block') {
                document.getElementById("optional_center_samr").style.display = "none";
                document.getElementById("arrow-down63").style.display = "block";
                document.getElementById("arrow-right63").style.display = "none";
            }
            else {
                document.getElementById("optional_center_samr").style.display = "block";
                document.getElementById("arrow-down63").style.display = "none";
                document.getElementById("arrow-right63").style.display = "block";
            }
        }
        function sva_option_ne() {
            if (document.getElementById("necessary_center_sva").style.display == 'block') {
                document.getElementById("necessary_center_sva").style.display = "none";
                document.getElementById("arrow-down65").style.display = "none";
                document.getElementById("arrow-right65").style.display = "block";
            }
            else {
                document.getElementById("necessary_center_sva").style.display = "block";
                document.getElementById("arrow-down65").style.display = "block";
                document.getElementById("arrow-right65").style.display = "none";
            }
        }
        function sva_option_op() {
            if (document.getElementById("optional_center_sva").style.display == 'block') {
                document.getElementById("optional_center_sva").style.display = "none";
                document.getElementById("arrow-down64").style.display = "block";
                document.getElementById("arrow-right64").style.display = "none";
            }
            else {
                document.getElementById("optional_center_sva").style.display = "block";
                document.getElementById("arrow-down64").style.display = "none";
                document.getElementById("arrow-right64").style.display = "block";
            }
        }


        function optional_radio_input(s, u, trim5, trim3) {
            var div = document.getElementById("optional_radio_input");
            div.innerHTML = "(-s " + s + " -u " + u + " -5 " + trim5 + " -3 " + trim3 + ")";
            div.style.visibility = "visible";
        }
        function SOAP_radio(SOAP_M, SOAP_l, SOAP_n, SOAP_r, SOAP_m, SOAP_x, SOAP_v, SOAP_s, SOAP_g, SOAP_e, SOAP_p) {
            var div = document.getElementById("SOAP_radio");
            div.innerHTML = "(-M " + SOAP_M + " -l " + SOAP_l + " -n " + SOAP_n + " -r " + SOAP_r + " -m " + SOAP_m + " -x " + SOAP_x + " -v " + SOAP_v + " -s " + SOAP_s + " -g " + SOAP_g + " -e " + SOAP_e + " -p " + SOAP_p + ")";
            div.style.visibility = "visible";
        }
        function Subread_index_radio(Subread_B, Subread_f, Subread_F, Subread_M) {
            var div = document.getElementById("Subread_index_radio");
            div.innerHTML = "(-B " + Subread_B + " -f " + Subread_f + " -F " + Subread_F + " -M " + Subread_M + ")";
            div.style.visibility = "visible";
        }
        function Subread_align_radio(Subread_B2, Subread_d, Subread_D, Subread_I, Subread_m, Subread_M, Subread_n, Subread_p, Subread_P, Subread_S, Subread_T, Subread_trim5, Subread_trim3) {
            var div = document.getElementById("Subread_align_radio");
            div.innerHTML = "(-B " + Subread_B2 + " -d " + Subread_d + " -D " + Subread_D + " -I " + Subread_I + " -m " + Subread_m + " -M " + Subread_M + " -n " + Subread_n + " -p " + Subread_p + " -P " + Subread_P + " -S " + Subread_S + " -T " + Subread_T + " --trim5 " + Subread_trim5 + " --trim3 " + Subread_trim3 + ")";
            div.style.visibility = "visible";
        }
        function alignment_radio(alignment_N, alignment_L, alignment_i, alignment_n, alignment_dpad, alignment_gbar) {
            var div = document.getElementById("alignment_radio");
            div.innerHTML = "(-N " + alignment_N + " -L " + alignment_L + " -i " + alignment_i + " ---n-ceil " + alignment_n + " --dpad " + alignment_dpad + " --gbar " + alignment_gbar + ")";
            div.style.visibility = "visible";
        }
        function score_radio(score_ma, score_mp, score_np, score_rdg5, score_rdg3, score_rfg5, score_rfg3) {
            var div = document.getElementById("score_radio");
            div.innerHTML = "(--ma " + score_ma + " --mp " + score_mp + " --np " + score_np + " --rdg " + score_rdg5 + " " + score_rdg3 + " " + " --rfg " + score_rfg5 + " " + score_rfg3 + ")";
            div.style.visibility = "visible";
        }
        function ak_radio(ak_k) {
            var div = document.getElementById("ak_radio");
            div.innerHTML = "(-k " + ak_k + ")";
            div.style.visibility = "visible";
        }
        function analysisMode_radio(analysisMode_n, analysisMode_o, analysisMode_e, analysisMode_i, analysisMode_d, analysisMode_l, analysisMode_k, analysisMode_m, analysisMode_M, analysisMode_O, analysisMode_E, analysisMode_R, analysisMode_q, analysisMode_B, analysisMode_L) {
            var div = document.getElementById("analysisMode_radio");
            div.innerHTML = "(-n " + analysisMode_n + " -o " + analysisMode_o + " -e " + analysisMode_e + " -i " + analysisMode_i + " -d " + analysisMode_d + " -l " + analysisMode_l + " -k " + analysisMode_k + " -m " + analysisMode_m + " -M " + analysisMode_M + " -O " + analysisMode_O + " -E " + analysisMode_E + " -R " + analysisMode_R + " -q " + analysisMode_q + " -B " + analysisMode_B + " -L " + analysisMode_L + ")";
            div.style.visibility = "visible";
        }
        function advancedPair_radio(advancedPair_a, advancedPair_o, advancedPair_n, advancedPair_N, advancedPair_c) {
            var div = document.getElementById("advancedPair_radio");
            div.innerHTML = "(-a " + advancedPair_a + " -o " + advancedPair_o + " -n " + advancedPair_n + " -N " + advancedPair_N + " -c " + advancedPair_c + ")";
            div.style.visibility = "visible";
        }
        function macs_radio(macs_g, macs_s, macs_bw, macs_p) {
            var div = document.getElementById("macs_radio");
            div.innerHTML = "(-g " + macs_g + " -s " + macs_s + " -bw " + macs_bw + " -p " + macs_p + ")";
            div.style.visibility = "visible";
        }
        function bumphunter_radio(arraytype, minProbes, adjPvalDmr, cutoff, pickCutoff) {
            var div = document.getElementById("bumphunter_radio");
            div.innerHTML = "(arraytype=" + arraytype + ",minProbes=" + minProbes + ",adjPvalDmr=" + adjPvalDmr + ",cutoff=" + cutoff +  ")";
            div.style.visibility = "visible";
        }
        function sicer_radio(sicer_sp, sicer_RT, sicer_ws, sicer_fs, sicer_egf, sicer_gs, sicer_fdr) {
            var div = document.getElementById("sicer_radio");
            div.innerHTML = "(" + sicer_sp + " " + sicer_RT + " " + sicer_ws + " " + sicer_fs + " " + sicer_egf + " " + sicer_gs + " " + sicer_fdr + ")";
            div.style.visibility = "visible";
        }
        function pepr_radio(pepr_peaktype, pepr_p, pepr_keep, pepr_num) {
            var div = document.getElementById("pepr_radio");
            div.innerHTML = "(--peaktype " + pepr_peaktype + " --threshold " + pepr_p + " --keep-max-dup " + pepr_keep + " --num-processors " + pepr_num + ")";
            div.style.visibility = "visible";
        }
        function BCP_radio_HM(BCP_f, BCP_W, BCP_p) {
            var div = document.getElementById("BCP_radio");
            div.innerHTML = "(-f " + BCP_f + " -w " + BCP_W + " -p " + BCP_p + ")";
            div.style.visibility = "visible";
        }
        function BCP_radio_TF(BCP_e, BCP_p2) {
            var div = document.getElementById("BCP_radio");
            div.innerHTML = "(-e " + BCP_e + " -p " + BCP_p2 + ")";
            div.style.visibility = "visible";
        }
        function diff_radio(diff_mode, diff_w, diff_step, diff_gap, diff_nsd, diff_alpha, diff_bkg) {
            var div = document.getElementById("diff_radio");
            div.innerHTML = "(--mode " + diff_mode + " --window " + diff_w + " --step " + diff_step + " --gap " + diff_gap + " --nsd " + diff_nsd + " --alpha " + diff_alpha + " --bkg " + diff_bkg + ")";
            div.style.visibility = "visible";
        }
        function SISSR_radio(SISSR_D, SISSR_e, SISSR_p, SISSR_m, SISSR_w, SISSR_E, SISSR_L) {
            var div = document.getElementById("SISSR_radio");
            div.innerHTML = "(-D " + SISSR_D + " -e " + SISSR_e + " -p " + SISSR_p + " -m " + SISSR_m + " -w " + SISSR_w + " -E " + SISSR_E + " -L " + SISSR_L + ")";
            div.style.visibility = "visible";
        }
        function BroadPeak_radio(BroadPeak_b, BroadPeak_g) {
            var div = document.getElementById("BroadPeak_radio");
            div.innerHTML = "(-b " + BroadPeak_b + " -g " + BroadPeak_g + ")";
            div.style.visibility = "visible";
        }
        function Fseq_radio(Fseq_l, Fseq_s, Fseq_t, Fseq_v) {
            var div = document.getElementById("Fseq_radio");
            var v;
            if (Fseq_v == 1) {
                v = " -v ";
            }
            else {
                v = "";
            }
            div.innerHTML = "(-l " + Fseq_l + " -s " + Fseq_s + " -t " + Fseq_t + v + ")";
            div.style.visibility = "visible";
        }
        function findpeak_radio(findpeak_dir, findpeak_type, findpeak_filter, findpeak_hs) {
            var div = document.getElementById("findpeak_radio");
            var dir, filter;
            if (findpeak_dir == 1) {
                dir = "-directional";
            }
            else {
                dir = "";
            }
            if (findpeak_filter == 1) {
                filter = "-filter";
            }
            else {
                filter = "";
            }
            div.innerHTML = "(" + dir + " -dist_type " + findpeak_type + filter + " -hist_size " + findpeak_hs + ")";
            div.style.visibility = "visible";
        }
        function bowtie_index_radio(bowtie_nodc, bowtie_justref, bowtie_offrate, bowtie_t, bowtie_ns) {
            var div = document.getElementById("bowtie_index_radio");
            var nodc, justref, ntoa;
            if (bowtie_nodc == 1) {
                nodc = "";
            }
            else {
                nodc = "--nodc"
            }
            if (bowtie_justref == 1) {
                justref = "";
            }
            else {
                justref = "--justref";
            }
            if (bowtie_ns == 1) {
                ntoa = "";
            }
            else {
                ntoa = "--ntoa";
            }
            div.innerHTML = "(" + nodc + " " + justref + " " + ntoa + " --offrate " + bowtie_offrate + " -t " + bowtie_t + ")";
            div.style.visibility = "visible";
        }
        function bowtie_mode_n_radio(bowtie_mode_n, bowtie_mode_l, bowtie_mode_e, bowtie_mode_max) {
            var div = document.getElementById("bowtie_mode_n_radio");
            div.innerHTML = "(-n " + bowtie_mode_n + " -l " + bowtie_mode_l + " -e " + bowtie_mode_e + " --maxbts " + bowtie_mode_max + ")";
            div.style.visibility = "visible";
        }
        function bowtie_mode_v_radio(bowtie_mode_v) {
            var div = document.getElementById("bowtie_mode_v_radio");
            div.innerHTML = "(-v " + bowtie_mode_v + ")";
            div.style.visibility = "visible";
        }
        function bowtie_input_radio(bowtie_s, bowtie_u, bowtie_5, bowtie_3) {
            var div = document.getElementById("bowtie_input_radio");
            div.innerHTML = "(-s " + bowtie_s + " -u " + bowtie_u + " -5 " + bowtie_5 + " -3 " + bowtie_3 + ")";
            div.style.visibility = "visible";
        }
        function bowtie_alignment_radio(bowtie_nomaqround, bowtie_I, bowtie_X) {
            var div = document.getElementById("bowtie_alignment_radio");
            var noma;
            if (bowtie_nomaqround == 1) {
                noma = "";
            }
            else {
                noma = "--nomaqround";
            }

            div.innerHTML = "(--nomaqround " + bowtie_nomaqround + " -I " + bowtie_I + " -X " + bowtie_X + ")";
            div.style.visibility = "visible";
        }
        function bowtie_report_radio(bowtie_k, bowtie_a) {
            var div = document.getElementById("bowtie_report_radio");
            var a;
            if (bowtie_a == 1) {
                a = "";
            }
            else {
                a = "-a";
            }
            div.innerHTML = "(-k " + bowtie_k + " " + a + ")";
            div.style.visibility = "visible";
        }
        function peakseq_radio(peakseq_length, peakseq_fdr, peakseq_N, peakseq_Min, peakseq_mode, peakseq_qvalue) {
            var div = document.getElementById("peakseq_radio");
            var mode;
            if (peakseq_mode == 1) {
                mode = "Poisson";
            }
            else {
                mode = "Simulated";
            }
            div.innerHTML = "(length " + peakseq_length + " FDR " + peakseq_fdr + " N_Simulations " + peakseq_N + " distance " + peakseq_Min + " mode " + mode + " Qvalue " + peakseq_qvalue + ")";
            div.style.visibility = "visible";
        }

        function restore() {
            document.body.removeChild(document.getElementById("overlay"));
            document.body.removeChild(document.getElementById("img"));
        }

        function recentShow() {
            window.location.href = "RecentJob.jsp";
        }

        function turnoff(obj) {
            document.getElementById(obj).style.display = "none";
        }

        //        var count = 1;
        //        function Tip_click(TipId) {
        //            var id = "#tip" + TipId;
        //            if (TipId == 1) {
        //                if (TipId == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //
        //            else if (TipId == 2) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //
        //            }
        //            else if (TipId == 3) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv.', id, {
        //                        tips: [1, '#57779e'], time: 10000
        //                    });
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 4) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 5) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 6) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 7) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 8) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 9) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else if (TipId == 10) {
        //                if (count == 1) {
        //                    layer.tips('Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv', id, {tips: [1, '#57779e'], time: 10000});
        //
        //                    count++;
        //                }
        //                else {
        //                    layer.close(layer.index);
        //                    count--;
        //                }
        //            }
        //            else {
        //            }
        //        }
    </script>
    <style type="text/css">

        body {
            font-family: Arial;
        }
        #back {
            width: 100%;
            height:auto;
            background-color: #ebeaea;
        }

        #banner {
            height: 200px;
            background: url("./img/back3new.png") no-repeat;
            background-size: cover;
            background-position: center;
        }

        #logo_span{
            width:268px;
            height:109px;
            float:left;
            margin-left:6%;
            margin-top:23px;
            background-image: url("./img/logonew1.png");
        }

        #list_choose {
            height: 35px;
            margin-right: 10%;
            padding-top: 55px;
            line-height: 35px;
            font-size: 20px;
        }

        #choose_home {
            color: #ffffff;
            background: none;
            width: 70px;
            padding-left: 12px;
            height: 35px;
            float: right;
            font-weight: 300;
        }

        #choose_home:hover {
            color: #57779e;
            border-left: none;
            border-right: none;
            border-top: none;
            border-radius: 5px;
            font-weight: 500;
        }

        #choose_help {
            color: #ffffff;
            background: none;
            padding-left: 10px;
            width: 120px;
            height: 35px;
            float: right;
            font-weight: 200;
        }

        #choose_help:hover {
            color: #57779e;
            border-left: none;
            border-right: none;
            border-top: none;
            font-weight: 300;
        }

        #choose_work {
            color: #ffffff;
            background: none;
            padding-left: 10px;
            width: 120px;
            height: 35px;
            float: right;
            font-weight: 200;
        }

        #choose_work:hover {
            color: #57779e;
            border-left: none;
            border-right: none;
            border-top: none;
            font-weight: 300;
        }

        #choose_tool {
            color: #57779e;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.9);
            text-shadow: 1px 2px 3px #bdbcbb;
            padding-left: 10px;
            width: 60px;
            height: 35px;
            float: right;
            font-weight: 300;
        }

        #choose_meme {
            color: #ffffff;
            background: none;
            padding-left: 10px;
            width: 200px;
            height: 35px;
            float: right;
            font-weight: 200;
        }

        #choose_meme:hover {
            color: #57779e;
            border-left: none;
            border-right: none;
            border-top: none;
            font-weight: 300;
        }

        #side_center {
            width: 95%;
            margin: 0 auto;
        }

        #left_side {
            width: 25%;
            height: 80%;
            float: left;
        }

        .side_radio {
            margin-top: 63px;
            margin-left: 10%;
            float: left;
            border-radius: 50%;
            width: 14px;
            height: 14px;
            background-color: #57779e;
            border:3px solid #76809E;
        }

        .side_top {
            margin-top: 50px;
            margin-left: 10%;
            height: 40px;
            line-height: 52px;
            padding-left: 50px;
            color: #000000;
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 2px solid #57779e;
        }

        h5 {
            font-size: 25px;
            font-weight: 400;
            margin-left: -15px;
        }

        .arrow1 {
            float: left;
            margin-left: 15%;
            margin-right:5px;
            margin-top: 10px;
            width: 18px;
            height: 18px;
            background-image: url("./img/arrow-down.png");
        }

        .arrow2 {
            float: left;
            margin-right:5px;
            margin-left: 15%;
            margin-top: 10px;
            width: 18px;
            height: 18px;
            background-image: url("./img/arrow-right.png");
        }

        .side_parent {
            margin-left: 8px;
            height: 40px;
            line-height: 40px;
            color: #57779e;
            font-weight: bold;
        }

        .side_son {
            margin-left: 18%;
            padding-left: 10px;
            height: 40px;
            line-height: 40px;
            color: #555555;
            background-color: #e1dfdf;
        }

        .side_son:hover {
            margin-left: 20%;
            height: 40px;
            line-height: 40px;
            color: #555555;
            background-color: #bfbfbf;
            border-top: none;
            border-bottom: none;
            border-right: none;
            border-left: 2px solid #57779e;
        }

        #side_right {
            margin-top: -20px;
            margin-left: 25%;
            width: 70%;
            height: 1000px;
            position: relative;
            overflow-y: scroll;
            background-color: #ffffff;
            z-index: 900;
            box-shadow: 10px 5px 20px #999999;
            -moz-box-shadow: 10px 5px 20px #999999;
            -webkit-box-shadow: 10px 5px 20px #999999;
        }

        .arrow-down {
            width: 0;
            height: 0;
            float: left;
            border-left: 6px solid transparent;
            border-right: 6px solid transparent;
            border-top: 6px solid #666666;
            margin-top: 5px;
            margin-right: 2px;
        }

        .arrow-right {
            width: 0;
            height: 0;
            float: left;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-left: 6px solid #666666;
            margin-top: 3px;
            margin-right: 2px;
        }

        .link {
            width: 100%;
            margin-left: -10px;
            font-size: 17px;
            font-weight: bold;
            color: #666666;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .side_right {
            width: 90%;
            height: auto;
            padding-top: 20px;
            padding-left: 40px;
            color: #ffffff;
        }

        .necessary_center, .optional_center {
            width: 100%;
            height: auto;
            border: 1px solid #666666;
        }

        #optional_center_bowtie {
            width: 100%;
            height: 150px;
            border: 1px solid #666666;
        }

        .blacktop_1, #blacktop_20 {
            width: 95%;
            height: 25px;
            line-height: 25px;
            background-color: #999999;
            padding-left: 8px;
            color: #ffffff;
            margin: 0 auto;
            margin-top: 10px;
        }

        .blackdown_1 {
            width: 95%;
            height: 40px;
            line-height: 40px;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        #blackdown_20 {
            width: 95%;
            height: 35px;
            line-height: 35px;
            background-color: #dadada;
            padding-left: 8px;
            color: #333333;
            margin: 0 auto;
        }

        #blackdown_2_bowtie {
            width: 95%;
            height: 95px;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        .blackdown_2_bowtie2 {
            width: 95%;
            height: 60px;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        .blackdown_2_bwa {
            width: 95%;
            height: 120px;
            background-color: #dadada;
            padding-left: 8px;
            padding-top: 8px;
            color: #333333;
            margin: 0 auto;
        }

        .radio_text {
            font-size: 12px;
            color: #ffffff;
            display: inline;
        }

        .inputOption_setting {
            width: 480px;
            height: 330px;
            position: absolute;
            top: 40%;
            left: 40%;
            background-color: rgba(177, 201, 233, 0.5);
            padding-left: 5px;
            padding-top: 8px;
        }

        .inputOption_setting_center {
            width: 96%;
            height: 97%;
            padding-left: 15px;
            padding-top: 5px;
            background-color: #b1c9e9;
            font-size: 14px;
            font-weight: 500;
            color: #464646;
        }

        .btn_submit, .btn_cancel {
            line-height: 20px;
            border-radius: 5px;
            border: 1px solid #57779e;
            color: #ffffff;
            background-color: #57779e;
            height: 25px;
            width: 60px;
            margin-left: 100px;
            margin-top: 15px;
            margin-bottom: 10px;
        }

        h1 {
            font-size: 14px;
            color: #999999;
            margin-top: -30px;
            margin-left: 350px;
        }

        .GOMo_select {
            width: 96%;
            margin: 0 auto;
            height: 23px;
            line-height: 23px;
            border-radius: 5px;
            border: 1px solid #999999;
            margin-bottom: 5px;
        }

        h6 {
            font-size: 12px;
            font-weight: 200;
            color: #666666;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .h7 {
            font-size: 12px;
            font-weight: 200;
            color: #CCCCCC;
            padding-left: 10px;
        }

        .h8 {
            font-size: 12px;
            font-weight: 200;
            color: #999999;
            padding-left: 10px;
        }

        .input_setting_text {
            width: 96%;
            margin: 0 auto;
            height: 23px;
            line-height: 23px;
            border-radius: 5px;
            border: 1px solid #999999;
            margin-bottom: 5px;
            padding-left: 5px;
        }

        img {
            padding: 5px;
            width: 600px;
            height: auto;
        }

        .outer {
            width: 600px;
            height: 100px;
            margin-left: 10px;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.7);
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            position: fixed;
            z-index: 910;
        }

        .overlayimg {
            z-index: 911;
            margin: 0 auto;
            width: auto;
            position: fixed;
        }

        #foot {
            width: 100%;
            height: 80px;
            background-color: #666666;
            margin-top: -30px;
            color: #ffffff;
            padding-left: 100px;
            padding-top: 80px;
            z-index: 6;
        }

        .tip {
            width: 15px;
            height: 15px;
        }

        .tip_out {
            float: right;
            margin-left: 5px;
        }

        .Upload_wait {
            width: 30px;
            height: 30px;
            margin-top: 10px;
        }

        .Execute_btn {
            margin-bottom: 10px;
            margin-top: 10px;
            width: 80px;
            height: 30px;
            border: 01px;
            background: #57779e;
            color: #ffffff;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            font-size: 15px;
        }

        .Execute_btn_samtools {
            margin-bottom: 10px;
            margin-top: 10px;
            margin-left: 20px;
            width: 80px;
            height: 30px;
            border: 01px;
            background: #57779e;
            color: #ffffff;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            font-size: 15px;
        }

        .Upload_wait_div {
            font-size: 15px;
            color: #666666;
            margin-top: -60px;
            margin-left: 100px;
        }

        #arrow-down_user {
            width: 0;
            height: 0;
            float: right;
            border-left: 6px solid transparent;
            border-right: 6px solid transparent;
            border-top: 6px solid #ffffff;
            margin-top: 5px;
            margin-right: 20px;
        }

        .citation {
            padding-top: 10px;
            padding-left: 10px;
            padding-bottom: 10px;
            color: #666666;
            border: 1px dashed #cccccc;
        }

        #login_menu {
            width: 80px;
            height: 50px;
            position: absolute;
            top: 40px;
            right: 50px;
        }

        #login_spanUpdate {
            width: 110px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            top: 20px;
            right: 30px;
            color: #ffffff;
            position: absolute;
        }

        #login_spanUpdate:hover {
            width: 110px;
            height: 30px;
            top: 20px;
            right: 30px;
            text-align: center;
            line-height: 30px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.9);
            text-shadow: 1px 2px 3px #bdbcbb;
            color: #57779e;
            position: absolute;
            font-weight: 200;
        }

        .file-box {
            position: relative;
            width: 100%;
        }

        .btn1 {
            background-color: #57779e;
            height: 28px;
            width: 15%;
            color: #ffffff;
            border-radius: 10px;
            border: 1px solid #57779e;
        }

        .fileField {
            position: absolute;
            top: 0;
            right: 1px;
            height: 28px;
            filter: alpha(opacity:0);
            opacity: 0;
            width: 18%;
        }

        .input_text {
            border: 1px solid #999999;
            width: 80%;
            height: 28px;
            color: #999999;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding-left: 10px;
        }

        .input_text_pair {
            border: 1px solid #999999;
            width: 30%;
            height: 23px;
            color: #999999;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding-left: 8px;
        }

        .fileField_pair1 {
            position: absolute;
            top: 0;
            right: 50%;
            height: 28px;
            filter: alpha(opacity:0);
            opacity: 0;
            width: 18%;
        }

        .fileField_pair2 {
            position: absolute;
            top: 0;
            right: 10px;
            height: 28px;
            filter: alpha(opacity:0);
            opacity: 0;
            width: 18%;
        }
    </style>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css">
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
        <input type="text" name="Session" style="display:none" value="<%=session.getAttribute("Session")%>">
        <div id="list_choose">
            <div id="choose_help">Help/contact</div>
            <div id="choose_meme">Downstream Analysis</div>
            <div id="choose_tool">Tools</div>
            <div id="choose_work">Work Flow</div>
            <div id="choose_home">Home</div>
        </div>
        <div id="login_spanUpdate" style="display:none" onclick="recentShow()">Recent Jobs</div>
    </div>
    <div id="side_center">
        <div id="left_side">
            <div class="side_radio"></div>
            <div class="side_top"><h5>Tools</h5></div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_1',1); " style="cursor:hand;">
                <div class="arrow1" id="arrow1" style="display: block"></div>
                <div class="arrow2" id="arrow2" style="display:none"></div>
                Preprocessing
            </div>
            <div id="side_1" style="display: block">
                <div class="side_son" id="side_son_1" style="background-color: #57779e;color:#ffffff"
                     onclick="JavaScript:side_right_show(1,17)" ; style="cursor:hand;">BMIQ
                </div>
                <div class="side_son" id="side_son_2" onclick="JavaScript:side_right_show(2,17)">PBC</div>
                <div class="side_son" id="side_son_3" onclick="JavaScript:side_right_show(3,17)">SWAN</div>
                <div class="side_son" id="side_son_4" onclick="JavaScript:side_right_show(4,17)">Funnorm</div>
                <div class="side_son" id="side_son_5" onclick="JavaScript:side_right_show(5,17)">Illumina</div>
                <div class="side_son" id="side_son_6" onclick="JavaScript:side_right_show(6,17)">Noob</div>
                <div class="side_son" id="side_son_7" onclick="JavaScript:side_right_show(7,17)">SQN</div>
                <div class="side_son" id="side_son_8" onclick="JavaScript:side_right_show(8,17)">Dasen</div>
                <div class="side_son" id="side_son_9" onclick="JavaScript:side_right_show(9,17)">Raw</div>
            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_2',3);" style="cursor:hand;">
                <div class="arrow1" id="arrow3" style="display: none"></div>
                <div class="arrow2" id="arrow4" style="display:block"></div>
                Batch Effect Correction
            </div>
            <div id="side_2" style="display: none">
                <div class="side_son" id="side_son_16" onclick="JavaScript:side_right_show(16,17)">ComBat</div>
                <%--<div class="side_son" id="side_son_11" onclick="JavaScript:side_right_show(11,16)">dmpFinder</div>--%>
            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_3',5);" style="cursor:hand;">
                <div class="arrow1" id="arrow5" style="display: none"></div>
                <div class="arrow2" id="arrow6" style="display:block"></div>
                DMP
            </div>
            <div id="side_3" style="display: none">
                <div class="side_son" id="side_son_10" onclick="JavaScript:side_right_show(10,17)">Limma</div>
                <div class="side_son" id="side_son_17" onclick="JavaScript:side_right_show(17,17)">dmpFinder</div>
                <div class="side_son" id="side_son_15" onclick="JavaScript:side_right_show(15,17)">samr</div>


            </div>
            <div class="side_parent" onclick="JavaScript:side_mapping('side_4',7);" style="cursor:hand;">
                <div class="arrow1" id="arrow7" style="display: none"></div>
                <div class="arrow2" id="arrow8" style="display:block"></div>
                DMR
            </div>
            <div id="side_4" style="display: none">
                <div class="side_son" id="side_son_11" onclick="JavaScript:side_right_show(11,17)">DMRcate</div>
                <div class="side_son" id="side_son_12" onclick="JavaScript:side_right_show(12,17)">Bumphunter</div>
                <div class="side_son" id="side_son_13" onclick="JavaScript:side_right_show(13,17)">ProbeLasso</div>
                <div class="side_son" id="side_son_14" onclick="JavaScript:side_right_show(14,17)">Seqlm</div>
            </div>

        </div>
        <div id="side_right">
            <!--------------------------------BMIQ-------------------------------------------------------------->
            <div id="side_right_1" class="side_right" style="display:block">
                <div class="link" onclick="JavaScript:nece_opt_show_BMIQ_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down3" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right3" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="BMIQ" id="BMIQ_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('BMIQ_exe','btn_BMIQ','wait_BMIQ');">
                    <div id="necessary_center_BMIQ" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1">
                            Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format, it contains your iDAT files and a samplesheet.csv."></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_BMIQ_file" id="input_BMIQ_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_bmiq" class="fileField" id="fileField_bmiq_idat" onchange="return (fileChange(this,'input_BMIQ_file' )&& checkFileExt(this.value,'input_BMIQ_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_BMIQ_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down4" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right4" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_BMIQ" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_Load" id="optionalParameters_default_Load" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('champload_op').style.display='none'"/>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_Load" id="optionalParameters_set_Load" class="optionalParameters_set" value="2" onclick="document.getElementById('champload_op').style.display='block'"/>set the parameters by yourself
                            <div id="BMIQ_radio" class="radio_text"></div>
                        </div>
                        <div id="champload_op" class="inputOption_setting" style="display:none;">
                            <div id="advancedPair_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">False
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>

                                <!--
                                ProbeCutoff
                                <input type="text" class="input_setting_text" name="ProbeCutoff" value="0"/><br>
                                <h6>The NA ratio threshhold for probes. Probes with above proportion of NA will be removed.</h6>

                                SampleCutoff
                                <input type="text" class="input_setting_text" name="SampleCutoff" value="0.1"/><br>
                                <h6>The failed p value (or NA) threshhold for samples.Samples with above proportion of failed p value (NA) will be removed.</h6>


                                filterBeads&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="filterBeads" value="FALSE">F
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
                                -->

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

                                <!--champ.norm()可选参数-->
                                plotBMIQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plotBMIQ" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="plotBMIQ" value="TRUE">T
                                </label>
                                <h6>should the normalized plot in PDF and save it in resultsDir.default=FALSE.</h6>
                                cores
                                <input type="text" class="input_setting_text" name="cores" value="3"/><br>
                                <h6>how many cores shall be used to run parallel.default=3</h6>

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('champload_op').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('champload_op').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_BMIQ_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down48" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right48" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_BMIQ" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>


                    <input type="submit" value="Execute" class="Execute_btn" id="btn_BMIQ"/><s:fielderror fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"  />
                    <div id="wait_BMIQ" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait" />
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div id="citation_bwa" class="citation">
                    Teschendorff, A. E., Marabita, F., Lechner, M., Bartlett, T., Tegner, J., Gomez-Cabrero, D., & Beck, S. (2012). A beta-mixture quantile normalization method for correcting probe design bias in Illumina Infinium 450 k DNA methylation data. Bioinformatics, 29(2), 189-196.
                </div>
            </div>

            <!--------------------------------PBC-------------------------------------------------------------->
            <div id="side_right_2" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_PBC_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down14" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right14" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="PBC" id="PBC_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('PBC_exe','btn_pbc','wait_pbc');">
                    <div id="necessary_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="PBC_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_PBC_file" id="input_PBC_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_pbc" class="fileField" id="fileField_pbc_idat" onchange="return (fileChange(this,'input_PBC_file' )&& checkFileExt(this.value,'input_PBC_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down15" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right15" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_PBC" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_PBC" id="optionalParameters_default_PBC" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('pbc_op').style.display='none'"/>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_PBC" id="optionalParameters_set_PBC" class="optionalParameters_set" value="2" onclick="document.getElementById('pbc_op').style.display='block'"/>set the parameters by yourself
                            <div id="PBC_radio" class="radio_text"></div>
                        </div>
                        <div id="pbc_op" class="inputOption_setting" style="display:none;">
                            <div class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                autoimpute&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="TRUE" checked>True
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="autoimpute" value="FALSE">False
                                </label>
                                <h6>If after filtering (or not do filtering) there are NA values in it, should impute.knn(k=3) should be done for the rest NA?</h6>


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

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('pbc_op').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('pbc_op').style.display='none';"/>

                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_PBC_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down49" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right49" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_PBC" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>


                    <input type="submit" value="Execute" class="Execute_btn" id="btn_pbc"/><s:fielderror fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"  />
                    <div id="wait_pbc" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait" />
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to access your job's results after the processing.
                    </div>
                </s:form>

                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div id="citation_bwa" class="citation">
                    Dedeurwaerder, S., Defrance, M., Calonne, E., Denis, H., Sotiriou, C., & Fuks, F. (2011). Evaluation of the Infinium Methylation 450K technology. Epigenomics, 3(6), 771-784.
                </div>
            </div>

            <!------------------------SWAN-------------------------------------------------------------->
            <div id="side_right_3" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down1" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right1" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="SWAN" id="SWAN_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('SWAN_exe','btn_SWAN','wait_SWAN');">
                    <div id="necessary_center_SWAN" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="SWAN_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>

                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_SWAN_file" id="input_SWAN_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_swan" class="fileField" id="fileField_swan_idat" onchange="return (fileChange(this,'input_SWAN_file' )&& checkFileExt(this.value,'input_SWAN_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all cross reactive probes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterCRO" value="FALSE">FALSE
                        </div>

                    </div>
                    <!--
                    <div class="link" onclick="JavaScript:nece_opt_show_op();" style="cursor:hand;">
                    <div class="arrow-right" id="arrow-right2" style="display:none"></div>
                    <div class="arrow-down" id="arrow-down2" style="display:block"></div>
                    Optional parameter
                    </div>
                    <div id="optioanl_center_SWAN" class="optional_center" style="display:block">
                    <div class="blacktop_1">optional parameters</div>
                    <div class="blackdown_1">
                    <input type="radio" name="optionalParameters_SWAN" id="optionalParameters_default_SWAN" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('champswan_op').style.display='none'"/>default
                    <input type="radio" name="optionalParameters_SWAN" id="optionalParameters_set_SWAN" class="optionalParameters_set" value="2" onclick="document.getElementById('champswan_op').style.display='block'"/>set the parameters by yourself
                    <div id="SWAN_radio" class="radio_text"></div>
                    </div>
                    <div id="champswan_op" class="inputOption_setting" style="display:none;">
                    <div class="inputOption_setting_center"style="overflow-y:scroll;">
                    verbose&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="checkbox-inline">
                    <input type="radio" name="verbose" value="TRUE" checked>T
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="checkbox-inline">
                    <input type="radio" name="verbose" value="FALSE">F
                    </label><br>
                    <h6>Should the function be verbose?default=TRUE.</h6>

                    <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('champswan_op').style.display='none';"/>
                    <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('champswan_op').style.display='none';"/>

                    </div>
                    </div>
                    </div>
                    -->
                    <div class="link" onclick="JavaScript:nece_vis_show_SWAN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down50" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right50" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_SWAN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SWAN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SWAN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the
                        top to access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Maksimovic, J., Gordon, L., & Oshlack, A. (2012). SWAN: Subset-quantile within array normalization for illumina infinium HumanMethylation450 BeadChips. Genome biology, 13(6), R44.                </div>
            </div>
            <!------------------------FN-------------------------------------------------------------->
            <div id="side_right_4" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_FN_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down30" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right30" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="FunctionalNormalize" id="FunctionalNormalize_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('FunctionalNormalize_exe','btn_FN','wait_FN');">
                    <div id="necessary_center_FN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="FN_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_FN_file" id="input_FN_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_fn" class="fileField" id="fileField_fn_idat" onchange="return (fileChange(this,'input_FN_file' )&& checkFileExt(this.value,'input_FN_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all cross reactive probes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterCRO" value="FALSE">FALSE
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_FN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down31" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right31" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_FN" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_FN" value="1" checked
                                   onclick="javascript:turnoff('optional_center_setting_FN')">default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_FN" value="2"
                                   onclick="document.getElementById('optional_center_setting_FN').style.display='block'">set
                            parameters by yourself
                        </div>

                        <div id="optional_center_setting_FN" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_FN_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">

                                nPCs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>Number of principal components from the control probes PCA</h6>
                                <input type="text" class="input_setting_text" name="nPCs" value="2"/><br>

                                sex&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>An optional numeric vector containing the sex of the samples.</h6>
                                <input type="text" class="input_setting_text" name="sex" value="NULL"/><br>


                                bgCorr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bgCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bgCorr" value="FALSE">F
                                </label>
                                <h6>Should the NOOB background correction be done, prior to
                                    functional normalization.</h6>

                                dyeCorr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="FALSE">F
                                </label>
                                <h6>Should dye normalization be done as part of the NOOB
                                    background correction</h6>

                                keepCN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="keepCN" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="keepCN" value="FALSE">F
                                </label>
                                <h6>Should copy number estimates be kept around? Setting to‘FALSE’ will decrease the size of the output object significantly</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="FALSE">F
                                </label>
                                <h6>Should the function be verbose?</h6>

                                <input type="button" class="btn_submit" value="submit" onclick="document.getElementById('optional_center_setting_FN').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel" onclick="document.getElementById('optional_center_setting_FN').style.display='none';"/>

                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_FN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down51" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right51" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_FN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_FN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_FN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Fortin, J. P., Labbe, A., Lemire, M., Zanke, B. W., Hudson, T. J., Fertig, E. J., ... & Hansen, K. D. (2014). Functional normalization of 450k methylation array data improves replication in large cancer studies. Genome biology, 15(11), 503.
                </div>
            </div>
            <!------------------------ILLUMINA(BLAST)-------------------------------------------------------------->
            <div id="side_right_5" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_ill_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down32" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right32" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Illumina" id="illumina_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('illumina_exe','btn_ill','wait_ill');">
                    <div id="necessary_center_ill" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="ill_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>

                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_ILL_file" id="input_ILL_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_ill" class="fileField" id="fileField_ill_idat" onchange="return (fileChange(this,'input_ILL_file' )&& checkFileExt(this.value,'input_ILL_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all cross reactive probes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterCRO" value="FALSE">FALSE
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_ill_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down33" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right33" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_ill" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_ill" id="optionalParameters_default_ill"
                                   class="optionalParameters_default" value="1"
                                   onclick="document.getElementById('optional_center_setting_ill').style.display='none'"
                                   checked="true"/>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_ill" id="optionalParameters_set_ill"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_ill').style.display='block'"/>set
                            the parameters by yourself
                        </div>
                        <div id="optional_center_setting_ill" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_blast_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">

                                bg.correct
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="bg_correct" value="FALSE">F
                                </label><br>
                                <h6>logical, should background correction be performed?default=TRUE.</h6>

                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_ill').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_ill').style.display='none'"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_ILL_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down52" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right52" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_ILL" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_ill"/>
                    <s:fielderror
                            fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_ill" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">

                </div>
            </div>
            <!------------------------Noob(Subread)-------------------------------------------------------------->
            <div id="side_right_6" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_Noob_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down34" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right34" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="Noob" id="Noob_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('Noob_exe','btn_Noob','wait_Noob');">
                    <div id="necessary_center_Noob" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="noob_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_Noob_file" id="input_Noob_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_noob" class="fileField" id="fileField_noob_idat" onchange="return (fileChange(this,'input_Noob_file' )&& checkFileExt(this.value,'input_Noob_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all cross reactive probes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterCRO" value="FALSE">FALSE
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_opt_show_Noob_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down35" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right35" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_Noob" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_index_Noob" id="optionalParameters_default_noob"
                                   class="optionalParameters_default" value="1"
                                   onclick="document.getElementById('optional_center_setting_Noob').style.display='none'"
                                   checked="true"/>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_index_Noob" id="optionalParameters_set_noob"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_Noob').style.display='block'"/>set
                            the parameters by yourself
                            <div id="Noob_index_radio" class="radio_text"></div>
                        </div>
                        <div id="optional_center_setting_Noob" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_Noob_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                offset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6> an offset for the normexp background correction.default=15</h6>
                                <input type="text" class="input_setting_text" name="offset"
                                       value="15"/><br>

                                dyeCorr&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="dyeCorr" value="FALSE">F
                                </label><br>
                                <h6>Should dye correction be done?default=TRUE.</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="FALSE">F
                                </label><br>
                                <h6>Should the function be verbose?default=TRUE.</h6>

                                <input type="button" value="submit" checked="true" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_Noob').style.display='none';JavaScript:Subread_index_radio(Subread_B.value,Subread_f.value,Subread_F.value,Subread_M.value)"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_Noob').style.display='none'"/>
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_Noob_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down53" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right53" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_Noob" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Noob"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Noob" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Triche Jr, T. J., Weisenberger, D. J., Van Den Berg, D., Laird, P. W., & Siegmund, K. D. (2013). Low-level processing of Illumina Infinium DNA methylation beadarrays. Nucleic acids research, 41(7), e90-e90.
                </div>
            </div>
            <!-----------------------SQN(NGM)-------------------------------------------------------------->
            <div id="side_right_7" class="side_right" style="display:none">
                <div class="link" onclick="JavaScript:nece_opt_show_SQN_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down36" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right36" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="SQN" id="SQN_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('SQN_exe','btn_SQN','wait_SQN');">
                    <div id="necessary_center_SQN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1" id="SQN_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_SQN_file" id="input_SQN_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_sqn" class="fileField" id="fileField_sqn_idat" onchange="return (fileChange(this,'input_SQN_file' )&& checkFileExt(this.value,'input_SQN_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                        <div class="blacktop_1">Please input the detection p-value threshhold,probes above this value will be filtered out</div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="detPcut" value="0.01"/><br>
                        </div>

                        <div class="blacktop_1">whether to remove all probes from X and Y chromosomes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterXY" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterXY" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all probes affected by SNPs</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterSNPs" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterSNPs" value="FALSE">FALSE
                        </div>

                        <div class="blacktop_1">whether to remove all cross reactive probes</div>
                        <div class="blackdown_1">
                            <input type="radio" name="filterCRO" value="TRUE" checked>TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="filterCRO" value="FALSE">FALSE
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_opt_show_SQN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down37" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right37" style="display:none"></div>
                        Optional parameter
                    </div>
                    <div id="optional_center_SQN" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_SQN" class="optionalParameters_default"
                                   value="1" checked="true"
                                   onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>default&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_SQN" class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('optional_center_setting_SQN').style.display='block'"/>set
                            the parameters by yourself
                        </div>
                        <div id="optional_center_setting_SQN" class="inputOption_setting" style="display:none;">
                            <div id="optional_center_setting_SQN_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                fixOutliers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="fixOutliers" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="fixOutliers" value="FALSE">F
                                </label><br>
                                <h6>Should low outlier Meth and Unmeth signals be fixed?default=TRUE.</h6>

                                removeBadSamples&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="removeBadSamples" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="removeBadSamples" value="TRUE">T
                                </label><br>
                                <h6>Should bad samples be removed?default=false.</h6>

                                badSampleCutoff&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>Samples with median Meth and Umneth signals below this
                                    cutoff will be labelled 'bad'.default=10.5</h6>
                                <input type="text" class="input_setting_text" name="badSampleCutoff"
                                       value="10.5"/><br>

                                quantileNormalize&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="quantileNormalize" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="quantileNormalize" value="FALSE">F
                                </label><br>
                                <h6>Should quantile normalization be performed?default=TRUE.</h6>

                                stratified&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="stratified" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="stratified" value="FALSE">F
                                </label><br>
                                <h6> Should quantile normalization be performed within genomic
                                    region strata (e.g. CpG island, shore, etc.)?default=TRUE.</h6>

                                mergeManifest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="mergeManifest" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="mergeManifest" value="TRUE">T
                                </label><br>
                                <h6>Should the information in the associated manifest
                                    package be merged into the output object?default=FALSE.</h6>

                                verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose" value="TRUE" checked>T
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="verbose:" value="FALSE">F
                                </label><br>
                                <h6>Should the function be verbose?default=TRUE.</h6>

                                <input type="button" value="submit" class="btn_submit"
                                       onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>
                                <input type="button" value="cancel" class="btn_cancel"
                                       onclick="document.getElementById('optional_center_setting_SQN').style.display='none'"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_SQN_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down54" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right54" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_SQN" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SQN"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SQN" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Touleimat, N., & Tost, J. (2012). Complete pipeline for Infinium Human Methylation 450K BeadChip data processing using subset quantile normalization for accurate DNA methylation estimation. Epigenomics, 4(3), 325-341.                </div>
            </div>
            <!------------------------Dasen(PePr)-------------------------------------------------------------->
            <div id="side_right_8" class="side_right" style="display:none">
                <form action="Dasen" id="Dasen_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('Dasen_peakcalling','btn_Dasen','wait_Dasen');">
                    <div class="link" onclick="JavaScript:dasen_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right20" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down20" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_dasen" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="dasen_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv.Dasen is a  data-driven approach only to preprocessing Illumina 450K methylation array data"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_dasen_file" id="input_dasen_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_dasen" class="fileField" id="fileField_dasen_idat" onchange="return (fileChange(this,'input_dasen_file' )&& checkFileExt(this.value,'input_dasen_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_Dasen_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down55" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right55" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_Dasen" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_Pepr"/><s:fielderror
                        fieldName="check1" cssStyle="color:red;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_Dasen" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Pidsley, R., Wong, C. C., Volta, M., Lunnon, K., Mill, J., & Schalkwyk, L. C. (2013). A data-driven approach to preprocessing Illumina 450K methylation array data. BMC genomics, 14(1), 293.                </div>
            </div>
            <!------------------------Raw（SICER）-------------------------------------------------------------->
            <div id="side_right_9" class="side_right" style="display:none">
                <form action="RAW" id="RAW_peakcalling" enctype="multipart/form-data" method="post"
                      onsubmit="return searchData('RAW_peakcalling','btn_RAW','wait_RAW');">
                    <div class="link" onclick="JavaScript:raw_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right10" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down10" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_raw" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="RAW_test">Please input the raw files
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .zip format,it contains your iDAT files and a samplesheet.csv"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text"  name="input_RAW_file" id="input_RAW_file" class="input_text"/>
                                <input type='button' class='btn1' value='Choose File' />
                                <input type="file" name="fileField_raw" class="fileField" id="fileField_raw_idat" onchange="return (fileChange(this,'input_RAW_file' )&& checkFileExt(this.value,'input_RAW_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input whether you prefer m-values M or beta-values B</div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="getBeta" checked>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="getM">M
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_Raw_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down56" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right56" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_RAW" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" value="1" checked>mdsplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="2">densityplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="3">histplot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" value="4">all plots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_RAW"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_RAW" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </form>
                <span style="color:#666666;font-size:20px;">Tips:</span> <br>
                <div class="citation">
                    Converts the Red/Green channel for an Illumina methylation array into methylation signal, without
                    using any normalization.
                </div>
            </div>
            <!-----------------------limma(multi)------------------------------------------------------------>
            <div id="side_right_10" class="side_right" style="display:none">
                <s:form action="Limma" id="Tools_limma" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_limma','btn_limma','wait_limma');">
                    <div class="link" onclick="JavaScript:limma_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right44" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down44" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_limma" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="LIMMA_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSet_file" id="input_exprSet_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_limma" class="fileField" id="fileField_limma_exp" onchange="return (fileChange(this,'input_exprSet_file')&&checkFileExt(this.value,'input_exprSet_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheet_file" id="input_sampleSheet_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_limma" class="fileField" id="fileField_limma_sam" onchange="return (fileChange(this,'input_sampleSheet_file' )&& checkFileExt(this.value,'input_sampleSheet_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                        <div class="blacktop_1">whether to apply covariates to the design matrix</div>
                        <div class="blackdown_1">
                            <input type="radio" name="cor" value="1" checked onclick="document.getElementById('cor1_option').style.display='none'; ">FALSE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="cor" value="2" onclick="document.getElementById('cor1_option').style.display='block'; ">TRUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <!-- <input type="radio" name="cor" value="2" onclick="document.getElementById('cor1_option').style.display='none';document.getElementById('cor2_option').style.display='block';document.getElementById('cor3_option').style.display='none' ">two&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                        </div>
                        <div id="cor1_option" class="inputOption_setting" style="display:none">
                            <div id="cor1_option_center" class="inputOption_setting_center">
                                please input the name of covariate in your SampleSheet
                                <input type="text" class="input_setting_text" name="cor1" value="null"/><br>
                                please choose the type of covariate in your SampleSheet<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="continuous" checked>continuous
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="discrete">discrete
                                </label><br>
                                <h6>eg:age is a continuous covariate and gender is a discrete covariat</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('cor1_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('cor1_option').style.display='none';"/>
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the adjusted p-value to get the significant CpGs sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="You can set this parameter according to your own requirements, and the complete CpGs information will also be provided in the result file.default=0.05."></div>
                        </div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="adjPval" value="0.05"/><br>
                        </div>
                        <!--
                        <div id="cor2_option" class="inputOption_setting" style="display:none">
                            <div id="cor2_option_center" class="inputOption_setting_center">
                                please input the name of the first covariate in your SampleSheet
                                <input type="text" class="input_setting_text" name="cor1"/><br>

                                please choose the type of the first covariate in your SampleSheet<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="continuous" checked>continuous
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor1_type" value="discrete">discrete
                                </label><br>
                                <h6>eg:age is a continuous covariate and cell type is a discrete  covariat</h6>

                                please input the name of the second covariate in your SampleSheet
                                <input type="text" class="input_setting_text" name="cor2"/><br>

                                please choose the type of the second covariate in your SampleSheet<br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor2_type" value="continuous" checked>continuous
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="cor2_type" value="discrete">discrete
                                </label><br>
                                <h6>eg:age is a continuous covariate and cell type is a discrete  covariat</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('cor2_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('cor2_option').style.display='none';"/>
                            </div>
                        </div>
                        -->
                    </div>

                    <div class="link" onclick="JavaScript:limma_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right45" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down45" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_limma" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_limma" id="multi_optionalParameters_default" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('limma_optional_setting').style.display='none'"/>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_limma" id="multi_optionalParameters_set" class="optionalParameters_set" value="2" onclick="document.getElementById('limma_optional_setting').style.display='block'"/>set the parameters by yourself
                            <div id="Limma_radio" class="radio_text"></div>
                        </div>
                        <div id="limma_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="limma_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">

                                proportion&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>numeric value between 0 and 1, assumed proportion of genes
                                    which are differentially expressed.default=10.5</h6>
                                <input type="text" class="input_setting_text" name="proportion"
                                       value="0.01"/><br>

                                trend&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="trend" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="trend" value="TRUE">T
                                </label><br>
                                <h6>logical, should an intensity-trend be allowed for the prior
                                    variance? Default is that the prior variance is constant.</h6>

                                robust&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="robust" value="FALSE" checked>F
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="robust" value="TRUE">T
                                </label><br>
                                <h6> logical, should the estimation of 'df.prior' and 'var.prior'
                                    be robustified against outlier sample variances?.</h6>

                                number
                                <h6>numeric value between 0 and 1, assumed proportion of genes
                                    which are differentially expressed.default=100</h6>
                                <input type="text" class="input_setting_text" name="number"
                                       value="100"/><br>


                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('limma_optional_setting').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('limma_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:nece_vis_show_limma_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down57" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right57" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_limma" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="pie plot:Gene region feature category of significant CpG sites"></div>

                        </div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('volcano_option').style.display='block';document.getElementById('scatter_option').style.display='none'"/>volcano plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" class="optionalParameters_default" value="2" onclick="document.getElementById('scatter_option').style.display='block';document.getElementById('volcano_option').style.display='none';"/>scatter plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" class="optionalParameters_set" value="4") onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>pie plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" class="optionalParameters_set" value="3" onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>none
                        </div>
                        <div id="volcano_option" class="inputOption_setting" style="display:none">
                            <div id="volcano_option_center" class="inputOption_setting_center">
                                P.Value&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>default=0.05.</h6>
                                <input type="text" class="input_setting_text" name="P_Value"
                                       value="0.05"/><br>
                                logFC
                                <h6>default=1.</h6>
                                <input type="text" class="input_setting_text" name="logFC"
                                       value="1"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                            </div>
                        </div>
                        <div id="scatter_option" class="inputOption_setting" style="display:none">
                            <div id="scatter_option_center" class="inputOption_setting_center">
                                logFC
                                <h6>default=0.5.</h6>
                                <input type="text" class="input_setting_text" name="logFC1"
                                       value="0.5"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_limma"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_limma" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Smyth, Gordon K. (2005). Limma: linear models for microarray data. Bioinformatics and computational biology solutions using R and Bioconductor. Springer, New York, NY, pp.397-420.                </div>
            </div>

            <!-----------------------dmpFinder------------------------------------------------------------>
            <div id="side_right_17" class="side_right" style="display:none">
                <s:form action="dmpFinder" id="Tools_dmpFinder" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_dmpFinder','btn_dmpFinder','wait_dmpFinder');">
                    <div class="link" onclick="JavaScript:dmpFinder_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right60" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down60" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_dmpFinder" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="dmpFinder_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetdmpfinder_file" id="input_exprSetdmpfinder_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_dmpfinder" class="fileField" id="fileField_dmpfinder_exp" onchange="return (fileChange(this,'input_exprSetdmpfinder_file')&&checkFileExt(this.value,'input_exprSetdmpfinder_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetdmpfinder_file" id="input_sampleSheetdmpfinder_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_dmpfinder" class="fileField" id="fileField_dmpfinder_sam" onchange="return (fileChange(this,'input_sampleSheetdmpfinder_file' )&& checkFileExt(this.value,'input_sampleSheetdmpfinder_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input the adjusted p-value to get the significant CpGs sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="You can set this parameter according to your own requirements, and the complete CpGs information will also be provided in the result file.default=0.05."></div>
                        </div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="adjPval" value="0.05"/><br>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_dmpFinder_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down70" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right70" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_dmpFinder" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="pie plot:Gene region feature category of significant CpG sites"></div>

                        </div>
                        <div class="blackdown_1">
                            <%--<input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('volcano_option').style.display='block';document.getElementById('scatter_option').style.display='none'"/>volcano plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<input type="radio" name="plot" class="optionalParameters_default" value="2" onclick="document.getElementById('scatter_option').style.display='block';document.getElementById('volcano_option').style.display='none';"/>scatter plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <input type="radio" name="plot" class="optionalParameters_set" value="4" checked="true") onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>pie plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" class="optionalParameters_set" value="3" onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>none
                        </div>
                        <div id="volcano_option" class="inputOption_setting" style="display:none">
                            <div id="volcano_option_center" class="inputOption_setting_center">
                                P.Value&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>default=0.05.</h6>
                                <input type="text" class="input_setting_text" name="P_Value"
                                       value="0.05"/><br>
                                logFC
                                <h6>default=1.</h6>
                                <input type="text" class="input_setting_text" name="logFC"
                                       value="1"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                            </div>
                        </div>
                        <div id="scatter_option" class="inputOption_setting" style="display:none">
                            <div id="scatter_option_center" class="inputOption_setting_center">
                                logFC
                                <h6>default=0.5.</h6>
                                <input type="text" class="input_setting_text" name="logFC1"
                                       value="0.5"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_dmpFinder"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_dmpFinder" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Aryee M J, Jaffe A E, Corrada-Bravo H, et al. Minfi: a flexible and comprehensive Bioconductor package for the analysis of Infinium DNA methylation microarrays[J]. Bioinformatics, 2014, 30(10): 1363-1369.
                </div>
            </div>

            <!-----------------------samr------------------------------------------------------------>
            <div id="side_right_15" class="side_right" style="display:none">
                <s:form action="samr" id="Tools_samr" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_samr','btn_samr','wait_samr');">
                    <div class="link" onclick="JavaScript:samr_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right62" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down62" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_samr" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="samr_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetsamr_file" id="input_exprSetsamr_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_samr" class="fileField" id="fileField_samr_exp" onchange="return (fileChange(this,'input_exprSetsamr_file')&&checkFileExt(this.value,'input_exprSetsamr_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetsamr_file" id="input_sampleSheetsamr_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_samr" class="fileField" id="fileField_samr_sam" onchange="return (fileChange(this,'input_sampleSheetsamr_file' )&& checkFileExt(this.value,'input_sampleSheetsamr_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                        <div class="blacktop_1">Please input the adjusted p-value to get the significant CpGs sites
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="You can set this parameter according to your own requirements, and the complete CpGs information will also be provided in the result file.default=0.05."></div>
                        </div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="adjPval" value="0.05"/><br>
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_samr_op();" style="cursor:hand;">
                        <div class="arrow-down" id="arrow-down71" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right71" style="display:none"></div>
                        Visualization
                    </div>
                    <div id="vis_center_samr" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="pie plot:Gene region feature category of significant CpG sites"></div>

                        </div>
                        <div class="blackdown_1">
                            <%--<input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" onclick="document.getElementById('volcano_option').style.display='block';document.getElementById('scatter_option').style.display='none'"/>volcano plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<input type="radio" name="plot" class="optionalParameters_default" value="2" onclick="document.getElementById('scatter_option').style.display='block';document.getElementById('volcano_option').style.display='none';"/>scatter plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <input type="radio" name="plot" class="optionalParameters_set" value="4" checked="true") onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>pie plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="plot" class="optionalParameters_set" value="3" onclick="document.getElementById('volcano_option').style.display='none';document.getElementById('scatter_option').style.display='none';"/>none
                        </div>
                        <div id="volcano_option" class="inputOption_setting" style="display:none">
                            <div id="volcano_option_center" class="inputOption_setting_center">
                                P.Value&nbsp;&nbsp;&nbsp;&nbsp;
                                <h6>default=0.05.</h6>
                                <input type="text" class="input_setting_text" name="P_Value"
                                       value="0.05"/><br>
                                logFC
                                <h6>default=1.</h6>
                                <input type="text" class="input_setting_text" name="logFC"
                                       value="1"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('volcano_option').style.display='none';"/>
                            </div>
                        </div>
                        <div id="scatter_option" class="inputOption_setting" style="display:none">
                            <div id="scatter_option_center" class="inputOption_setting_center">
                                logFC
                                <h6>default=0.5.</h6>
                                <input type="text" class="input_setting_text" name="logFC1"
                                       value="0.5"/><br>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('scatter_option').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_samr"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_samr" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Tusher V G, Tibshirani R, Chu G. Significance analysis of microarrays applied to the ionizing radiation response[J]. Proceedings of the National Academy of Sciences, 2001, 98(9): 5116-5121.
                </div>
            </div>
            <!------------------------DMRCate（MACS）-------------------------------------------------------------->
            <div id="side_right_11" class="side_right" style="display:none">
                <s:form action="DMRCate" id="Tools_DMRCate_PeakCalling" enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_DMRCate_PeakCalling','wait_DMRCate','wait_DMRCate');">
                    <div class="link" onclick="JavaScript:dmrcate_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right8" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down8" style="display:block"></div>
                        Necessary parameters
                    </div>

                    <div id="necessary_center_dmrcate" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="DMRCate_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetdmr_file" id="input_exprSetdmr_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_dmrcate" class="fileField" id="fileField_dmr_exp" onchange="return (fileChange(this,'input_exprSetdmr_file')&&checkFileExt(this.value,'input_exprSetdmr_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetdmr_file" id="input_sampleSheetdmr_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_dmrcate" class="fileField" id="fileField_dmr_sam" onchange="return (fileChange(this,'input_sampleSheetdmr_file' )&& checkFileExt(this.value,'input_sampleSheetdmr_file'))" />
                            </div>
                        </div>

                        <div class="blacktop_1">Does the data matrix contain Beta or M-values?
                        </div>
                        <div class="blackdown_1">
                            <input type="radio" name="methValue" value="B" checked>Beta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="methValue" value="M">M
                        </div>

                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>
                    </div>
                    <div class="link" onclick="JavaScript:dmrcate_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right9" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down9" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_dmrcate" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_dmrcate" id="optionalParameters_default"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('dmrcate_optional_setting').style.display='none'"/>default&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_dmrcate" id="optionalParameters_set"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('dmrcate_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="dmrcate_radio" class="radio_text"></div>
                        </div>
                        <div id="dmrcate_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="dmrcate_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                rmSNPCH
                                <label class="checkbox-inline">
                                    <input type="radio" name="rmSNPCH" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="rmSNPCH" value="F">FALSE
                                </label><br>
                                <h6> Filters a matrix of M-values (or beta values) by distance to
                                    SNP. Also (optionally) removes crosshybridising probes and
                                    sex-chromosome probes. (default = TRUE)
                                </h6>
                                dist
                                <input type="text"name="dist" value="2" class="input_setting_text"/>
                                <h6>
                                    Maximum distance (from CpG to SNP) of probes to be filtered
                                    out. See details for when Illumina occasionally lists a
                                    CpG-to-SNP distance as being < 0. (default = 2)
                                </h6>
                                mafcut
                                <input type="text"name="mafcut" value="0.05" class="input_setting_text"/>
                                <h6>
                                    Minimum minor allele frequency of probes to be filtered out.
                                    (default = 0.05)
                                </h6>
                                lambda
                                <input type="text"name="lambda" value="1000" class="input_setting_text"/>
                                <h6>
                                    Gaussian kernel bandwidth for smoothed-function estimation.
                                    Also informs DMR bookend definition; gaps >= lambda between
                                    significant CpG sites will be in separate DMRs. Support is
                                    truncated at 5*lambda. See DMRcate package for further info.
                                    (default = 1000)
                                </h6>
                                C
                                <input type="text"name="C" value="2" class="input_setting_text"/>
                                <h6>
                                    Scaling factor for bandwidth. Gaussian kernel is calculated
                                    where lambda/C = sigma. Empirical testing shows that when
                                    lambda=1000, near-optimal prediction of sequencing-derived
                                    DMRs is obtained when C is approximately 2, i.e. 1 standard
                                    deviation of Gaussian kernel = 500 base pairs. Cannot be <
                                    0.2. (default = 2)
                                </h6>
                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('dmrcate_optional_setting').style.display='none';JavaScript:dmrcate_radio(macs_g.value,macs_s.value,macs_bw.value,macs_p.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('dmrcate_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_dmrcate"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_DMRCate" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Peters, T. J., Buckley, M. J., Statham, A. L., Pidsley, R., Samaras, K., Lord, R. V., ... & Molloy, P. L. (2015). De novo identification of differentially methylated regions in the human genome. Epigenetics & chromatin, 8(1), 6.
                </div>
            </div>
            <!------------------------Bumphunter (MACS2)-------------------------------------------------------------->
            <div id="side_right_12" class="side_right" style="display:none">
                <s:form action="Bumphunter" id="Tools_bumphunter " enctype="multipart/form-data"
                        method="post" onsubmit="return searchData('Tools_bumphunter','btn_bumphunter','wait_bumphunter');">
                    <div class="link" onclick="JavaScript:bumphunter_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right12" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down12" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_bumphunter" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="Bumphunter_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetbum_file" id="input_exprSetbum_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_bumphunter" class="fileField" id="fileField_bum_exp" onchange="return (fileChange(this,'input_exprSetbum_file')&&checkFileExt(this.value,'input_exprSetbum_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetbum_file" id="input_sampleSheetbum_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_bumphunter" class="fileField" id="fileField_bum_sam" onchange="return (fileChange(this,'input_sampleSheetbum_file' )&& checkFileExt(this.value,'input_sampleSheetbum_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                    </div>
                    <div class="link" onclick="JavaScript:bumphunter_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right13" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down13" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_bumphunter" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_bumphunter" id="optionalParameters_default_bumphunter"
                                   class="optionalParameters_default" value="1" checked="true"
                                   onclick="document.getElementById('bumphunter_optional_setting').style.display='none'"/>default&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_bumphunter" id="optionalParameters_set_bumphunter"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('bumphunter_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="bumphunter_radio" class="radio_text"></div>
                        </div>
                        <div id="bumphunter_optional_setting" class="inputOption_setting" style="display:none">
                            <div id="bumphunter_optional_setting_center" class="inputOption_setting_center"
                                 style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" id="minProbes" name="minProbes" value="7" class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>
                                adjPvalDmr
                                <input type="text" id="adjPvalDmr" name="adjPvalDmr" value="0.05" class="input_setting_text"/>
                                <h6>This is the significance threshold for including DMRs in
                                    the final DMR list. (default = 0.05)
                                </h6>
                                maxGap
                                <input type="text" id="maxGap" name="maxGap" value="300" class="input_setting_text"/>
                                <h6>The maximum length for a DMR should be detected, regions
                                    longer then this would be discarded. (default = 300)
                                </h6>
                                cutoff
                                <input type="text" id="cutoff" name="cutoff" value="NULL" class="input_setting_text"/>
                                <h6>A numeric value. Values of the estimate of the genomic
                                    profile above the cutoff or below the negative of the cutoff
                                    will be used as candidate regions. It is possible to give two
                                    separate values (upper and lower bounds). If one value is
                                    given, the lower bound is minus the value. (default = NULL)
                                </h6>
                                pickCutoff
                                <input type="text" id="pickCutoff" name="pickCutoff" value="TRUE" class="input_setting_text"/>
                                <h6>A bool value to indicate if bumphunter algorithm will
                                    automatically select the threshold of DMRs. If the value is
                                    TRUE, bumphunter will automatically generated 0.99 cutoff
                                    from permutation. If user think this threshold is not
                                    suitable, user may set their own cutoff here. (default =
                                    TRUE)
                                </h6>
                                smooth
                                <label class="checkbox-inline">
                                    <input type="radio" name="smooth" value="TRUE" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="smooth" value="FALSE">FALSE
                                </label><br>
                                <h6> A logical value. If TRUE the estimated profile will be
                                    smoothed with the smoother defined by 'smoothFunction'.
                                    (default = TRUE)
                                </h6>
                                smoothFunction
                                <label class="checkbox-inline">
                                    <input type="radio" name="smoothFunction" value="loessByCluster" checked>loessByCluster
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="smoothFunction" value="runmedByCluster">runmedByCluster
                                </label><br>
                                <h6> A function to be used for smoothing the estimate of the
                                    genomic profile. Two functions are provided by the package:
                                    'loessByCluster' and 'runmedByCluster'. (default =
                                    loessByCluster)
                                </h6>
                                useWeights
                                <label class="checkbox-inline">
                                    <input type="radio" name="useWeights" value="FALSE" checked>FALSE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="useWeights" value="TRUE">TRUE
                                </label><br>
                                <h6>A logical value. If 'TRUE' then the standard errors of the
                                    point-wise estimates of the profile function will be used as
                                    weights in the loess smoother 'loessByCluster'. If the
                                    'runmedByCluster' smoother is used this argument is ignored.
                                    (default = FALSE)
                                </h6>
                                permutations
                                <input type="text" id="permutations" name="permutations" value="NULL" class="input_setting_text"/>
                                <h6>
                                    is a matrix with columns providing indexes to be used to
                                    scramble the data and create a null distribution when
                                    'nullMethod' is set to permutations. If the bootstrap
                                    approach is used this argument is ignored. If this matrix is
                                    not supplied and 'B'>0 then these indexes are created using
                                    the function 'sample'. (default = NULL)

                                </h6>
                                B
                                <input type="text" id="B" name="B" value="250" class="input_setting_text"/>
                                <h6>An integer denoting the number of resamples to use when
                                    computing null distributions. If 'permutations' is supplied
                                    that defines the number of permutations/bootstraps and 'B' is
                                    ignored. (default = 250)
                                </h6>
                                nullMethod
                                <label class="checkbox-inline">
                                    <input type="radio" name="nullMethod" value="bootstrap" checked>bootstrap
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="nullMethod" value="permutation">permutation
                                </label><br>
                                <h6>
                                    Method used to generate null candidate regions, must be one
                                    of 'bootstrap' or 'permutation' (defaults to 'permutation').
                                    However, if covariates in addition to the outcome of interest
                                    are included in the design matrix (ncol(design)>2), the
                                    'permutation' approach is not recommended. See vignette and
                                    original paper for more information. (default = "bootstrap")
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('bumphunter_optional_setting').style.display='none';JavaScript:bumphunter_radio(arraytype.value,minProbes.value,adjPvalDmr.value,maxGap.value,cutoff.value,pickCutoff.value,smooth.value,useWeights.value,permutations.value,B.value,nullMethod.value);"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('bumphunter_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_bumphunter"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_bumphunter" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Jaffe, A. E., Murakami, P., Lee, H., Leek, J. T., Fallin, M. D., Feinberg, A. P., & Irizarry, R. A. (2012). Bump hunting to identify differentially methylated regions in epigenetic epidemiology studies. International journal of epidemiology, 41(1), 200-209.
                </div>
            </div>
            <!------------------------ProbeLasso(PeakSeq)-------------------------------------------------------------->
            <div id="side_right_13" class="side_right" style="display:none">
                <s:form action="Lasso" id="probeLasso_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('probeLasso_exe','btn_probeLasso','wait_probeLasso');">
                    <div class="link" onclick="JavaScript:probeLasso_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right16" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down16" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_probeLasso" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="ProbeLasso_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetpro_file" id="input_exprSetpro_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_lasso" class="fileField" id="fileField_pro_exp" onchange="return (fileChange(this,'input_exprSetpro_file')&&checkFileExt(this.value,'input_exprSetpro_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetpro_file" id="input_sampleSheetpro_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_lasso" class="fileField" id="fileField_pro_sam" onchange="return (fileChange(this,'input_sampleSheetpro_file' )&& checkFileExt(this.value,'input_sampleSheetpro_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1"> Choose microarray type is "450K" or "EPIC"</div>
                        <div class="blackdown_1">
                            <input type="radio" name="arraytype" value="450K" checked>450K&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="arraytype" value="EPIC">EPIC
                        </div>

                    </div>

                    <div class="link" onclick="JavaScript:probeLasso_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right17" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down17" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_probeLasso" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_probeLasso"
                                   id="optionalParameters_default_probeLasso" class="optionalParameters_default" value="1"
                                   checked="true"
                                   onclick="document.getElementById('probeLasso_optional_setting').style.display='none'"/>default&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_probeLasso" id="optionalParameters_set_probeLasso"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('probeLasso_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="probeLasso_radio" class="radio_text"></div>
                        </div>
                        <div id="probeLasso_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">
                                minProbes&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text"  name="minProbes" value="7" class="input_setting_text"/>
                                <h6>Threshold to filtering clusters with too few probes in it.
                                    After region detection,this method will only select DMRs contain
                                    more than minProbes to continue the program. (default= 7)</h6>

                                adjPvalDmr
                                <input type="text"  name="adjPvalDmr" value="0.05" class="input_setting_text"/>
                                <h6>This is the significance threshold for including DMRs in
                                    the final DMR list. If the finaly result of probolasso is null, maybe there is no probe show significant difference accroding the value.
                                    You can set the parameter higher ,such as 0.1 or more. (default = 0.05)
                                </h6>

                                meanLassoRadius
                                <input type="text" id="meanLassoRadius" name="meanLassoRadius" value="375" class="input_setting_text"/>
                                <h6> Radius around each DMP to detect DMR. (default = 375)</h6>
                                minDmrSep
                                <input type="text" id="minDmrSep" name="minDmrSep" value="1000" class="input_setting_text"/>
                                <h6>The minimum seperation (bp) between neighbouring DMRs.
                                    (default = 1000.)
                                </h6>
                                minDmrSize
                                <input type="text" id="minDmrSize" name="minDmrSize" value="50" class="input_setting_text"/>
                                <h6> The minimum DMR size (bp). (default = 50)
                                </h6>
                                adjPvalProbe
                                <input type="text" id="adjPvalProbe" name="adjPvalProbe" value="0.05" class="input_setting_text"/>
                                <h6>The minimum threshold of significance for probes to be
                                    includede in DMRs. (default = 0.05)
                                </h6>
                                PDFplot
                                <label class="checkbox-inline">
                                    <input type="radio" name="PDFplot" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="PDFplot" value="F">FALSE
                                </label><br>
                                <h6> If PDFplot would be generated and save in resultsDir.
                                    (default = TRUE)
                                </h6>
                                Rplot
                                <label class="checkbox-inline">
                                    <input type="radio" name="Rplot" value="T" checked>TRUE
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="checkbox-inline">
                                    <input type="radio" name="Rplot" value="F">FALSE
                                </label><br>
                                <h6>If Rplot would be generated and save in resultsDir. Note if
                                    you are doing analysis on a server remotely, please make sure
                                    the server could connect your local graph applications. (For
                                    example X11 for linux.) (default = TRUE)
                                </h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('probeLasso_optional_setting').style.display='none';JavaScript:probeLasso_radio();"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('probeLasso_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_peakseq"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_probeLasso" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Butcher, L. M., & Beck, S. (2015). Probe Lasso: a novel method to rope in differentially methylated regions with 450K DNA methylation data. Methods, 72, 21-28.
                </div>
            </div>
            <!------------------------selqm(PeakRanger)-------------------------------------------------------------->
            <div id="side_right_14" class="side_right" style="display:none">
                <s:form action="Seqlm" id="seqlm_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('seqlm_exe','btn_seqlm','wait_seqlm');">
                    <div class="link" onclick="JavaScript:seqlm_option_ne();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right18" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down18" style="display:block"></div>
                        Necessary parameters
                    </div>
                    <div id="necessary_center_seqlm" class="necessary_center" style="display:block">
                        <div class="blacktop_1" id="seqlm_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetseq_file" id="input_exprSetseq_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_seqlm" class="fileField" id="fileField_seq_exp" onchange="return (fileChange(this,'input_exprSetseq_file')&&checkFileExt(this.value,'input_exprSetseq_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetseq_file" id="input_sampleSheetseq_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_seqlm" class="fileField" id="fileField_seq_sam" onchange="return (fileChange(this,'input_sampleSheetseq_file' )&& checkFileExt(this.value,'input_sampleSheetseq_file'))" />
                            </div>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:seqlm_option_op();" style="cursor:hand;">
                        <div class="arrow-right" id="arrow-right19" style="display:none"></div>
                        <div class="arrow-down" id="arrow-down19" style="display:block"></div>
                        Optional parameters
                    </div>
                    <div id="optional_center_seqlm" class="optional_center" style="display:block">
                        <div class="blacktop_1">optional parameters</div>
                        <div class="blackdown_1">
                            <input type="radio" name="optionalParameters_seqlm"
                                   id="optionalParameters_default_seqlm" class="optionalParameters_default" value="1"
                                   checked="true"
                                   onclick="document.getElementById('seqlm_optional_setting').style.display='none'"/>default&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="optionalParameters_seqlm" id="optionalParameters_set_seqlm"
                                   class="optionalParameters_set" value="2"
                                   onclick="document.getElementById('seqlm_optional_setting').style.display='block'"/>set
                            the parameters by yourself
                            <div id="seqlm_radio" class="radio_text"></div>
                        </div>
                        <div id="seqlm_optional_setting" class="inputOption_setting" style="display:none">
                            <div class="inputOption_setting_center" style="overflow-y:scroll;">

                                max_block_length
                                <input type="text"  name="max_block_length" value="50" class="input_setting_text"/>
                                <h6> maximal length of the block we are searching. This is
                                    used to speed up computation.default=50.
                                </h6>

                                max_dist
                                <input type="text"  name="max_dist" value="1000" class="input_setting_text"/>
                                <h6>maximal genomic distance between the sites to be considered
                                    the same region.default=1000.
                                </h6>

                                expand
                                <input type="text"  name="expand" value="100" class="input_setting_text"/>
                                <h6>number of basepairs to extend the region on plot</h6>

                                width
                                <input type="text"  name="width" value="8" class="input_setting_text"/>
                                <h6>picture width in inches</h6>

                                height
                                <input type="text"  name="height" value="5" class="input_setting_text"/>
                                <h6>picture height in inches</h6>

                                dpi
                                <input type="text"  name="dpi" value="100" class="input_setting_text"/>
                                <h6>dots per inch, to calibrate the picture size in pixels</h6>

                                main
                                <input type="text"  name="main" value="seqlm results" class="input_setting_text"/>
                                <h6>title for the report</h6>

                                <input type="button" class="btn_submit" value="submit"
                                       onclick="document.getElementById('seqlm_optional_setting').style.display='none';JavaScript:seqlm_radio();"/>
                                <input type="button" class="btn_cancel" value="cancel"
                                       onclick="document.getElementById('seqlm_optional_setting').style.display='none';"/>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Execute" class="Execute_btn" id="btn_seqlm"/><s:fielderror
                        fieldName="check1" cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_seqlm" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait.You may click the "Recent Jobs" at the top to
                        access your job's results after the processing.
                    </div>
                </s:form>
                <div id="detail_text_13" class="detail_tip_demo" style="display:none" >
                    You can view the HTML report <a href="./htmlReport/seqlm_demo/index.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
                </div>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Kolde, R., Märtens, K., Lokk, K., Laur, S., & Vilo, J. (2016). seqlm: an MDL based method for identifying differentially methylated regions in high density methylation array data. Bioinformatics, 32(17), 2604-2610.                </div>
            </div>
            <!-------------------------------------batch----------------------------------->
            <div class="side_right" id="side_right_16" style="display:none;">
                <div class="link" onclick="JavaScript:sva_option_ne();" style="cursor:hand;">
                    <div class="arrow-down" id="arrow-down65" style="display:block"></div>
                    <div class="arrow-right" id="arrow-right65" style="display:none"></div>
                    Necessary parameter
                </div>
                <s:form action="batch" id="SVA_exe" enctype="multipart/form-data" method="post"
                        onsubmit="return searchData('SVA_exe','btn_SVA','wait_SVA')">
                    <div class="necessary_center" id="necessary_center_sva()" style="display:block">
                        <div class="blacktop_1" id="sva_test">Please input the DNA methylation beta values or M values matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_exprSetsva_file" id="input_exprSetsva_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_sva" class="fileField" id="fileField_sva_exp" onchange="return (fileChange(this,'input_exprSetsva_file')&&checkFileExt(this.value,'input_exprSetsva_file'))">
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the SampleSheet to generate contrast matrix
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="The sample sheet is a CSV (comma-separated) fle containing one line per sample, with
                        a number of columns describing each sample"></div>
                        </div>
                        <div class="blackdown_1">
                            <div class="file-box">
                                <input type="text" name="input_sampleSheetsva_file" id="input_sampleSheetsva_file" class="input_text" />
                                <input type="button" class="btn1" value="Choose File" />
                                <input type="file" name="fileField_sva" class="fileField" id="fileField_sva_sam" onchange="return (fileChange(this,'input_sampleSheetsva_file' )&& checkFileExt(this.value,'input_sampleSheetsva_file'))" />
                            </div>
                        </div>
                        <div class="blacktop_1">Please input the batch covariate (only one batch allowed)
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="ComBat allows users to adjust for batch effects in datasets where the batch covariate is known."></div>
                        </div>
                        <div class="blackdown_1">
                            <input type="text" class="input_setting_text" name="batch" value="Sentrix_ID"/><br>
                        </div>
                    </div>

                    <div class="link" onclick="JavaScript:nece_vis_show_sva_op();" style="cursor:hand;margin-top: 10px">
                        <div class="arrow-down" id="arrow-down58" style="display:block"></div>
                        <div class="arrow-right" id="arrow-right58" style="display:none"></div>
                        Visualization
                    </div>

                    <div id="vis_center_sva" class="necessary_center" style="display:block"
                         style="overflow-y:scroll; ">
                        <div class="blacktop_1"> Choose which plot do you want to generate in your result.
                            <div class="tip_out"><img class="tip"  src="./img/tip.png"
                                                      data-container="body" data-toggle="popover" data-placement="top"
                                                      data-content="get a heatmap indicating effect of factors on original data set"></div>
                        </div>
                        <div class="blackdown_1">
                            <input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" /> heatmap
                            <input type="radio" name="plot" class="optionalParameters_set" value="2" />none
                        </div>

                    </div>
                    <input type="submit" value="Execute" class="Execute_btn" id="btn_SVA"/><s:fielderror fieldName="check1"
                                                                                                         cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>
                    <div id="wait_SVA" class="Upload_wait_div" style="display:none;">
                        <img src="./img/wait.gif" class="Upload_wait"/>
                        Uploading and processing your file,please wait...
                    </div>
                </s:form>
                <span style="color:#666666;font-size:20px;">Ref:</span> <br>
                <div class="citation">
                    Johnson, W. Evan, Cheng Li, and Ariel Rabinovic. "Adjusting batch effects in microarray expression data using empirical Bayes methods." Biostatistics 8.1 (2007): 118-127.
                </div>

                <!--
          <div id="detail_text_2" class="detail_tip" style="display:none" >
              If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.
              You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
          </div>
          <div id="detail_2" class="inputOption_setting_de" style="display:none;">
              <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                  ${stdoutlist}<br>
                  <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
              </div>
              <div id="detail_text_5" class="detail_tip_demo" style="display:none" >
                  You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.
              </div>
              <div id="detail_5" class="inputOption_setting_de" style="display:none;">
                  <div class="inputOption_setting_center_de" style="overflow-y:scroll;">
                      ${stdoutlist}<br>
                      <input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>
                  </div>
              </div>
          </div>
          -->
            </div>

            <%--<!-------------------------------------pca----------------------------------->
            <%--<div class="side_right" id="side_right_15" style="display:none;">--%>
                <%--<div class="link" onclick="JavaScript:nece_opt_show_PCA_ne();" style="cursor:hand;">--%>
                    <%--<div class="arrow-down" id="arrow-down7" style="display:block"></div>--%>
                    <%--<div class="arrow-right" id="arrow-right7" style="display:none"></div>--%>
                    <%--Necessary parameter--%>
                <%--</div>--%>
                <%--<s:form action="PCA" id="PCA_exe" enctype="multipart/form-data" method="post"--%>
                        <%--onsubmit="return searchData('PCA_exe','btn_PCA','wait_PCA')">--%>
                    <%--<div class="necessary_center" id="necessary_center_PCA" style="display:block">--%>
                        <%--<div class="blacktop_1">--%>
                            <%--Please input the DNA methylation beta values or M values matrix file--%>
                            <%--<div class="tip_out"><img class="tip"  src="./img/tip.png"--%>
                                                      <%--data-container="body" data-toggle="popover" data-placement="top"--%>
                                                      <%--data-content="Please ensure the uploaded file be in .csv format.You can input 'DNA methylation beta values or M values matrix.csv', which is the output file of preprocessing step. You can also input your own DNA methylation beta values or M values matrix(.csv)"></div>--%>
                            <%--<s:fielderror fieldName="input_pca" cssStyle="color:red;float:right;margin-top:0px;"/>--%>
                        <%--</div>--%>
                        <%--<div class="blackdown_1">--%>
                            <%--<div class="file-box">--%>
                                <%--<input type="text" name="input_pca" class="input_text" value="DNA methylation beta values or M values matrix.csv" id="input_pca"/>--%>
                                <%--<input type="button" class="btn1" value="Choose File" />--%>
                                <%--<input type="file" name="PCA_file" class="fileField"--%>
                                       <%--onchange="return( fileChange(this,'input_pca')&& checkFileExt(this.value,'input_pca'))"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="link" onclick="JavaScript:nece_vis_show_PCA_op();" style="cursor:hand;margin-top: 10px">--%>
                        <%--<div class="arrow-down" id="arrow-down58" style="display:block"></div>--%>
                        <%--<div class="arrow-right" id="arrow-right58" style="display:none"></div>--%>
                        <%--Visualization--%>
                    <%--</div>--%>
                    <%--<div id="vis_center_PCA" class="necessary_center" style="display:block"--%>
                         <%--style="overflow-y:scroll; ">--%>
                        <%--<div class="blacktop_1"> Choose which plot do you want to generate in your result.</div>--%>
                        <%--<div class="blackdown_1">--%>
                            <%--<input type="radio" name="plot" class="optionalParameters_default" value="1" checked="true" />X-Y scheme--%>

                            <%--<input type="radio" name="plot" class="optionalParameters_set" value="2" />none--%>
                        <%--</div>--%>
                        <%--<!----%>
                        <%--<div id="xy_option" class="inputOption_setting" style="display:none">--%>
                            <%--<div id="xy_option_center" class="inputOption_setting_center">--%>
                                <%--number&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <%--<h6>maximum number of  top KEGG pathways to list.For all terms or all pathways, set ‘number=Inf’.default=20.</h6>--%>
                                <%--<input type="text" class="input_setting_text" name="number"--%>
                                       <%--value="20"/><br>--%>

                                <%--<input type="button" class="btn_submit" value="submit"--%>
                                       <%--onclick="document.getElementById('xy_option').style.display='none';"/>--%>
                                <%--<input type="button" class="btn_cancel" value="cancel"--%>
                                       <%--onclick="document.getElementById('xy_option').style.display='none';"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%---->--%>
                    <%--</div>--%>
                    <%--<input type="submit" value="Execute" class="Execute_btn" id="btn_PCA"/><s:fielderror fieldName="check1"--%>
                                                                                                         <%--cssStyle="color:#57779e;float:left;margin-top:0px;margin-right:10px;"/>--%>
                    <%--<div id="wait_PCA" class="Upload_wait_div" style="display:none;">--%>
                        <%--<img src="./img/wait.gif" class="Upload_wait"/>--%>
                        <%--Uploading and processing your file,please wait...--%>
                    <%--</div>--%>
                <%--</s:form>--%>

                <%--<!----%>
          <%--<div id="detail_text_2" class="detail_tip" style="display:none" >--%>
              <%--If you have questions about the results or if you want to get detail information about the finished operation,please <a href="JavaScript:operation_detail(3);" style="text-decoration: none;color:#666666">click here</a>.--%>
              <%--You can view the HTML report <a href="./htmlReport/go/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.--%>
          <%--</div>--%>
          <%--<div id="detail_2" class="inputOption_setting_de" style="display:none;">--%>
              <%--<div class="inputOption_setting_center_de" style="overflow-y:scroll;">--%>
                  <%--${stdoutlist}<br>--%>
                  <%--<input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>--%>
              <%--</div>--%>
              <%--<div id="detail_text_5" class="detail_tip_demo" style="display:none" >--%>
                  <%--You can view the HTML report <a href="./htmlReport/go_demo/GenomeOntology.html" target="_blank" style="text-decoration: none;color:#666666">click here</a>.--%>
              <%--</div>--%>
              <%--<div id="detail_5" class="inputOption_setting_de" style="display:none;">--%>
                  <%--<div class="inputOption_setting_center_de" style="overflow-y:scroll;">--%>
                      <%--${stdoutlist}<br>--%>
                      <%--<input type="button" value="close" class="btn_cancel" onclick="document.getElementById('detail_2').style.display='none'"/>--%>
                  <%--</div>--%>
              <%--</div>--%>
          <%--</div>--%>
          <%---->--%>
            <%--</div>--%>

        </div>
    </div>
    <div id="foot">
        Copyright © 2018 - CSU-Bioinformatics Group | All Rights Reserved
    </div>
</div>
</body>
<script>
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</html>
