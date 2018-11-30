package mas.execute;

import mas.bean.PBCBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class PBCExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public void PBC_execute(PBCBean pbcBean) throws IOException {
        //解压idat文件
        String dirzip=pbcBean.getDirectory();
        File file1 = new File(pbcBean.getDirectory());
        String unzipdir=file1.getParent();
        String cmd0="unzip "+dirzip+" -d "+unzipdir;
        System.out.println(cmd0);
        BaseExecute util=new BaseExecute();
        util.executeCommand(cmd0);
        //要批处理的R文件
        String temp=pbcBean.getDirectory().substring(0,pbcBean.getDirectory().length()-4)+".R";
        System.out.println("temp======"+temp);
        //获得解压后的路径
        unzipdir=pbcBean.getDirectory().substring(0,pbcBean.getDirectory().length()-4);
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
        appendMethodB(temp,"myLoad=champ.load(directory=\""+unzipdir+"\",methValue=\""+pbcBean.getMethValue()+"\",arraytype=\""+pbcBean.getArraytype()+"\","+",method=\"minfi\",force=TRUE,filterDetP=TRUE,detPcut="+pbcBean.getDetPcut()+",filterSNPs="+pbcBean.getFilterSNPs()+",filterXY="+pbcBean.getFilterXY()+","+pbcBean.getOption()+")\n");
        appendMethodB(temp,"myNorm=champ.norm(resultsDir=\""+pbcBean.getResultsDir()+"\",method=\"PBC\")\n");
        appendMethodB(temp,"write.table(myNorm, file = \""+pbcBean.getResultsDir()+"/normalised_methylation_matrix.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (pbcBean.getPlot()==1){
            appendMethodB(temp,"pdf(\"" + pbcBean.getResultsDir() + "/mdsPlot.pdf\")\n");
            appendMethodB(temp,"mdsPlot(myLoad$beta, numPositions = 1000,main=\"MDS 1000 most variable positions(original)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(myNorm, numPositions = 1000, main=\"MDS 1000 most variable positions(PBC)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (pbcBean.getPlot()==2){
            appendMethodB(temp,"pdf(\"" + pbcBean.getResultsDir() + "/densityPlot.pdf\")\n");
            appendMethodB(temp,"densityPlot(myLoad$beta, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of original data (\", nrow(myLoad$beta), \" probes)\", sep = \"\"), xlab = \""+pbcBean.getMethValue()+"\")\n");
            appendMethodB(temp,"densityPlot(myNorm, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of preprocessing(PBC) data (\", nrow(myNorm), \" probes)\", sep = \"\"), xlab = \""+pbcBean.getMethValue()+"\")\n");
            appendMethodB(temp,"dev.off()\n");
        }
        else if (pbcBean.getPlot()==3){
            appendMethodB(temp,"n.sample=ncol(myLoad$beta)\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + pbcBean.getResultsDir() + "/boxplot.pdf\")\n");
            appendMethodB(temp,"boxplot(myLoad$beta,, main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(myNorm,, main =\"PBC\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"dev.off()\n");
        }else {
            appendMethodB(temp,"n.sample=ncol(myLoad$beta)\n");
            appendMethodB(temp,"if(n.sample>40) par(cex = 0.5)\n");
            appendMethodB(temp,"cols <- rainbow(n.sample*1.2)\n");
            appendMethodB(temp,"pdf(\"" + pbcBean.getResultsDir() + "/all plots of preprocessing.pdf\")\n");
            appendMethodB(temp,"mdsPlot(myLoad$beta, numPositions = 1000,main=\"MDS 1000 most variable positions(original)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"mdsPlot(myNorm, numPositions = 1000, main=\"MDS 1000 most variable positions(PBC)\",sampGroups =myLoad$pd$Sample_Group)\n");
            appendMethodB(temp,"densityPlot(myLoad$beta, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of original data (\", nrow(myLoad$beta), \" probes)\", sep = \"\"), xlab = \"Beta\")\n");
            appendMethodB(temp,"densityPlot(myNorm, sampGroups=myLoad$pd$Sample_Group, main = paste(\"Density plot of preprocessing(PBC) data (\", nrow(myNorm), \" probes)\", sep = \"\"), xlab = \"Beta\")\n");
            appendMethodB(temp,"boxplot(myLoad$beta,, main =\"original\",cex.axis=0.4,las=2,col=cols)\n");
            appendMethodB(temp,"boxplot(myNorm,, main =\"PBC\",cex.axis=0.4,las=2,col=cols)\n");
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
