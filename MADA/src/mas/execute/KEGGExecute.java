package mas.execute;

import mas.bean.KEGGBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/4/2.
 */
public class KEGGExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void KEGG_exe(KEGGBean keggBean) throws IOException {
        String temp=keggBean.getInput_kegg().substring(0,keggBean.getInput_kegg().length()-4)+".R";
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
        appendMethodB(temp,"myDMPdir=\""+keggBean.getInput_kegg()+"\"\n");
        appendMethodB(temp,"value=read.csv(myDMPdir)\n");
        appendMethodB(temp,"rownames(value)=value[,1]\n" +
                "value=value[,-1]\n" +
                "value=as.matrix(value)\n");
        appendMethodB(temp,"sigCpGs=rownames(value)\n");
        appendMethodB(temp,"sigCpGs=as.character(sigCpGs)\n");
        appendMethodB(temp,"kst=gometh(sigCpGs,all.cpg = NULL, collection =\"KEGG\", array.type =\""+keggBean.getArraytype()+"\","+keggBean.getOption()+")\n");
        appendMethodB(temp,"write.table(kst, file = \""+keggBean.getPath_kegg()+"/myKEGG.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

        if (keggBean.getPlot()==1){
            appendMethodB(temp,"library(limma)\n");
            appendMethodB(temp,"library(ggplot2)\n");
            appendMethodB(temp,"kst$richFactor<-kst$DE/kst$N\n");
            appendMethodB(temp,"kegg<-topKEGG(kst,number="+keggBean.getNumber()+")\n");
            appendMethodB(temp,"p <-ggplot(kegg,aes(richFactor,Pathway))+geom_point()+geom_point(aes(size=DE))\n");
            appendMethodB(temp,"pbubble = p + geom_point(aes(size=DE,color=-1*log10(P.DE)))\n");
            appendMethodB(temp,"pbubble+scale_colour_gradient(low=\"green\",high=\"red\")\n");
            appendMethodB(temp,"pr <- pbubble + scale_colour_gradient(low=\"green\",high=\"red\") +labs(color=expression(-log10(P.DE)),size=\"Gene number\"+theme_bw())+theme_bw()\n");
            appendMethodB(temp,"ggsave(\"" + keggBean.getPath_kegg() + "/KEGG_bubble_diagram.pdf\")\n");
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
