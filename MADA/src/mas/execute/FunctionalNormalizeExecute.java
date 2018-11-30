package mas.execute;

import mas.bean.FunctionalNormalizeBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class FunctionalNormalizeExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void FunctionalNormalize_execute(FunctionalNormalizeBean functionalNormalizeBean) throws IOException {
        //解压idat文件
        String dirzip=functionalNormalizeBean.getDirectory();
        File file1 = new File(functionalNormalizeBean.getDirectory());
        String unzipdir=file1.getParent();
        String cmd0="unzip "+dirzip+" -d "+unzipdir;
        System.out.println(cmd0);
        BaseExecute util=new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp=functionalNormalizeBean.getDirectory().substring(0,functionalNormalizeBean.getDirectory().length()-4)+".R";
        System.out.println("temp======"+temp);
        //获得解压后的路径
        unzipdir=functionalNormalizeBean.getDirectory().substring(0,functionalNormalizeBean.getDirectory().length()-4);
        System.out.println("unzip======"+unzipdir);
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }

        appendMethodB(temp,"library(minfi)"+"\n");
        appendMethodB(temp,"dir=file.path(\"" + unzipdir + "\")\n");
        appendMethodB(temp,"targets=read.metharray.sheet(dir)\n");
        appendMethodB(temp,"RGset=read.metharray.exp(targets = targets)\n");
        //更改样例名
        appendMethodB(temp,"targets$ID=paste(targets$Sample_Group,targets$Sample_Name,sep=\".\")\n");
        appendMethodB(temp,"sampleNames(RGset)=targets$ID\n");

        appendMethodB(temp,"myRaw=preprocessRaw(RGset)\n");
        //rmdetp
        appendMethodB(temp,"detP <- detectionP(RGset)\n");
        appendMethodB(temp,"truesum=rowSums(detP<"+functionalNormalizeBean.getDetPcut()+")==ncol(myRaw)\n");
        appendMethodB(temp,"rmdetP=RGset[truesum,]\n");

        appendMethodB(temp,"myNorm=preprocessFunnorm(rmdetP,"+functionalNormalizeBean.getOption()+")\n");

        //rmxy
        if (functionalNormalizeBean.getFilterXY().equals("TRUE")) {
            if (functionalNormalizeBean.getArraytype().equals("450K")) {
                appendMethodB(temp, "library(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
                appendMethodB(temp, "ann450k = getAnnotation(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
                appendMethodB(temp, "keep <- !(featureNames(myNorm) %in% ann450k$Name[ann450k$chr %in%c(\"chrX\",\"chrY\")])\n");
                appendMethodB(temp, "myNorm=myNorm[keep,]\n");
            }else {
                appendMethodB(temp,"library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
                appendMethodB(temp,"ann=getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
                appendMethodB(temp, "keep <- !(featureNames(myNorm) %in% ann$Name[ann$chr %in%c(\"chrX\",\"chrY\")])\n");
                appendMethodB(temp, "myNorm=myNorm[keep,]\n");
            }
        }
        //rmsnp
        if (functionalNormalizeBean.getFilterSNPs().equals("TRUE")) {
            appendMethodB(temp, "RGrmXY =mapToGenome(myNorm)\n");
            appendMethodB(temp, "myNorm= dropLociWithSnps (RGrmXY)\n");
        }
        //rmcro
        if (functionalNormalizeBean.getFilterCRO().equals("TRUE")){
            appendMethodB(temp,"dataDirectory <- \"/home/bio/huxy/data\"\n");
            appendMethodB(temp,"xReactiveProbes <- read.csv(file=paste(dataDirectory," + "\"48639-non-specific-probes-Illumina450k.csv\",sep=\"/\"), stringsAsFactors=FALSE)\n");
            appendMethodB(temp,"Keep=!(featureNames(myNorm) %in%xReactiveProbes$TargetID)\n");
            appendMethodB(temp,"myNorm=myNorm[Keep,]\n");
        }

        appendMethodB(temp, "write.table(" + functionalNormalizeBean.getMethValue() + "(myNorm),file = \"" + functionalNormalizeBean.getResultsDir() + "/normalised_methylation_matrix.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (functionalNormalizeBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + functionalNormalizeBean.getResultsDir() + "/mdsPlot.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+functionalNormalizeBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot("+functionalNormalizeBean.getMethValue()+"(myNorm), numPositions = 1000, main=\"MDS 1000 most variable positions(Funnorm)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (functionalNormalizeBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + functionalNormalizeBean.getResultsDir() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot("+functionalNormalizeBean.getMethValue()+"(myRaw), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+functionalNormalizeBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot("+functionalNormalizeBean.getMethValue()+"(myNorm), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of preprocessing(Funnorm) data (\", nrow("+functionalNormalizeBean.getMethValue()+"(myNorm)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (functionalNormalizeBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol("+functionalNormalizeBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + functionalNormalizeBean.getResultsDir() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot("+functionalNormalizeBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot("+functionalNormalizeBean.getMethValue()+"(myNorm),main =\"Funnorm\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"n.sample=ncol("+functionalNormalizeBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + functionalNormalizeBean.getResultsDir() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+functionalNormalizeBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot("+functionalNormalizeBean.getMethValue()+"(myNorm), numPositions = 1000, main=\"MDS 1000 most variable positions(Funnorm)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"densityPlot("+functionalNormalizeBean.getMethValue()+"(myRaw), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+functionalNormalizeBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot("+functionalNormalizeBean.getMethValue()+"(myNorm),xlab = \"  \", sampGroups=targets$Sample_Group, main = paste(\"Density plot of preprocessing(Funnorm) data (\", nrow("+functionalNormalizeBean.getMethValue()+"(myNorm)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"boxplot("+functionalNormalizeBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot("+functionalNormalizeBean.getMethValue()+"(myNorm),main =\"Funnorm\",cex.axis=0.4,las=2,,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }

        String cmd1="Rscript "+temp;
        System.out.println(cmd1);

        util.executeCommand(cmd1);
        printList(util.getErroroutList());
    }
    public static void printList(List<String> list) {
        for (String string : list) {
            System.out.println(string);
        }
    }
    /*
    直接使用appendMethodB（）方法
     */
    public static void appendMethodB(String fileName, String content) {
        try {
            FileWriter writer = new FileWriter(fileName, true);
            writer.write(content);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
