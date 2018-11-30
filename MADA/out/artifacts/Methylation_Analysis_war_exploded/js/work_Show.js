/**
 * Created by Administrator on 2017/3/15 0015.
 */

    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","User.xml",false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML;



var nodeList=xmlDoc.getElementsByTagName("User");
for(var i=0;i<nodeList.length;i++){
    var accountExist=document.getElementsByTagName("account")[i].childNodes[0].nodeValue;
    if(account==accountExist){
        var nodeList_2=xmlDoc.getElementsByTagName("User")[i];
        var contents;
        for(var j=1;j<nodeList_2;j++){
            contents+=xmlDoc.getElementsByTagName("User")[i].childNodes[j].nodeValue;
        }
    }
}
//var contents=xmlDoc.getElementsByTagName("account")[0].childNodes[0].nodeValue;
document.getElementById("center_2").innerHTML=contents;