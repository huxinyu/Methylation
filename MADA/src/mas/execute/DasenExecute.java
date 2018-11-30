package mas.execute;

import mas.bean.DasenBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/4/16.
 */
public class DasenExecute {
    private String stdoutlist;

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public void Dasen_execute(DasenBean dasenBean) throws IOException{
        //解压idat文件
        String dirzip = dasenBean.getDirectory();
        File file1 = new File(dasenBean.getDirectory());
        String unzipdir = file1.getParent();
        String cmd0 = "unzip " + dirzip + " -d " + unzipdir;
        System.out.println(cmd0);
        BaseExecute util = new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp = dasenBean.getDirectory().substring(0, dasenBean.getDirectory().length() - 4) + ".R";
        System.out.println("temp======" + temp);
        //获得解压后的路径
        unzipdir = dasenBean.getDirectory().substring(0, dasenBean.getDirectory().length() - 4);
        System.out.println("unzip======" + unzipdir);
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"suppressPackageStartupMessages(require('methylumi'))\n" +
                "suppressPackageStartupMessages(require('TCGAMethylation450k'))\n" +
                "suppressPackageStartupMessages(require('FDb.InfiniumMethylation.hg19'))\n");
        appendMethodB(temp,"library(wateRmelon)\n");
        appendMethodB(temp,"idatPath=file.path(\"" + unzipdir + "\")\n");
        appendMethodB(temp,"mset450k <- methylumIDAT(getBarcodes(path=idatPath), idatPath=idatPath)\n");
        appendMethodB(temp,"preprodasen <- dasen(mset450k)\n");
        if (dasenBean.getMethValue().equals("getBeta")){
            appendMethodB(temp,"bet<-betas(preprodasen)\n");
        }else
        {
            appendMethodB(temp,"bet=estimateM(preprodasen, returnType=\"matrix\")\n");
        }
        appendMethodB(temp,"write.csv(bet, file =\""+dasenBean.getResultsDir()+"/normalised_methylation_matrix.csv\")\n");
        appendMethodB(temp, "library(minfi)" + "\n");
        appendMethodB(temp, "targets<-read.metharray.sheet(idatPath)\n");
        appendMethodB(temp, "RGset<-read.metharray.exp(targets = targets)\n");
        appendMethodB(temp, "myRaw=preprocessRaw(RGset)\n");

        if (dasenBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + dasenBean.getResultsDir() + "/mdsPlot.pdf\"\n");
            appendMethodB(temp,"mdsPlot("+dasenBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(bet,numPositions = 1000, main=\"MDS 1000 most variable positions(Dasen)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (dasenBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + dasenBean.getResultsDir() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot("+dasenBean.getMethValue()+"(myRaw), sampGroups=targets$Sample_Group, xlab = \"  \",main = paste(\"Density plot of original data (\", nrow("+dasenBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot(bet, sampGroups=targets$Sample_Group, xlab = \"  \",main = paste(\"Density plot of preprocessing data (\", nrow(bet), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (dasenBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol("+dasenBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + dasenBean.getResultsDir() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot("+dasenBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(bet,main =\"Dasen\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"n.sample=ncol("+dasenBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + dasenBean.getResultsDir() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+dasenBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(bet,numPositions = 1000, main=\"MDS 1000 most variable positions(Dasen)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"densityPlot("+dasenBean.getMethValue()+"(myRaw), sampGroups=targets$Sample_Group,xlab = \"  \", main = paste(\"Density plot of original data (\", nrow("+dasenBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"densityPlot(bet, sampGroups=targets$Sample_Group, xlab = \"  \",main = paste(\"Density plot of preprocessing data (\", nrow(bet), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"boxplot("+dasenBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(bet,main =\"Dasen\",cex.axis=0.4,las=2,col=cols)\n");

            appendMethodB(temp,"dev.off()\n");
        }

        String cmd1 = "Rscript " + temp;
        System.out.println(cmd1);
        util.executeCommand(cmd1);
        printList(util.getErroroutList());
        StringBuffer sb = new StringBuffer();
        for(
                String item:util.getErroroutList())

        {
            sb.append(item + "\n");
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
