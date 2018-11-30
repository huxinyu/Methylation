/**
 * Created by USER on 2017/4/26.
 */
function nece_vis_show_GO_op(){
    if (document.getElementById("vis_center_GO").style.display == 'block') {
        document.getElementById("vis_center_GO").style.display = "none";
        document.getElementById("arrow-down49").style.display = "none";
        document.getElementById("arrow-right49").style.display = "block";
    }
    else {
        document.getElementById("vis_center_GO").style.display = "block";
        document.getElementById("arrow-down49").style.display = "block";
        document.getElementById("arrow-right49").style.display = "none";
    }
}

function nece_vis_show_KEGG_op(){
    if (document.getElementById("vis_center_KEGG").style.display == 'block') {
        document.getElementById("vis_center_KEGG").style.display = "none";
        document.getElementById("arrow-down48").style.display = "none";
        document.getElementById("arrow-right48").style.display = "block";
    }
    else {
        document.getElementById("vis_center_KEGG").style.display = "block";
        document.getElementById("arrow-down48").style.display = "block";
        document.getElementById("arrow-right48").style.display = "none";
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

function nece_vis_show_Cluster1_op(){
    if (document.getElementById("vis_center_Cluster1").style.display == 'block') {
        document.getElementById("vis_center_Cluster1").style.display = "none";
        document.getElementById("arrow-down59").style.display = "none";
        document.getElementById("arrow-right59").style.display = "block";
    }
    else {
        document.getElementById("vis_center_Cluster1").style.display = "block";
        document.getElementById("arrow-down59").style.display = "block";
        document.getElementById("arrow-right59").style.display = "none";
    }
}

function nece_vis_show_Cluster2_op(){
    if (document.getElementById("vis_center_Cluster2").style.display == 'block') {
        document.getElementById("vis_center_Cluster2").style.display = "none";
        document.getElementById("arrow-down60").style.display = "none";
        document.getElementById("arrow-right60").style.display = "block";
    }
    else {
        document.getElementById("vis_center_Cluster2").style.display = "block";
        document.getElementById("arrow-down60").style.display = "block";
        document.getElementById("arrow-right60").style.display = "none";
    }
}
function nece_opt_show_HOMER_ne(){
    if(document.getElementById("necessary_center_HOMER").style.display=='block'){
        document.getElementById("necessary_center_HOMER").style.display="none";
        document.getElementById("arrow-down1").style.display="none";
        document.getElementById("arrow-right1").style.display="block";
    }
    else{
        document.getElementById("necessary_center_HOMER").style.display="block";
        document.getElementById("arrow-down1").style.display="block";
        document.getElementById("arrow-right1").style.display="none";
    }
}
function nece_opt_show_HOMER_op(){
    if(document.getElementById("optional_center_HOMER").style.display=='block'){
        document.getElementById("optional_center_HOMER").style.display="none";
        document.getElementById("arrow-down2").style.display="none";
        document.getElementById("arrow-right2").style.display="block";
    }
    else{
        document.getElementById("optional_center_HOMER").style.display="block";
        document.getElementById("arrow-down2").style.display="block";
        document.getElementById("arrow-right2").style.display="none";
    }
}


function nece_opt_show_GO_ne(){
    if(document.getElementById("necessary_center_GO").style.display=='block'){
        document.getElementById("necessary_center_GO").style.display="none";
        document.getElementById("arrow-down3").style.display="none";
        document.getElementById("arrow-right3").style.display="block";
    }
    else{
        document.getElementById("necessary_center_GO").style.display="block";
        document.getElementById("arrow-down3").style.display="block";
        document.getElementById("arrow-right3").style.display="none";
    }
}
function nece_opt_show_GO_op(){
    if(document.getElementById("optional_center_GO").style.display=='block'){
        document.getElementById("optional_center_GO").style.display="none";
        document.getElementById("arrow-down4").style.display="none";
        document.getElementById("arrow-right4").style.display="block";
    }
    else{
        document.getElementById("optional_center_GO").style.display="block";
        document.getElementById("arrow-down4").style.display="block";
        document.getElementById("arrow-right4").style.display="none";
    }
}

function nece_opt_show_KEGG_ne(){
    if(document.getElementById("necessary_center_KEGG").style.display=='block'){
        document.getElementById("necessary_center_KEGG").style.display="none";
        document.getElementById("arrow-down5").style.display="none";
        document.getElementById("arrow-right5").style.display="block";
    }
    else{
        document.getElementById("necessary_center_KEGG").style.display="block";
        document.getElementById("arrow-down5").style.display="block";
        document.getElementById("arrow-right5").style.display="none";
    }
}
function nece_opt_show_KEGG_op(){
    if(document.getElementById("optional_center_KEGG").style.display=='block'){
        document.getElementById("optional_center_KEGG").style.display="none";
        document.getElementById("arrow-down6").style.display="none";
        document.getElementById("arrow-right6").style.display="block";
    }
    else{
        document.getElementById("optional_center_KEGG").style.display="block";
        document.getElementById("arrow-down6").style.display="block";
        document.getElementById("arrow-right6").style.display="none";
    }
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

function nece_opt_show_Cluster1_ne(){
    if(document.getElementById("necessary_center_Cluster1").style.display=='block'){
        document.getElementById("necessary_center_Cluster1").style.display="none";
        document.getElementById("arrow-down9").style.display="none";
        document.getElementById("arrow-right9").style.display="block";
    }
    else{
        document.getElementById("necessary_center_Cluster1").style.display="block";
        document.getElementById("arrow-down9").style.display="block";
        document.getElementById("arrow-right9").style.display="none";
    }
}
function nece_opt_show_Cluster1_op(){
    if(document.getElementById("optional_center_Cluster1").style.display=='block'){
        document.getElementById("optional_center_Cluster1").style.display="none";
        document.getElementById("arrow-down10").style.display="none";
        document.getElementById("arrow-right10").style.display="block";
    }
    else{
        document.getElementById("optional_center_Cluster1").style.display="block";
        document.getElementById("arrow-down10").style.display="block";
        document.getElementById("arrow-right10").style.display="none";
    }
}
function nece_opt_show_Cluster2_ne(){
    if(document.getElementById("necessary_center_Cluster2").style.display=='block'){
        document.getElementById("necessary_center_Cluster2").style.display="none";
        document.getElementById("arrow-down11").style.display="none";
        document.getElementById("arrow-right11").style.display="block";
    }
    else{
        document.getElementById("necessary_center_Cluster2").style.display="block";
        document.getElementById("arrow-down11").style.display="block";
        document.getElementById("arrow-right11").style.display="none";
    }
}
function nece_opt_show_Cluster2_op(){
    if(document.getElementById("optional_center_Cluster2").style.display=='block'){
        document.getElementById("optional_center_Cluster2").style.display="none";
        document.getElementById("arrow-down12").style.display="none";
        document.getElementById("arrow-right12").style.display="block";
    }
    else{
        document.getElementById("optional_center_Cluster2").style.display="block";
        document.getElementById("arrow-down12").style.display="block";
        document.getElementById("arrow-right12").style.display="none";
    }
}

function GLAM2_radio(GLAM2_r,GLAM2_n,GLAM2_z,GLAM2_w,GLAM2_a,GLAM2_b,GLAM2_D,GLAM2_E,GLAM2_I,GLAM2_J,GLAM2_q,GLAM2_t,GLAM2_c,GLAM2_u,GLAM2_m,GLAM2_x,GLAM2_s){
    var div = document.getElementById("GLAM2_radio");
    div.innerHTML="(-r "+GLAM2_r+" -n "+GLAM2_n+" -z "+GLAM2_z+" -w "+GLAM2_w+" -a "+GLAM2_a+" -b "+GLAM2_b+" -D "+GLAM2_D+" -E "+GLAM2_E+" -I "+GLAM2_I+" -J "+GLAM2_J+" -q "+GLAM2_q+" -t "+GLAM2_t+" -c "+GLAM2_c+" -u "+GLAM2_u+" -m "+GLAM2_m+" -x "+GLAM2_x+" -s "+GLAM2_s+")";
    div.style.visibility="visible";
}
function GO_radio(gomo_text,gomo_dagr,GOMo_t,gomo_motifmeme,gomo_motifall,GOMo_shuffle,gomo_verbo){
    var div = document.getElementById("GO_radio");
    var text,dagr,meme,all;
    if(gomo_text==1){
        text="--text";
    }
    else{
        text="";
    }
    if(gomo_dagr==1){
        dagr="--dag";
    }
    else{
        dagr="";
    }
    if(gomo_motifmeme==1){
        meme="--motifs"
    }
    else{
        meme="";
    }
    if(gomo_motifall==1){
        all="--motif";
    }
    else{
        all="";
    }
    div.innerHTML="( "+text+" "+dagr+" -t "+meme+" "+GOMo_t+" "+all+" --shuffle_scores "+GOMo_shuffle+" --verbosity "+gomo_verbo+")";
    div.style.visibility="visible";
}
function operation_detail(id){
    document.getElementById("detail_"+id).style.display="block";
}
function mouseOver(){
    document.getElementById("login_menu").style.display="block";
}
function mouseOut(){
    document.getElementById("login_menu").style.display="none";
}
function fileChange(target,box){
    var filename;
    filename=target.files[0].value().substr(target.files[0].value().lastIndexOf('/')+1);
    alert(filename);
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
    else{
        document.getElementById(box).value=filename;
        return true;
    }
}
