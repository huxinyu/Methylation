/**
 * Created by USER on 2017/4/26.
 */




function side_right_show(divId,count){
    for(var r=1;r<=count;r++){
        document.getElementById("side_right_"+r).style.display="none";
        document.getElementById("side_son_"+r).style.backgroundColor="#dadada";
        document.getElementById("side_son_"+r).style.color="#555555";
    }
    document.getElementById("side_son_"+divId).style.backgroundColor="#57779e";
    document.getElementById("side_son_"+divId).style.color="#ffffff";
    document.getElementById("side_right_"+divId).style.display="block";
}

function workflow_option(divId,total){
    for(var r=1;r<=total;r++){
        document.getElementById("workflowCustom_option_"+r).style.display="none";
    }
    document.getElementById("workflowCustom_option_"+divId).style.display="block";
}

function operation_detail(id){
    document.getElementById("detail_out"+id).style.display="block";
}

function fileChange(target,box) {
    var fileSize;
    var filemaxsize = 2048*1024;//1G

    fileSize = target.files[0].size;

    var size = fileSize / 1024;
    if(size>filemaxsize){
        alert("Upload files can not be larger than 2G!");
        document.getElementById(box).value="";
        target.value ="";
        return false;
    }
    if(size<=0){
        alert("Upload files can not be empty!");
        target.value ="";
        return false;
    }

}
function Demo_right(id){
    for(var i=1;i<=3;i++){
        document.getElementById("side_right_"+i).style.display='none';
        document.getElementById("side_son_"+i).style.backgroundColor="#dadada";
        document.getElementById("side_son_"+i).style.color="#555555";
    }
    document.getElementById("side_right_"+id).style.display='block';
    document.getElementById("side_son_"+1).style.backgroundColor="#57779e";
    document.getElementById("side_son_"+1).style.color="#ffffff";
}