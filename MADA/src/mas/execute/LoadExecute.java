package mas.execute;

import mas.bean.LoadBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/11/30.
 */
public class LoadExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public void Load_execute(LoadBean loadBean) throws IOException{
        //解压idat文件
        String dirzip=loadBean.getDirectory();
        File file1 = new File(loadBean.getDirectory());
        String unzipdir=file1.getParent();
        String cmd0="unzip "+dirzip+" -d "+unzipdir;
        System.out.println(cmd0);
        BaseExecute util=new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp=loadBean.getDirectory().substring(0,loadBean.getDirectory().length()-4)+".R";
        System.out.println("temp======"+temp);
        //获得解压后的路径
        unzipdir=loadBean.getDirectory().substring(0,loadBean.getDirectory().length()-4);
        System.out.println("unzip======"+unzipdir);
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }

        appendMethodB(temp,"library(ChAMP)"+"\n");
        appendMethodB(temp,"myLoad=champ.load(directory=\""+unzipdir+"\",methValue=\""+loadBean.getMethValue()+"\",arraytype=\""+loadBean.getArraytype()+"\","+",method=\"minfi\",force=TRUE,filterDetP=TRUE,detPcut="+loadBean.getDetPcut()+",filterSNPs="+loadBean.getFilterSNPs()+",filterXY="+loadBean.getFilterXY()+","+loadBean.getOption()+")\n");
        appendMethodB(temp,"myNorm=champ.norm(resultsDir=\""+loadBean.getResultsDir()+"\",method=\"BMIQ\","+loadBean.getOption1()+")\n");
        appendMethodB(temp,"write.table(myNorm, file = \""+loadBean.getResultsDir()+"/normalised_methylation_matrix.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (loadBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + loadBean.getResultsDir() + "/mdsPlot.pdf\")\n");
            appendMethodB(temp,"mdsPlot(myLoad$beta, numPositions = 1000,main=\"MDS 1000 most variable positions(original)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(myNorm, numPositions = 1000, main=\"MDS 1000 most variable positions(BMIQ)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (loadBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + loadBean.getResultsDir() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot(myLoad$beta, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of original data (\", nrow(myLoad$beta), \" probes)\", sep = \"\"), xlab = \""+loadBean.getMethValue()+"\")\n");
            appendMethodB(temp,"densityPlot(myNorm, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of preprocessing(BMIQ) data (\", nrow(myNorm), \" probes)\", sep = \"\"), xlab = \""+loadBean.getMethValue()+"\")\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (loadBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol(myLoad$beta)\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + loadBean.getResultsDir() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot(myLoad$beta,main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(myNorm,main =\"BMIQ\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"n.sample=ncol(myLoad$beta)\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + loadBean.getResultsDir() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot(myLoad$beta, numPositions = 1000,main=\"MDS 1000 most variable positions(original)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(myNorm, numPositions = 1000, main=\"MDS 1000 most variable positions(BMIQ)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"densityPlot(myLoad$beta, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of original data (\", nrow(myLoad$beta), \" probes)\", sep = \"\"), xlab = \"Beta\")\n");
            appendMethodB(temp,"densityPlot(myNorm, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of preprocessing(BMIQ) data (\", nrow(myNorm), \" probes)\", sep = \"\"), xlab = \"Beta\")\n");
            appendMethodB(temp,"boxplot(myLoad$beta,main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(myNorm,main =\"BMIQ\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }

//        appendMethodB(temp+"\\"+fileName,"save.image(\"1.RData\")"+"\n");
//        String cmd1="\"F:\\Program Files\\R\\R-3.3.2\\bin\\R.exe\"  CMD BATCH --vanilla --slave"+" "+"\""+temp+"\\"+fileName+"\"";
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
