package mas.execute;

import mas.bean.GOBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/4/2.
 */
public class GOExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void GO_exe(GOBean goBean) throws IOException {
        String temp=goBean.getInput_go().substring(0,goBean.getInput_go().length()-4)+".R";
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(missMethyl)\n");
        appendMethodB(temp,"library(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
        appendMethodB(temp,"library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
        appendMethodB(temp,"myDMPdir=\""+goBean.getInput_go()+"\"\n");
        appendMethodB(temp,"value=read.csv(myDMPdir)\n");
        appendMethodB(temp,"rownames(value)=value[,1]\n" +
                "value=value[,-1]\n" +
                "value=as.matrix(value)\n");
        appendMethodB(temp,"sigCpGs=rownames(value)\n");
        appendMethodB(temp,"sigCpGs=as.character(sigCpGs)\n");
        appendMethodB(temp,"gst=gometh(sigCpGs,all.cpg = NULL, collection =\"GO\", array.type =\""+goBean.getArraytype()+"\","+goBean.getOption()+")\n");
        appendMethodB(temp,"write.table(gst, file = \""+goBean.getPath_go()+"/myGO.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (goBean.getPlot()==1){
            appendMethodB(temp,"library(limma)\n");
            appendMethodB(temp,"library(ggplot2)\n");
            appendMethodB(temp,"go<-topGO(gst,number="+goBean.getNumber()+")\n");
            appendMethodB(temp,"CPCOLS <- c(\"#8DA1CB\", \"#FD8D62\", \"#66C3A5\")\n");
            appendMethodB(temp,"rego<-order(go[,\"Ont\"],go[,\"DE\"], decreasing = c(TRUE,FALSE),method=\"radix\")\n");
            appendMethodB(temp,"rego<-go[rego,]\n");
            appendMethodB(temp,"rego$Term<-factor(rego$Term,levels = rego$Term)\n");
            appendMethodB(temp,"ggplot(rego,aes(y=DE,x=Term,group=factor(1),fill=Ont))+geom_bar(stat=\"identity\", width=0.8) + coord_flip() +scale_fill_manual(values = CPCOLS)+theme_bw() +scale_x_discrete(labels=rego$Term) +xlab(\"GO Term\") + theme(axis.text=element_text(face = \"bold\", color=\"gray50\")) +labs(title = \"The Most Enriched GO Terms\")\n");
            appendMethodB(temp,"ggsave(\"" + goBean.getPath_go() + "/GO_histogram.pdf\")\n");
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
