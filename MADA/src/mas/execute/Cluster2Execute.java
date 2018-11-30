package mas.execute;

import mas.bean.Cluster2Bean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 */
public class Cluster2Execute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void Cluster2_exe(Cluster2Bean cluster2Bean) throws IOException {
        String temp=cluster2Bean.getInput_cluster2().substring(0,cluster2Bean.getInput_cluster2().length()-4)+".R";
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(cluster)\n" +
                "library(Biobase)\n" +
                "library(genefilter)\n" +
                "library(latticeExtra)\n");
        appendMethodB(temp,"my.colorFct <- function(n = 50, low.col = 0.45, high.col=1, saturation = 1) { \n" +
                "if (n < 2) stop(\"n must be greater than 2\")\n" +
                "n1 <- n%/%2\n" +
                "n2 <- n - n1\n" +
                "c(hsv(low.col, saturation, seq(1,0,length=n1)), hsv(high.col, saturation, seq(0,1,length=n2))) \n" +
                "}\n");
        appendMethodB(temp,"myDMPdir=\""+cluster2Bean.getInput_cluster2()+"\"\n");
        appendMethodB(temp,"value=read.csv(myDMPdir)\n");
        appendMethodB(temp,"rownames(value)=value[,1]\n" +
                "value=value[,-1]\n" +
                "value=as.matrix(value)\n" +
                "eset2=value\n");
        appendMethodB(temp,"mydatascale <- t(scale(t(value)))\n" +
                "hr <- hclust(as.dist(1-cor(t(mydatascale), method=\"pearson\")), method=\"mcquitty\")\n" +
                "hc <- hclust(as.dist(1-cor(mydatascale, method=\"spearman\")), method=\"average\")\n" +
                "mycl <- cutree(hr, h=max(hr$height)/1.5);\n" +
                "mycolhc <- sample(rainbow(256));mycolhc <- mycolhc[as.vector(mycl)]\n" +
                "myc2 <- cutree(hc, h=max(hc$height)/1.5); mycolhr <- sample(rainbow(256)); mycolhr <- mycolhr[as.vector(myc2)]\n");
        appendMethodB(temp,"pdf(paste(\""+cluster2Bean.getPath_clu2()+"/heatmap.pdf\"), width = 8, height = 8)\n");
        appendMethodB(temp,"heatmap(mydatascale, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=my.colorFct(), scale=\"row\", ColSideColors=mycolhr, RowSideColors=mycolhc,cexCol=0.5)\n" +
                "dev.off()\n");

        String cmd1="Rscript "+temp;
        System.out.println(cmd1);

        BaseExecute util1 = new BaseExecute();
        util1.executeCommand(cmd1);
        printList(util1.getStdoutList());
        StringBuffer sb=new StringBuffer();
        for(String item:util1.getErroroutList()){
            sb.append(item+"\n");
        }
        stdoutlist=stdoutlist+sb.toString();
        System.out.println("--------------------------");
        printList(util1.getErroroutList());
    }
    public static void printList(List<String> list) {
        for (String string : list) {
            System.out.println(string);
        }
    }
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
