package mas.execute;

import mas.bean.Cluster1Bean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 */
public class Cluster1Execute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void Cluster1_exe(Cluster1Bean cluster1Bean) throws IOException {
        String temp=cluster1Bean.getInput_input_cluster1().substring(0,cluster1Bean.getInput_input_cluster1().length()-4)+".R";
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(cluster)\n"+ "library(Biobase)\n" + "library(genefilter)\n" + "library(latticeExtra)\n");
        appendMethodB(temp,"myDMPdir=\""+cluster1Bean.getInput_input_cluster1()+"\"\n");
        appendMethodB(temp,"value=read.csv(myDMPdir)\n");
        appendMethodB(temp,"rownames(value)=value[,1]\n" +
                "value=value[,-1]\n" +
                "value=as.matrix(value)\n" +
                "eset2=value\n");

        if (cluster1Bean.getPlot()==1){
            appendMethodB(temp,"dd=dist2(log2(eset2))\n" +
                    "diag(dd) <- 0\n" +
                    "dd.row <- as.dendrogram(hclust(as.dist(dd)"+cluster1Bean.getOption()+"))\n" +
                    "row.ord <- order.dendrogram(dd.row)\n" +
                    "legend <- list(top = list(fun = dendrogramGrob,args = list(x = dd.row, side = \"top\")))\n" +
                    "lp <- levelplot(dd[row.ord, row.ord],scales = list(x = list(rot = 90)),xlab = \"\", ylab = \"\", legend = legend)\n");
            appendMethodB(temp,"pdf(paste(\""+cluster1Bean.getPath_clu1()+"/clustering_diagram.pdf\"), width = 8, height = 8)\n");
            appendMethodB(temp,"plot(lp)\n" +
                    "dev.off()\n");
        }else {
            appendMethodB(temp,"data.hc=hclust(dist(t(value))"+cluster1Bean.getOption()+")\n");
            appendMethodB(temp,"pdf(file=\""+cluster1Bean.getPath_clu1()+"/dendrogram.pdf\",width = 22,height = 12)\n");
            appendMethodB(temp,"plot(data.hc, hang = -1)\n");
            appendMethodB(temp,"dev.off()\n");
        }
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
