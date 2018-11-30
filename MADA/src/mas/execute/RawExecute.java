package mas.execute;

import mas.bean.RawBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/19.
 */
public class RawExecute {
    private String stdoutlist;

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public void RAW_execute(RawBean rawBean) throws IOException {
        //解压idat文件
        String dirzip = rawBean.getDirectory();
        File file1 = new File(rawBean.getDirectory());
        String unzipdir = file1.getParent();
        String cmd0 = "unzip " + dirzip + " -d " + unzipdir;
        System.out.println(cmd0);
        BaseExecute util = new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp = rawBean.getDirectory().substring(0, rawBean.getDirectory().length() - 4) + ".R";
        System.out.println("temp======" + temp);
        //获得解压后的路径
        unzipdir = rawBean.getDirectory().substring(0, rawBean.getDirectory().length() - 4);
        System.out.println("unzip======" + unzipdir);
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp, "library(minfi)" + "\n");
        appendMethodB(temp, "dir<-file.path(\"" + unzipdir + "\")\n");
        appendMethodB(temp, "targets<-read.metharray.sheet(dir)\n");
        appendMethodB(temp, "RGset<-read.metharray.exp(targets = targets)\n");
        //更改样例名
        appendMethodB(temp,"targets$ID=paste(targets$Sample_Group,targets$Sample_Name,sep=\".\")\n");
        appendMethodB(temp,"sampleNames(RGset)=targets$ID\n");

        appendMethodB(temp, "myRaw=preprocessRaw(RGset)\n");
        appendMethodB(temp, "write.table("+rawBean.getMethValue()+"(myRaw), file = \"" + rawBean.getResultsDir() + "/normalised_methylation_matrix.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (rawBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + rawBean.getResultsDir() + "/mdsPlot.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+rawBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (rawBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + rawBean.getResultsDir() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot("+rawBean.getMethValue()+"(myRaw), xlab = \"  \",sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+rawBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (rawBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol("+rawBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + rawBean.getResultsDir() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot("+rawBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"library(ggplot2)\n");
            appendMethodB(temp,"n.sample=ncol("+rawBean.getMethValue()+"(myRaw))\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + rawBean.getResultsDir() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot("+rawBean.getMethValue()+"(myRaw), numPositions = 1000, main=\"MDS 1000 most variable positions(original)\",sampGroups = targets$Sample_Group)\n");
            appendMethodB(temp,"densityPlot("+rawBean.getMethValue()+"(myRaw),xlab = \"  \", sampGroups=targets$Sample_Group, main = paste(\"Density plot of original data (\", nrow("+rawBean.getMethValue()+"(myRaw)), \" probes)\", sep = \"\"))\n");
            appendMethodB(temp,"boxplot("+rawBean.getMethValue()+"(myRaw),main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
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
