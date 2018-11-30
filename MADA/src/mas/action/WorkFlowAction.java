package mas.action;

import mas.*;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

/**
 * Created by Administrator on 2016/4/15 0015.
 */
public class WorkFlowAction extends ActionSupport{
    private String workflowCustom_zip;
    private String workflow_methValue;
    private int workflowCustom_mapping;
    private int workflowCustom_peak;
    private String workflowCustom_path;
    private String arraytype_bmiq,arraytype_pbc,arraytype_swan,arraytype_fn,arraytype_ill,arraytype_noob,arraytype_sqn,arraytype_limma,arraytype_dmrcate,arraytype_bum,arraytype_las,type;
    private String detPcut,filterSNPs,filterXY,filterCRO;
    private int workflowCustom_option_bmiq;
    private int workflowCustom_option_pbc;
    private int workflowCustom_option_swan;
    private int workflowCustom_option_FN;
    private int workflowCustom_option_ILL;
    private int workflowCustom_option_Noob;
    private int workflowCustom_option_SQN;

    private int workflowCustom_option_limma;
    private int workflowCustom_option_dmpFinder;
    private int workflowCustom_option_samr;
    private String arraytype_dmpfinder,arraytype_samr;

    private int workflowCustom_option_dmrcate;
    private int workflowCustom_option_bumphunter;
    private int workflowCustom_option_lasso;
    private int workflowCustom_option_seqlm;
 //tools的可选参数

    private String autoimpute2,filterMultiHit2;
    private String autoimpute1,filterMultiHit1,plotBMIQ,cores;
    private String nPCs,sex,bgCorr,dyeCorr1,keepCN,verbose1;
    private String bg_correct;
    private String offset,dyeCorr,verbose;
    private String fixOutliers,removeBadSamples,badSampleCutoff,quantileNormalize,stratified,mergeManifest;
    private String proportion,trend,robust;

    private String rmSNPCH,dist,mafcut,lambda,C;
    private String minProbes,adjPvalDmr,maxGap,cutoff,pickCutoff,smooth,smoothFunction,useWeights,permutations,B,nullMethod;
    private String minProbes1,adjPvalDmr1,meanLassoRadius,minDmrSep,minDmrSize,adjPvalProbe,PDFplot,Rplot;
    private String max_block_length,max_dist,expand,width,height,dpi,main;
//    private String qCutoff,shrinkVar;
    private String adjPval;
    private String adjPval_dmpfinder;
    private String adjPval_samr;

    private String flag,flag_validate,flag_command;

    private List<File> fileField_workflow;
    private List<String> fileField_workflowFileName;

    private String stdoutlist_mapping,stdoutlist_peak;

    private int workflowCustom_cor_limma;
    private String cor1,cor1_type;

    public int getWorkflowCustom_option_samr() {
        return workflowCustom_option_samr;
    }

    public void setWorkflowCustom_option_samr(int workflowCustom_option_samr) {
        this.workflowCustom_option_samr = workflowCustom_option_samr;
    }

    public String getArraytype_dmpfinder() {
        return arraytype_dmpfinder;
    }

    public void setArraytype_dmpfinder(String arraytype_dmpfinder) {
        this.arraytype_dmpfinder = arraytype_dmpfinder;
    }

    public String getArraytype_samr() {
        return arraytype_samr;
    }

    public void setArraytype_samr(String arraytype_samr) {
        this.arraytype_samr = arraytype_samr;
    }

    public String getAdjPval_dmpfinder() {
        return adjPval_dmpfinder;
    }

    public void setAdjPval_dmpfinder(String adjPval_dmpfinder) {
        this.adjPval_dmpfinder = adjPval_dmpfinder;
    }

    public String getAdjPval_samr() {
        return adjPval_samr;
    }

    public void setAdjPval_samr(String adjPval_samr) {
        this.adjPval_samr = adjPval_samr;
    }

    public String getArraytype_swan() {
        return arraytype_swan;
    }

    public void setArraytype_swan(String arraytype_swan) {
        this.arraytype_swan = arraytype_swan;
    }

    public String getArraytype_fn() {
        return arraytype_fn;
    }

    public void setArraytype_fn(String arraytype_fn) {
        this.arraytype_fn = arraytype_fn;
    }

    public String getArraytype_ill() {
        return arraytype_ill;
    }

    public void setArraytype_ill(String arraytype_ill) {
        this.arraytype_ill = arraytype_ill;
    }

    public String getArraytype_noob() {
        return arraytype_noob;
    }

    public void setArraytype_noob(String arraytype_noob) {
        this.arraytype_noob = arraytype_noob;
    }

    public String getArraytype_sqn() {
        return arraytype_sqn;
    }

    public void setArraytype_sqn(String arraytype_sqn) {
        this.arraytype_sqn = arraytype_sqn;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getWorkflowCustom_option_dmpFinder() {
        return workflowCustom_option_dmpFinder;
    }

    public void setWorkflowCustom_option_dmpFinder(int workflowCustom_option_dmpFinder) {
        this.workflowCustom_option_dmpFinder = workflowCustom_option_dmpFinder;
    }

    public String getAdjPval() {
        return adjPval;
    }

    public void setAdjPval(String adjPval) {
        this.adjPval = adjPval;
    }

    public int getWorkflowCustom_cor_limma() {
        return workflowCustom_cor_limma;
    }

    public void setWorkflowCustom_cor_limma(int workflowCustom_cor_limma) {
        this.workflowCustom_cor_limma = workflowCustom_cor_limma;
    }

    public String getCor1() {
        return cor1;
    }

    public void setCor1(String cor1) {
        this.cor1 = cor1;
    }

    public String getCor1_type() {
        return cor1_type;
    }

    public void setCor1_type(String cor1_type) {
        this.cor1_type = cor1_type;
    }

    public String getFilterCRO() {
        return filterCRO;
    }

    public void setFilterCRO(String filterCRO) {
        this.filterCRO = filterCRO;
    }

    public String getWorkflowCustom_zip() {
        return workflowCustom_zip;
    }

    public void setWorkflowCustom_zip(String workflowCustom_zip) {
        this.workflowCustom_zip = workflowCustom_zip;
    }

    public String getWorkflow_methValue() {
        return workflow_methValue;
    }

    public void setWorkflow_methValue(String workflow_methValue) {
        this.workflow_methValue = workflow_methValue;
    }

    public int getWorkflowCustom_mapping() {
        return workflowCustom_mapping;
    }

    public void setWorkflowCustom_mapping(int workflowCustom_mapping) {
        this.workflowCustom_mapping = workflowCustom_mapping;
    }

    public int getWorkflowCustom_peak() {
        return workflowCustom_peak;
    }

    public void setWorkflowCustom_peak(int workflowCustom_peak) {
        this.workflowCustom_peak = workflowCustom_peak;
    }

    public String getWorkflowCustom_path() {
        return workflowCustom_path;
    }

    public void setWorkflowCustom_path(String workflowCustom_path) {
        this.workflowCustom_path = workflowCustom_path;
    }

    public String getArraytype_bmiq() {
        return arraytype_bmiq;
    }

    public void setArraytype_bmiq(String arraytype_bmiq) {
        this.arraytype_bmiq = arraytype_bmiq;
    }

    public String getArraytype_pbc() {
        return arraytype_pbc;
    }

    public void setArraytype_pbc(String arraytype_pbc) {
        this.arraytype_pbc = arraytype_pbc;
    }

    public String getArraytype_limma() {
        return arraytype_limma;
    }

    public void setArraytype_limma(String arraytype_limma) {
        this.arraytype_limma = arraytype_limma;
    }

    public String getArraytype_dmrcate() {
        return arraytype_dmrcate;
    }

    public void setArraytype_dmrcate(String arraytype_dmrcate) {
        this.arraytype_dmrcate = arraytype_dmrcate;
    }

    public String getArraytype_bum() {
        return arraytype_bum;
    }

    public void setArraytype_bum(String arraytype_bum) {
        this.arraytype_bum = arraytype_bum;
    }

    public String getArraytype_las() {
        return arraytype_las;
    }

    public void setArraytype_las(String arraytype_las) {
        this.arraytype_las = arraytype_las;
    }

    public String getDetPcut() {
        return detPcut;
    }

    public void setDetPcut(String detPcut) {
        this.detPcut = detPcut;
    }

    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public String getFilterXY() {
        return filterXY;
    }

    public void setFilterXY(String filterXY) {
        this.filterXY = filterXY;
    }

    public int getWorkflowCustom_option_bmiq() {
        return workflowCustom_option_bmiq;
    }

    public void setWorkflowCustom_option_bmiq(int workflowCustom_option_bmiq) {
        this.workflowCustom_option_bmiq = workflowCustom_option_bmiq;
    }

    public int getWorkflowCustom_option_pbc() {
        return workflowCustom_option_pbc;
    }

    public void setWorkflowCustom_option_pbc(int workflowCustom_option_pbc) {
        this.workflowCustom_option_pbc = workflowCustom_option_pbc;
    }

    public int getWorkflowCustom_option_swan() {
        return workflowCustom_option_swan;
    }

    public void setWorkflowCustom_option_swan(int workflowCustom_option_swan) {
        this.workflowCustom_option_swan = workflowCustom_option_swan;
    }

    public int getWorkflowCustom_option_FN() {
        return workflowCustom_option_FN;
    }

    public void setWorkflowCustom_option_FN(int workflowCustom_option_FN) {
        this.workflowCustom_option_FN = workflowCustom_option_FN;
    }

    public int getWorkflowCustom_option_ILL() {
        return workflowCustom_option_ILL;
    }

    public void setWorkflowCustom_option_ILL(int workflowCustom_option_ILL) {
        this.workflowCustom_option_ILL = workflowCustom_option_ILL;
    }

    public int getWorkflowCustom_option_Noob() {
        return workflowCustom_option_Noob;
    }

    public void setWorkflowCustom_option_Noob(int workflowCustom_option_Noob) {
        this.workflowCustom_option_Noob = workflowCustom_option_Noob;
    }

    public int getWorkflowCustom_option_SQN() {
        return workflowCustom_option_SQN;
    }

    public void setWorkflowCustom_option_SQN(int workflowCustom_option_SQN) {
        this.workflowCustom_option_SQN = workflowCustom_option_SQN;
    }

    public int getWorkflowCustom_option_limma() {
        return workflowCustom_option_limma;
    }

    public void setWorkflowCustom_option_limma(int workflowCustom_option_limma) {
        this.workflowCustom_option_limma = workflowCustom_option_limma;
    }

    public int getWorkflowCustom_option_dmrcate() {
        return workflowCustom_option_dmrcate;
    }

    public void setWorkflowCustom_option_dmrcate(int workflowCustom_option_dmrcate) {
        this.workflowCustom_option_dmrcate = workflowCustom_option_dmrcate;
    }

    public int getWorkflowCustom_option_bumphunter() {
        return workflowCustom_option_bumphunter;
    }

    public void setWorkflowCustom_option_bumphunter(int workflowCustom_option_bumphunter) {
        this.workflowCustom_option_bumphunter = workflowCustom_option_bumphunter;
    }

    public int getWorkflowCustom_option_lasso() {
        return workflowCustom_option_lasso;
    }

    public void setWorkflowCustom_option_lasso(int workflowCustom_option_lasso) {
        this.workflowCustom_option_lasso = workflowCustom_option_lasso;
    }

    public int getWorkflowCustom_option_seqlm() {
        return workflowCustom_option_seqlm;
    }

    public void setWorkflowCustom_option_seqlm(int workflowCustom_option_seqlm) {
        this.workflowCustom_option_seqlm = workflowCustom_option_seqlm;
    }

    public String getAutoimpute2() {
        return autoimpute2;
    }

    public void setAutoimpute2(String autoimpute2) {
        this.autoimpute2 = autoimpute2;
    }


    public String getFilterMultiHit2() {
        return filterMultiHit2;
    }

    public void setFilterMultiHit2(String filterMultiHit2) {
        this.filterMultiHit2 = filterMultiHit2;
    }

    public String getAutoimpute1() {
        return autoimpute1;
    }

    public void setAutoimpute1(String autoimpute1) {
        this.autoimpute1 = autoimpute1;
    }



    public String getFilterMultiHit1() {
        return filterMultiHit1;
    }

    public void setFilterMultiHit1(String filterMultiHit1) {
        this.filterMultiHit1 = filterMultiHit1;
    }

    public String getPlotBMIQ() {
        return plotBMIQ;
    }

    public void setPlotBMIQ(String plotBMIQ) {
        this.plotBMIQ = plotBMIQ;
    }

    public String getCores() {
        return cores;
    }

    public void setCores(String cores) {
        this.cores = cores;
    }

    public String getnPCs() {
        return nPCs;
    }

    public void setnPCs(String nPCs) {
        this.nPCs = nPCs;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBgCorr() {
        return bgCorr;
    }

    public void setBgCorr(String bgCorr) {
        this.bgCorr = bgCorr;
    }

    public String getDyeCorr1() {
        return dyeCorr1;
    }

    public void setDyeCorr1(String dyeCorr1) {
        this.dyeCorr1 = dyeCorr1;
    }

    public String getKeepCN() {
        return keepCN;
    }

    public void setKeepCN(String keepCN) {
        this.keepCN = keepCN;
    }

    public String getVerbose1() {
        return verbose1;
    }

    public void setVerbose1(String verbose1) {
        this.verbose1 = verbose1;
    }

    public String getBg_correct() {
        return bg_correct;
    }

    public void setBg_correct(String bg_correct) {
        this.bg_correct = bg_correct;
    }

    public String getOffset() {
        return offset;
    }

    public void setOffset(String offset) {
        this.offset = offset;
    }

    public String getDyeCorr() {
        return dyeCorr;
    }

    public void setDyeCorr(String dyeCorr) {
        this.dyeCorr = dyeCorr;
    }

    public String getVerbose() {
        return verbose;
    }

    public void setVerbose(String verbose) {
        this.verbose = verbose;
    }

    public String getFixOutliers() {
        return fixOutliers;
    }

    public void setFixOutliers(String fixOutliers) {
        this.fixOutliers = fixOutliers;
    }

    public String getRemoveBadSamples() {
        return removeBadSamples;
    }

    public void setRemoveBadSamples(String removeBadSamples) {
        this.removeBadSamples = removeBadSamples;
    }

    public String getBadSampleCutoff() {
        return badSampleCutoff;
    }

    public void setBadSampleCutoff(String badSampleCutoff) {
        this.badSampleCutoff = badSampleCutoff;
    }

    public String getQuantileNormalize() {
        return quantileNormalize;
    }

    public void setQuantileNormalize(String quantileNormalize) {
        this.quantileNormalize = quantileNormalize;
    }

    public String getStratified() {
        return stratified;
    }

    public void setStratified(String stratified) {
        this.stratified = stratified;
    }

    public String getMergeManifest() {
        return mergeManifest;
    }

    public void setMergeManifest(String mergeManifest) {
        this.mergeManifest = mergeManifest;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getTrend() {
        return trend;
    }

    public void setTrend(String trend) {
        this.trend = trend;
    }

    public String getRobust() {
        return robust;
    }

    public void setRobust(String robust) {
        this.robust = robust;
    }

    public String getRmSNPCH() {
        return rmSNPCH;
    }

    public void setRmSNPCH(String rmSNPCH) {
        this.rmSNPCH = rmSNPCH;
    }

    public String getDist() {
        return dist;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public String getMafcut() {
        return mafcut;
    }

    public void setMafcut(String mafcut) {
        this.mafcut = mafcut;
    }

    public String getLambda() {
        return lambda;
    }

    public void setLambda(String lambda) {
        this.lambda = lambda;
    }

    public String getC() {
        return C;
    }

    public void setC(String c) {
        C = c;
    }

    public String getMinProbes() {
        return minProbes;
    }

    public void setMinProbes(String minProbes) {
        this.minProbes = minProbes;
    }

    public String getAdjPvalDmr() {
        return adjPvalDmr;
    }

    public void setAdjPvalDmr(String adjPvalDmr) {
        this.adjPvalDmr = adjPvalDmr;
    }

    public String getMaxGap() {
        return maxGap;
    }

    public void setMaxGap(String maxGap) {
        this.maxGap = maxGap;
    }

    public String getCutoff() {
        return cutoff;
    }

    public void setCutoff(String cutoff) {
        this.cutoff = cutoff;
    }

    public String getPickCutoff() {
        return pickCutoff;
    }

    public void setPickCutoff(String pickCutoff) {
        this.pickCutoff = pickCutoff;
    }

    public String getSmooth() {
        return smooth;
    }

    public void setSmooth(String smooth) {
        this.smooth = smooth;
    }

    public String getSmoothFunction() {
        return smoothFunction;
    }

    public void setSmoothFunction(String smoothFunction) {
        this.smoothFunction = smoothFunction;
    }

    public String getUseWeights() {
        return useWeights;
    }

    public void setUseWeights(String useWeights) {
        this.useWeights = useWeights;
    }

    public String getPermutations() {
        return permutations;
    }

    public void setPermutations(String permutations) {
        this.permutations = permutations;
    }

    public String getB() {
        return B;
    }

    public void setB(String b) {
        B = b;
    }

    public String getNullMethod() {
        return nullMethod;
    }

    public void setNullMethod(String nullMethod) {
        this.nullMethod = nullMethod;
    }

    public String getMinProbes1() {
        return minProbes1;
    }

    public void setMinProbes1(String minProbes1) {
        this.minProbes1 = minProbes1;
    }

    public String getAdjPvalDmr1() {
        return adjPvalDmr1;
    }

    public void setAdjPvalDmr1(String adjPvalDmr1) {
        this.adjPvalDmr1 = adjPvalDmr1;
    }

    public String getMeanLassoRadius() {
        return meanLassoRadius;
    }

    public void setMeanLassoRadius(String meanLassoRadius) {
        this.meanLassoRadius = meanLassoRadius;
    }

    public String getMinDmrSep() {
        return minDmrSep;
    }

    public void setMinDmrSep(String minDmrSep) {
        this.minDmrSep = minDmrSep;
    }

    public String getMinDmrSize() {
        return minDmrSize;
    }

    public void setMinDmrSize(String minDmrSize) {
        this.minDmrSize = minDmrSize;
    }

    public String getAdjPvalProbe() {
        return adjPvalProbe;
    }

    public void setAdjPvalProbe(String adjPvalProbe) {
        this.adjPvalProbe = adjPvalProbe;
    }

    public String getPDFplot() {
        return PDFplot;
    }

    public void setPDFplot(String PDFplot) {
        this.PDFplot = PDFplot;
    }

    public String getRplot() {
        return Rplot;
    }

    public void setRplot(String rplot) {
        Rplot = rplot;
    }

    public String getMax_block_length() {
        return max_block_length;
    }

    public void setMax_block_length(String max_block_length) {
        this.max_block_length = max_block_length;
    }

    public String getMax_dist() {
        return max_dist;
    }

    public void setMax_dist(String max_dist) {
        this.max_dist = max_dist;
    }

    public String getExpand() {
        return expand;
    }

    public void setExpand(String expand) {
        this.expand = expand;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getMain() {
        return main;
    }

    public void setMain(String main) {
        this.main = main;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }

    public String getFlag_command() {
        return flag_command;
    }

    public void setFlag_command(String flag_command) {
        this.flag_command = flag_command;
    }

    public List<File> getFileField_workflow() {
        return fileField_workflow;
    }

    public void setFileField_workflow(List<File> fileField_workflow) {
        this.fileField_workflow = fileField_workflow;
    }

    public List<String> getFileField_workflowFileName() {
        return fileField_workflowFileName;
    }

    public void setFileField_workflowFileName(List<String> fileField_workflowFileName) {
        this.fileField_workflowFileName = fileField_workflowFileName;
    }

    public String getStdoutlist_mapping() {
        return stdoutlist_mapping;
    }

    public void setStdoutlist_mapping(String stdoutlist_mapping) {
        this.stdoutlist_mapping = stdoutlist_mapping;
    }

    public String getStdoutlist_peak() {
        return stdoutlist_peak;
    }

    public void setStdoutlist_peak(String stdoutlist_peak) {
        this.stdoutlist_peak = stdoutlist_peak;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String customWorkflow() throws Exception {
        if (workflowCustom_zip.equals("GSE90060.zip")&&workflowCustom_mapping==5&&workflowCustom_peak==1) {
            flag ="1";
            workflowCustom_path = "/home/huxy/dataset/Demo1";
            workflowCustom_zip = "/home/huxy/GSE90060.zip";
            flag_command = "2";
            //生成运行起始时间
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String time = format.format(date);
            //写入XML文件，构建session
            xmlUtil xmlUtil = new xmlUtil();
            String JobId = "JobId_" + xmlUtil.generateString(6);
            xmlUtil.creatSession(JobId, time);

            //写入XML文件
            File file = new File(workflowCustom_zip);
            String name = file.getName();
            String JobID = xmlUtil.xmlAdd_Jobs_Demo(name, "WorkFlow Demo dataset1", "error", "email", time);
        }else if(workflowCustom_zip.equals("GSE100825.zip")&&workflowCustom_mapping==4&&workflowCustom_peak==1) {
            flag ="1";
            workflowCustom_path = "/home/huxy/dataset/Demo2";
            workflowCustom_zip = "/home/huxy/GSE100825.zip";
            flag_command = "2";
            //生成运行起始时间
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String time = format.format(date);
            //写入XML文件，构建session
            xmlUtil xmlUtil = new xmlUtil();
            String JobId = "JobId_" + xmlUtil.generateString(6);
            xmlUtil.creatSession(JobId, time);

            //写入XML文件
            File file = new File(workflowCustom_zip);
            String name = file.getName();
            String JobID = xmlUtil.xmlAdd_Jobs_Demo2(name, "WorkFlow Demo dataset2", "error", "email", time);
        }
        else {
            System.out.println(workflowCustom_peak);
            //生成运行起始时间
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String time = format.format(date);
            //构建session
            xmlUtil xmlUtil = new xmlUtil();
            String JobId = "JobId_" + xmlUtil.generateString(6);
            xmlUtil.creatSession(JobId, time);
            ///////////////////////////////upload///////////////////////////////////////////////////
            UploadUtil uploadUtil = new UploadUtil();
            String remote_zip;
            List<String> Upload_path = uploadUtil.upload(fileField_workflowFileName, fileField_workflow);
            remote_zip = Upload_path.get(0);
////////////////////////////////////////////////////////////////////////////////////////
            FileUtil fileUtil = new FileUtil();
            workflowCustom_path = fileUtil.Result_path();
            System.out.println(remote_zip);
            System.out.println(workflowCustom_path);

            File workflow_temp = new File(workflowCustom_path + "/workflow_input_temp.txt");
            if (!workflow_temp.exists()) {
                workflow_temp.createNewFile();
            } else {
                workflow_temp.delete();
                workflow_temp.createNewFile();
            }
            appendMethodB(workflowCustom_path + "/workflow_input_temp.txt", remote_zip + "\r\n");
            appendMethodB(workflowCustom_path + "/workflow_input_temp.txt", workflowCustom_path + "\r\n");

            if (workflowCustom_mapping == 1) {
                LoadAction loadAction = new LoadAction();
                loadAction.setMethValue(workflow_methValue);
                loadAction.setArraytype(arraytype_bmiq);
                loadAction.setPlot(4);
                loadAction.setInput_BMIQ_file(remote_zip);
                loadAction.setInput_BMIQ_path(workflowCustom_path);
                loadAction.setOptionalParameters_Load(workflowCustom_option_bmiq);

                loadAction.setAutoimpute(autoimpute1);

                loadAction.setDetPcut(detPcut);


                loadAction.setFilterMultiHit(filterMultiHit1);

                loadAction.setFilterSNPs(filterSNPs);
                loadAction.setFilterXY(filterXY);


                loadAction.setPlotBMIQ(plotBMIQ);
                loadAction.setCores(cores);
                System.out.println("workflow========"+detPcut);

                loadAction.BMIQ_noUpload();
                stdoutlist_mapping = loadAction.getStdoutlist();
            } else if (workflowCustom_mapping == 2) {
                PBCAction pbcAction = new PBCAction();
                pbcAction.setArraytype(arraytype_pbc);
                pbcAction.setMethValue(workflow_methValue);
                pbcAction.setInput_PBC_file(remote_zip);
                pbcAction.setInput_PBC_path(workflowCustom_path);
                pbcAction.setOptionalParameters_PBC(workflowCustom_option_pbc);
                pbcAction.setPlot(4);

                pbcAction.setAutoimpute(autoimpute2);

                pbcAction.setDetPcut(detPcut);



                pbcAction.setFilterMultiHit(filterMultiHit2);
                pbcAction.setFilterSNPs(filterSNPs);
                pbcAction.setFilterXY(filterXY);



                pbcAction.PBCnoUpload();
                stdoutlist_mapping = pbcAction.getStdoutlist();
            }else if (workflowCustom_mapping == 3){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                SWANAction swanAction=new SWANAction();
                swanAction.setMethValue(workflow_methValue);
                swanAction.setInput_SWAN_file(remote_zip);
                swanAction.setInput_SWAN_path(workflowCustom_path);
                swanAction.setPlot(4);

                swanAction.setDetPcut(detPcut);
                swanAction.setFilterSNPs(filterSNPs);
                swanAction.setFilterXY(filterXY);
                swanAction.setFilterCRO(filterCRO);
                swanAction.setArraytype(arraytype_swan);


                swanAction.SWANnoUpload();
                stdoutlist_mapping = swanAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 4){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                FunctionalNormalizeAction functionalNormalizeAction=new FunctionalNormalizeAction();
                functionalNormalizeAction.setMethValue(workflow_methValue);
                functionalNormalizeAction.setInput_FN_file(remote_zip);
                functionalNormalizeAction.setInput_FN_path(workflowCustom_path);
                functionalNormalizeAction.setOptionalParameters_FN(workflowCustom_option_FN);
                functionalNormalizeAction.setDetPcut(detPcut);
                functionalNormalizeAction.setFilterSNPs(filterSNPs);
                functionalNormalizeAction.setFilterXY(filterXY);
                functionalNormalizeAction.setFilterCRO(filterCRO);
                functionalNormalizeAction.setArraytype(arraytype_fn);

                functionalNormalizeAction.setBgCorr(bgCorr);
                functionalNormalizeAction.setKeepCN(keepCN);
                functionalNormalizeAction.setDyeCorr(dyeCorr);
                functionalNormalizeAction.setnPCs(nPCs);
                functionalNormalizeAction.setSex(sex);
                functionalNormalizeAction.setVerbose(verbose1);


                functionalNormalizeAction.FNnoUpload();
                stdoutlist_mapping = functionalNormalizeAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 5){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                IlluminaAction illuminaAction=new IlluminaAction();
                illuminaAction.setMethValue(workflow_methValue);
                illuminaAction.setInput_ILL_file(remote_zip);
                illuminaAction.setInput_ILL_path(workflowCustom_path);
                illuminaAction.setOptionalParameters_ill(workflowCustom_option_ILL);
                illuminaAction.setPlot(4);
                illuminaAction.setBg_correct(bg_correct);
                illuminaAction.setFilterCRO(filterCRO);
                illuminaAction.setFilterSNPs(filterSNPs);
                illuminaAction.setFilterXY(filterXY);
                illuminaAction.setArraytype(arraytype_ill);
                illuminaAction.setDetPcut(detPcut);


                illuminaAction.IllnoUpload();
                stdoutlist_mapping = illuminaAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 6){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                NoobAction noobAction=new NoobAction();
                noobAction.setMethValue(workflow_methValue);
                noobAction.setInput_Noob_file(remote_zip);
                noobAction.setInput_Noob_path(workflowCustom_path);
                noobAction.setOptionalParameters_index_Noob(workflowCustom_option_Noob);
                noobAction.setDetPcut(detPcut);
                noobAction.setFilterXY(filterXY);
                noobAction.setFilterSNPs(filterSNPs);
                noobAction.setFilterCRO(filterCRO);
                noobAction.setArraytype(arraytype_noob);
                noobAction.setPlot(4);

                noobAction.setOffset(offset);
                noobAction.setDyeCorr(dyeCorr);
                noobAction.setVerbose(verbose);

                noobAction.NoobnoUpload();
                stdoutlist_mapping = noobAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 7){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                SQNAction sqnAction=new SQNAction();
                sqnAction.setMethValue(workflow_methValue);
                sqnAction.setInput_SQN_file(remote_zip);
                sqnAction.setInput_SQN_path(workflowCustom_path);
                sqnAction.setOptionalParameters_SQN(workflowCustom_option_SQN);
                sqnAction.setPlot(4);
                sqnAction.setDetPcut(detPcut);
                sqnAction.setFilterXY(filterXY);
                sqnAction.setFilterSNPs(filterSNPs);
                sqnAction.setFilterCRO(filterCRO);
                sqnAction.setArraytype(arraytype_sqn);
                sqnAction.setFixOutliers(fixOutliers);
                sqnAction.setRemoveBadSamples(removeBadSamples);
                sqnAction.setBadSampleCutoff(badSampleCutoff);
                sqnAction.setQuantileNormalize(quantileNormalize);
                sqnAction.setStratified(stratified);
                sqnAction.setMergeManifest(mergeManifest);
                sqnAction.setVerbose(verbose);

                sqnAction.SQNnoUpload();
                stdoutlist_mapping = sqnAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 8){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                DasenAction dasenAction=new DasenAction();
                dasenAction.setMethValue(workflow_methValue);
                dasenAction.setInput_dasen_file(remote_zip);
                dasenAction.setInput_dasen_path(workflowCustom_path);
                dasenAction.setPlot(4);

                dasenAction.DasennoUpload();
                stdoutlist_mapping = dasenAction.getStdoutlist();
            }
            else if (workflowCustom_mapping == 9){
                if (workflow_methValue.equals("B")){
                    workflow_methValue="getBeta";
                }
                else{
                    workflow_methValue="getM";
                }
                RawAction rawAction=new RawAction();
                rawAction.setMethValue(workflow_methValue);
                rawAction.setInput_RAW_file(remote_zip);
                rawAction.setInput_RAW_path(workflowCustom_path);
                rawAction.setPlot(4);

                rawAction.RawnoUpload();
                stdoutlist_mapping = rawAction.getStdoutlist();
            }

/***************************************DMA***************************************************************/
            String workflow_exp,workflow_sam,workflow_sample=null;
            workflow_exp=workflowCustom_path+"/normalised_methylation_matrix.csv";
            System.out.println("EXP========="+workflow_exp);
            File temp= new File(remote_zip);
            workflow_sam=temp.getPath().substring(0,temp.getPath().length()-4);
            System.out.println("ASKJFHKSDHFSDKFHDSKJF==========="+workflow_sam);

            File temp1= new File(workflow_sam);
            if (temp1.isDirectory()) {
                File[] dirFile = temp1.listFiles();
                for (File f : dirFile) {
                    if (f.getName().endsWith(".csv")) {
                        workflow_sample = f.getAbsolutePath();
                        System.out.println("workflow_sample"+workflow_sample);
                    }else {
                        System.out.println("dhskjfhdskjfh");
                    }
                }
            }

//            //获取上传文件路径中的.csv文件
//
//            if (temp1.isDirectory()) {
//                File[] dirFile = temp1.listFiles();
//                for (File f : dirFile) {
//                        if (f.isDirectory())
//                        getName(f.getAbsolutePath());
//                    else {
//                        if (f.getName().endsWith(".csv")){
//                            workflow_sample=f.getAbsolutePath();
//                            System.out.println("workflow_sample"+workflow_sample);
//                        }
//                    }
//                }
//            }

            if (workflowCustom_peak == 1) {
                LimmaAction limmaAction=new LimmaAction();
                limmaAction.setInput_exprSet_file(workflow_exp);
                limmaAction.setInput_sampleSheet_file(workflow_sample);
                System.out.println(workflow_sample);
                limmaAction.setArraytype(arraytype_limma);
                limmaAction.setPlot(4);
                limmaAction.setP_Value("0.05");
                limmaAction.setLogFC("1");
                limmaAction.setLogFC1("1");
                limmaAction.setAdjPval(adjPval);
                limmaAction.setCor(workflowCustom_cor_limma);
                limmaAction.setCor1_type(cor1_type);
                limmaAction.setCor1(cor1);
//                if (workflowCustom_cor_limma==1){
//                    limmaAction.setCor(workflowCustom_cor_limma);
//                }else{}
                limmaAction.setInput_limma_path(workflowCustom_path);
                limmaAction.setOptionalParameters_limma(workflowCustom_option_limma);

                limmaAction.setProportion(proportion);
                limmaAction.setTrend(trend);
                limmaAction.setRobust(robust);
                limmaAction.LimmanoUpload();
                stdoutlist_peak = limmaAction.getStdoutlist();
            }
            else if (workflowCustom_peak == 2) {
                DmpFinderAction dmpFinderAction=new DmpFinderAction();
                dmpFinderAction.setInput_exprSetdmpfinder_file(workflow_exp);
                dmpFinderAction.setInput_sampleSheetdmpfinder_file(workflow_sample);
                System.out.println(workflow_sample);
                dmpFinderAction.setArraytype(arraytype_dmpfinder);
                dmpFinderAction.setAdjPval(adjPval_dmpfinder);

                dmpFinderAction.setInput_dmpfinder_path(workflowCustom_path);

                dmpFinderAction.dmpFindernoUpload();
                stdoutlist_peak = dmpFinderAction.getStdoutlist();
            }
            else if (workflowCustom_peak == 3) {
                SamrAction samrAction=new SamrAction();
                samrAction.setInput_exprSetsamr_file(workflow_exp);
                samrAction.setInput_sampleSheetsamr_file(workflow_sample);
                System.out.println(workflow_sample);
                samrAction.setArraytype(arraytype_samr);
                samrAction.setAdjPval(adjPval_samr);

                samrAction.setInput_samr_path(workflowCustom_path);

                samrAction.SamrnoUpload();
                stdoutlist_peak = samrAction.getStdoutlist();
            }
            else if (workflowCustom_peak == 4) {
                DMRCateAction dmrCateAction=new DMRCateAction();
                dmrCateAction.setInput_exprSetdmr_file(workflow_exp);
                dmrCateAction.setInput_sampleSheetdmr_file(workflow_sample);
                dmrCateAction.setArraytype(arraytype_dmrcate);
                dmrCateAction.setInput_DMRCATE_path(workflowCustom_path);
                dmrCateAction.setOptionalParameters_dmrcate(workflowCustom_option_dmrcate);
                dmrCateAction.setMethValue(workflow_methValue);

                dmrCateAction.setRmSNPCH(rmSNPCH);
                dmrCateAction.setDist(dist);
                dmrCateAction.setMafcut(mafcut);
                dmrCateAction.setLambda(lambda);
                dmrCateAction.setC(C);
                dmrCateAction.DMRCatenoUpload();
                stdoutlist_peak = dmrCateAction.getStdoutlist();
            }
            else if (workflowCustom_peak ==5) {
                BumphunterAction bumphunterAction=new BumphunterAction();
                bumphunterAction.setArraytype(arraytype_bum);
                bumphunterAction.setInput_bumphunter_path(workflowCustom_path);
                bumphunterAction.setInput_exprSetbum_file(workflow_exp);
                bumphunterAction.setInput_sampleSheetbum_file(workflow_sample);
                bumphunterAction.setOptionalParameters_bumphunter(workflowCustom_option_bumphunter);

                bumphunterAction.setMinProbes(minProbes);
                bumphunterAction.setAdjPvalDmr(adjPvalDmr);
                bumphunterAction.setMaxGap(maxGap);
                bumphunterAction.setCutoff(cutoff);
                bumphunterAction.setPickCutoff(pickCutoff);
                bumphunterAction.setSmooth(smooth);
                bumphunterAction.setSmoothFunction(smoothFunction);
                bumphunterAction.setUseWeights(useWeights);
                bumphunterAction.setPermutations(permutations);
                bumphunterAction.setB(B);
                bumphunterAction.setNullMethod(nullMethod);

                bumphunterAction.BumphunternoUpload();
                stdoutlist_peak = bumphunterAction.getStdoutlist();
            }
            else if (workflowCustom_peak == 6) {
                LassoAction lassoAction=new LassoAction();
                lassoAction.setArraytype(arraytype_las);
                lassoAction.setInput_exprSetpro_file(workflow_exp);
                lassoAction.setInput_sampleSheetpro_file(workflow_sample);
                lassoAction.setInput_lasso_path(workflowCustom_path);
                lassoAction.setOptionalParameters_probeLasso(workflowCustom_option_lasso);

                lassoAction.setMinProbes(minProbes1);
                lassoAction.setAdjPvalDmr(adjPvalDmr1);
                lassoAction.setMeanLassoRadius(meanLassoRadius);
                lassoAction.setMinDmrSep(minDmrSep);
                lassoAction.setMinDmrSize(minDmrSize);
                lassoAction.setAdjPvalProbe(adjPvalProbe);
                lassoAction.setPDFplot(PDFplot);
                lassoAction.setRplot(Rplot);

                lassoAction.LassonoUpload();
                stdoutlist_peak = lassoAction.getStdoutlist();
            }
            else if (workflowCustom_peak == 7) {
                SeqlmAction seqlmAction=new SeqlmAction();
                seqlmAction.setInput_exprSetseq_file(workflow_exp);
                seqlmAction.setInput_sampleSheetseq_file(workflow_sample);
                seqlmAction.setInput_seqlm_path(workflowCustom_path);
                seqlmAction.setOptionalParameters_seqlm(workflowCustom_option_seqlm);

                seqlmAction.setMax_block_length(max_block_length);
                seqlmAction.setMax_dist(max_dist);
                seqlmAction.setExpand(expand);
                seqlmAction.setWidth(width);
                seqlmAction.setHeight(height);
                seqlmAction.setDpi(dpi);
                seqlmAction.setMain(main);
                seqlmAction.SeqlmanoUpload();
                stdoutlist_peak = seqlmAction.getStdoutlist();
            }


            //写入XML文件
            File file = new File(remote_zip);
            String name = file.getName();
            xmlUtil.xmlAdd_Jobs(JobId,name,"WorkFlow","ERROR","email",time);

            //将结果压缩
            FileUtil fileUtil2=new FileUtil();
            fileUtil2.ZipMultiFile("/home/huxy/dataset/" + JobId, "/home/huxy/dataset/" + JobId + ".zip.tar");

        }
            flag="2";
            return SUCCESS;
        }

    public static void printList(List<String> list){
        for (String string : list){
            System.out.println(string);
        }
    }
    public static void appendMethodB(String fileName, String content){
        try {
            FileWriter writer = new FileWriter(fileName, true);
            writer.write(content);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void validate(){
        //先验证有没有登录

//      if(workflowCustom_zip.equals("")){
//          this.addFieldError("workflowCustom_zip", "Please input the zip file.");
//      }
      if(workflowCustom_mapping!=1&&workflowCustom_mapping!=2&&workflowCustom_mapping!=3&&workflowCustom_mapping!=4&&workflowCustom_mapping!=5&&workflowCustom_mapping!=6&&workflowCustom_mapping!=7&&workflowCustom_mapping!=8&&workflowCustom_mapping!=9){
          this.addFieldError("workflowCustom_mapping", "Please choose the pre-processing tool.");
      }
      if(workflowCustom_peak!=1&&workflowCustom_peak!=2&&workflowCustom_peak!=3&&workflowCustom_peak!=4&&workflowCustom_peak!=5&&workflowCustom_peak!=6&&workflowCustom_peak!=7){
            this.addFieldError("workflowCustom_peak", "Please choose the differential methylation analysis tool.");
        }
       /* xmlUtil xmlUtil=new xmlUtil();
        xmlUtil.login_validate();*/
        try{
            UploadUtil uploadUtil=new UploadUtil();
            if(!uploadUtil.Check(fileField_workflowFileName,fileField_workflow)){
                /*HttpServletResponse response = ServletActionContext.getResponse();
                response.setContentType("text/html; charset=utf-8");
                response.getWriter().println("<script language='javascript'>alert('The file should be in right format and right size!');</script>");*/
                this.addFieldError("check1", "The file should be in right format and right size!");
            }
        }catch(Exception e){
        }

        if(check()){
            this.addFieldError("check1", "The input contain invalid characters! ");
        }
        }

    public boolean check() {
        String[] characterParams = {"~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")", ";", "\"", "'", "\\", "<", ">", "?", "/", "<<", ">>", "+"};
        boolean status = false;
        Map paramMap = ServletActionContext.getRequest().getParameterMap();
        Set<String> set = paramMap.keySet();
        String value="";
            for(Object aaa: set.toArray()){
                value = ((String[])paramMap.get(aaa))[0];
                for (int i = 0; i < characterParams.length; i++) {
                    if (value.indexOf(characterParams[i]) >= 0) {
                        status = true;
                        break;
                    }
                }
            }
        return status;
    }
}