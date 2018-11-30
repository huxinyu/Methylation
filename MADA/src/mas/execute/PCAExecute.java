package mas.execute;

import mas.bean.PCABean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 */
public class PCAExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void PCA_exe(PCABean pcaBean) throws IOException {
        String temp=pcaBean.getInput_pca().substring(0,pcaBean.getInput_pca().length()-4)+".R";
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"myDMPdir=\""+pcaBean.getInput_pca()+"\"\n");
        appendMethodB(temp,"value=read.csv(myDMPdir)\n");
        appendMethodB(temp,"rownames(value)=value[,1]\n");
        appendMethodB(temp,"value=value[,-1]\n");
        appendMethodB(temp,"value=as.matrix(value)\n");
        appendMethodB(temp,"value[sapply(value,is.infinite)]<-NA\n");
        appendMethodB(temp,"value=na.omit(value)\n");
        appendMethodB(temp,"pca=prcomp(t(value),scale=TRUE)\n");
        appendMethodB(temp,"pca.var <- pca$sdev^2\n" +
                "pca.var.per <- round(pca.var/sum(pca.var)*100,1)\n");
        appendMethodB(temp,"write.table(pca$x, file = \""+pcaBean.getPath_pca()+"/pca_x.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");
        appendMethodB(temp,"write.table(pca$rotation, file = \""+pcaBean.getPath_pca()+"/pca_rotation.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");
        appendMethodB(temp,"write.table(pca$scale, file = \""+pcaBean.getPath_pca()+"/pca_scale.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");
        appendMethodB(temp,"write.table(pca$center, file = \""+pcaBean.getPath_pca()+"/pca_center.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (pcaBean.getPlot()==1){
            appendMethodB(temp,"library(ggplot2)\n");
            appendMethodB(temp,"pca.data <- data.frame(Sample=rownames(pca$x),X=pca$x[,1],Y=pca$x[,2])\n");
            appendMethodB(temp,"ggplot(data=pca.data, aes(x=X, y=Y, label=Sample))+\n" +
                    "  geom_text() +\n" +
                    "  xlab(paste(\"PC1 - \", pca.var.per[1], \"%\", sep=\"\"))+\n" +
                    "  ylab(paste(\"PC2 - \", pca.var.per[2], \"%\", sep=\"\"))+\n" +
                    "  theme_bw()+\n" +
                    "  ggtitle(\"My PCA Graph\")\n");
            appendMethodB(temp,"ggsave(\"" + pcaBean.getPath_pca() + "/XY_scheme.pdf\")\n");
        }else{
            appendMethodB(temp,"");
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
