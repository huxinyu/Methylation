package mas.execute;

import mas.bean.NoobBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/2/27.
 */
public class NoobExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void Noob_execute(NoobBean noobBean) throws IOException {
        //解压idat文件
        String dirzip=noobBean.getDirectory();
        File file1 = new File(noobBean.getDirectory());
        String unzipdir=file1.getParent();
        String cmd0="unzip "+dirzip+" -d "+unzipdir;
        System.out.println(cmd0);
        BaseExecute util=new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp=noobBean.getDirectory().substring(0,noobBean.getDirectory().length()-4)+".R";
        System.out.println("temp======"+temp);
        //获得解压后的路径
        unzipdir=noobBean.getDirectory().substring(0,noobBean.getDirectory().length()-4);
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
        appendMethodB(temp,"truesum=rowSums(detP<"+noobBean.getDetPcut()+")==ncol(myRaw)\n");
        appendMethodB(temp,"rmdetP=RGset[truesum,]\n");

        appendMethodB(temp,"myNorm=preprocessNoob(rmdetP,"+noobBean.getOption()+")\n");
        //rmxy
        if (noobBean.getFilterXY().equals("TRUE")) {
            if (noobBean.getArraytype().equals("450K")) {
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
        if (noobBean.getFilterSNPs().equals("TRUE")) {
            appendMethodB(temp, "RGrmXY =mapToGenome(myNorm)\n");
            appendMethodB(temp, "myNorm= dropLociWithSnps (RGrmXY)\n");
        }
        //rmcro
        if (noobBean.getFilterCRO().equals("TRUE")){
            appendMethodB(temp,"dataDirectory <- \"/home/bio/huxy/data\"\n");
            appendMethodB(temp,"xReactiveProbes <- read.csv(file=paste(dataDirectory," + "\"48639-non-specific-probes-Illumina450k.csv\",sep=\"/\"), stringsAsFactors=FALSE)\n");
            appendMethodB(temp,"Keep=!(featureNames(myNorm) %in%xReactiveProbes$TargetID)\n");
            appendMethodB(temp,"myNorm=myNorm[Keep,]\n");
        }

        appendMethodB(temp,"write.table("+noobBean.getMethValue()+"(myNorm),file = \"" + noobBean.getPath()+"/normalised_methylation_matrix.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");


        if (noobBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + noobBean.getPath() + "/mdsPlot.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+noobBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot("+noobBean.getMethValue()+"(myNorm), numPositions = 1000, main=\"MDS 1000 most variable positions(Noob)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (noobBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + noobBean.getPath() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot("+noobBean.getMethValue()+"(myRaw), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+noobBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot("+noobBean.getMethValue()+"(myNorm),xlab = \"  \", sampGroups=targets$Sample_Group, main = paste(\"Density plot of preprocessing(Noob) data (\", nrow("+noobBean.getMethValue()+"(myNorm)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (noobBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol("+noobBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + noobBean.getPath() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot("+noobBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot("+noobBean.getMethValue()+"(myNorm),, main =\"Noob\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"n.sample=ncol("+noobBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + noobBean.getPath() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+noobBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot("+noobBean.getMethValue()+"(myNorm), numPositions = 1000, main=\"MDS 1000 most variable positions(Noob)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"densityPlot("+noobBean.getMethValue()+"(myRaw), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+noobBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot("+noobBean.getMethValue()+"(myNorm), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of preprocessing(Noob) data (\", nrow("+noobBean.getMethValue()+"(myNorm)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"boxplot("+noobBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot("+noobBean.getMethValue()+"(myNorm),, main =\"Noob\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }
        String cmd1="Rscript "+temp;
        System.out.println(cmd1);
        util.executeCommand(cmd1);
        printList(util.getErroroutList());
        StringBuffer sb=new StringBuffer();
        for(String item:util.getErroroutList()){
            sb.append(item+"\n");
        }
        stdoutlist=stdoutlist+sb.toString();
        System.out.println("--------------------------");
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
